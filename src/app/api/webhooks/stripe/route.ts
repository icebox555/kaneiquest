import { headers } from "next/headers";
import { NextResponse } from "next/server";
import { stripe } from "@/lib/stripe/server";
import { createClient } from "@supabase/supabase-js";
import Stripe from "stripe";

// Helper to create admin client
const getSupabaseAdmin = () => {
    return createClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.SUPABASE_SERVICE_ROLE_KEY!,
        {
            auth: {
                autoRefreshToken: false,
                persistSession: false,
            },
        }
    );
};

const relevantEvents = new Set([
    "checkout.session.completed",
    "invoice.payment_succeeded",
    "customer.subscription.updated",
    "customer.subscription.deleted",
]);

export async function POST(req: Request) {
    const body = await req.text();
    const sig = (await headers()).get("Stripe-Signature") as string;
    const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET;

    let event: Stripe.Event;

    try {
        if (!webhookSecret) {
            console.error("STRIPE_WEBHOOK_SECRET is not configured");
            return new NextResponse("Server configuration error", { status: 500 });
        }
        if (!sig) return new NextResponse("Missing signature", { status: 400 });

        event = stripe.webhooks.constructEvent(body, sig, webhookSecret);
    } catch (err: unknown) {
        // Log internally but do NOT echo err.message in the response body
        // to avoid leaking signature verification details to potential attackers.
        const message = err instanceof Error ? err.message : String(err);
        console.error(`Webhook signature verification failed: ${message}`);
        return new NextResponse("Invalid webhook signature", { status: 401 });
    }

    if (relevantEvents.has(event.type)) {
        const supabase = getSupabaseAdmin();

        try {
            switch (event.type) {
                case "checkout.session.completed": {
                    const session = event.data.object as Stripe.Checkout.Session;
                    if (session.mode === "subscription") {
                        const subscriptionId = session.subscription as string;
                        const userId = session.metadata?.userId;

                        if (userId && subscriptionId) {
                            const subscriptionResponse = await stripe.subscriptions.retrieve(subscriptionId);
                            const subscription = subscriptionResponse as unknown as Stripe.Subscription;

                            // Upsert subscription
                            await supabase.from("subscriptions").upsert({
                                id: subscription.id,
                                user_id: userId,
                                status: subscription.status,
                                price_id: subscription.items.data[0].price.id,
                                metadata: subscription.metadata,
                                cancel_at_period_end: subscription.cancel_at_period_end,
                                created_at: new Date((subscription as any).created * 1000).toISOString(),
                                current_period_start: new Date((subscription as any).current_period_start * 1000).toISOString(),
                                current_period_end: new Date((subscription as any).current_period_end * 1000).toISOString(),
                            });

                            // Update profile is_pro
                            await supabase.from("profiles").update({ is_pro: true }).eq("id", userId);
                        }
                    }
                    break;
                }
                case "customer.subscription.updated":
                case "invoice.payment_succeeded": {
                    const subscription = event.data.object as Stripe.Subscription;

                    const { data: existingSub, error: subLookupError } = await supabase
                        .from("subscriptions")
                        .select("user_id")
                        .eq("id", subscription.id)
                        .single();

                    if (subLookupError || !existingSub) {
                        console.error(`Webhook [${event.type}]: subscription ${subscription.id} not found in DB. Skipping update.`);
                        break;
                    }

                    await supabase.from("subscriptions").upsert({
                        id: subscription.id,
                        user_id: existingSub.user_id,
                        status: subscription.status,
                        price_id: subscription.items.data[0].price.id,
                        metadata: subscription.metadata,
                        cancel_at_period_end: subscription.cancel_at_period_end,
                        created_at: new Date((subscription as any).created * 1000).toISOString(),
                        current_period_start: new Date((subscription as any).current_period_start * 1000).toISOString(),
                        current_period_end: new Date((subscription as any).current_period_end * 1000).toISOString(),
                    });

                    const isPro = subscription.status === 'active' || subscription.status === 'trialing';
                    await supabase.from("profiles").update({ is_pro: isPro }).eq("id", existingSub.user_id);
                    break;
                }
                case "customer.subscription.deleted": {
                    const subscription = event.data.object as Stripe.Subscription;
                    const { data: existingSub } = await supabase.from("subscriptions").select("user_id").eq("id", subscription.id).single();
                    if (existingSub) {
                        await supabase.from("subscriptions").update({
                            status: subscription.status,
                            cancel_at_period_end: subscription.cancel_at_period_end,
                            ended_at: new Date().toISOString()
                        }).eq("id", subscription.id);

                        await supabase.from("profiles").update({ is_pro: false }).eq("id", existingSub.user_id);
                    }
                    break;
                }
            }
        } catch (error) {
            console.error("Webhook handler failed:", error);
            return new NextResponse("Webhook handler failed", { status: 500 });
        }
    }

    return new NextResponse(null, { status: 200 });
}
