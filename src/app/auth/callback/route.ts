import { createClient } from "@/lib/supabase/server";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
    const { searchParams, origin } = new URL(request.url);
    const code = searchParams.get("code");

    // Validate the `next` redirect target to prevent open redirect attacks.
    // Accept only paths that start with "/" but not "//" (protocol-relative URLs).
    const rawNext = searchParams.get("next") ?? "/dashboard";
    const next =
        rawNext.startsWith("/") && !rawNext.startsWith("//")
            ? rawNext
            : "/dashboard";

    if (code) {
        const supabase = await createClient();
        const { error } = await supabase.auth.exchangeCodeForSession(code);
        if (!error) {
            return NextResponse.redirect(`${origin}${next}`);
        }
    }

    // return the user to an error page with instructions
    return NextResponse.redirect(`${origin}/auth/auth-code-error`);
}
