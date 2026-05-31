import { type NextRequest, NextResponse } from 'next/server'
import { updateSession } from '@/lib/supabase/middleware'
import { createServerClient } from '@supabase/ssr'

export async function middleware(request: NextRequest) {
    // First, refresh the Supabase session so Server Components see up-to-date auth state.
    const response = await updateSession(request)

    // Guard /admin/* routes: only allow users with role = 'admin'.
    // We do a lightweight profile check here so unauthorised users are rejected
    // at the edge before any admin page code runs.
    if (request.nextUrl.pathname.startsWith('/admin')) {
        const supabase = createServerClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
            {
                cookies: {
                    getAll() { return response.cookies.getAll() },
                    setAll() { /* read-only here — updateSession already handled writes */ },
                },
            }
        )

        const { data: { user } } = await supabase.auth.getUser()

        if (!user) {
            const loginUrl = new URL('/login', request.url)
            loginUrl.searchParams.set('next', request.nextUrl.pathname)
            return NextResponse.redirect(loginUrl)
        }

        const { data: profile } = await supabase
            .from('profiles')
            .select('role')
            .eq('id', user.id)
            .single()

        if (profile?.role !== 'admin') {
            // Authenticated but not admin — send to dashboard
            return NextResponse.redirect(new URL('/dashboard', request.url))
        }
    }

    return response
}

export const config = {
    matcher: [
        /*
         * Match all request paths except for the ones starting with:
         * - _next/static (static files)
         * - _next/image (image optimization files)
         * - favicon.ico (favicon file)
         * - images - .svg, .png, .jpg, .jpeg, .gif, .webp
         */
        '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
    ],
}
