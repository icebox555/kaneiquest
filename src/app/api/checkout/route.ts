import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { stripe } from "@/lib/stripe/server";

export async function POST(req: Request) {
    try {
        const { priceId } = await req.json();
        const supabase = await createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
            return new NextResponse("Unauthorized", { status: 401 });
        }

        // 1. Get or Create Stripe Customer
        // Ideally we store stripe_customer_id in "profiles" table.
        // For now, let's search by email or create new.
        let customerId: string | undefined;

        const { data: profile } = await supabase
            .from("profiles")
            .select("stripe_customer_id, email")
            .eq("id", user.id)
            .single();

        if (profile?.stripe_customer_id) {
            customerId = profile.stripe_customer_id;
        } else {
            // Create new customer in Stripe
            const customer = await stripe.customers.create({
                email: user.email!,
                metadata: {
                    supabaseUserId: user.id
                }
            });
            customerId = customer.id;

            // Save to DB
            await supabase.from("profiles").update({ stripe_customer_id: customerId }).eq("id", user.id);
        }

        // 2. Create Checkout Session
        const session = await stripe.checkout.sessions.create({
            customer: customerId,
            mode: "subscription",
            payment_method_types: ["card"],
            line_items: [
                {
                    price: priceId,
                    quantity: 1,
                },
            ],
            success_url: `${process.env.NEXT_PUBLIC_APP_URL}/dashboard?success=true`,
            cancel_url: `${process.env.NEXT_PUBLIC_APP_URL}/pricing?canceled=true`,
            metadata: {
                userId: user.id,
            },
        });

        return NextResponse.json({ sessionId: session.id, url: session.url });
    } catch (error: any) {
        console.error("Stripe Checkout Error:", error);
        return new NextResponse("Internal Error", { status: 500 });
    }
}
