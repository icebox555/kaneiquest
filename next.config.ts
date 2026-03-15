import type { NextConfig } from "next";

const securityHeaders = [
    // Prevent the page from being embedded in an iframe (clickjacking protection)
    { key: "X-Frame-Options", value: "DENY" },
    // Prevent browsers from MIME-sniffing the content type
    { key: "X-Content-Type-Options", value: "nosniff" },
    // Limit referrer information sent to third-party sites
    { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
    // Enforce HTTPS for 1 year (enable only when TLS is confirmed on the deployment)
    { key: "Strict-Transport-Security", value: "max-age=31536000; includeSubDomains" },
    // Restrict browser features not used by this app
    {
        key: "Permissions-Policy",
        value: "camera=(), microphone=(), geolocation=()",
    },
    // Basic XSS protection for older browsers (modern browsers rely on CSP)
    { key: "X-XSS-Protection", value: "1; mode=block" },
];

const nextConfig: NextConfig = {
    async headers() {
        return [
            {
                // Apply security headers to all routes
                source: "/:path*",
                headers: securityHeaders,
            },
        ];
    },
};

export default nextConfig;
