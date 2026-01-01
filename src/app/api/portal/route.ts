import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { STRIPE_CONFIG } from "@/lib/stripe/config";
import { stripe } from "@/lib/stripe/server";

export async function POST(req: Request) {
    try {
        const supabase = await createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
            return new NextResponse("Unauthorized", { status: 401 });
        }

        const { data: profile } = await supabase
            .from("profiles")
            .select("stripe_customer_id")
            .eq("id", user.id)
            .single();

        if (!profile?.stripe_customer_id) {
            return new NextResponse("No Stripe customer found", { status: 400 });
        }

        const session = await stripe.billingPortal.sessions.create({
            customer: profile.stripe_customer_id,
            return_url: STRIPE_CONFIG.PORTAL_RETURN_URL,
        });

        return NextResponse.json({ url: session.url });
    } catch (error: any) {
        console.error("Stripe Portal Error:", error);
        return new NextResponse("Internal Error", { status: 500 });
    }
}
