export const STRIPE_CONFIG = {
    PRICES: {
        PRO_MONTHLY: process.env.NEXT_PUBLIC_STRIPE_PRICE_ID_MONTHLY || "",
        PRO_YEARLY: process.env.NEXT_PUBLIC_STRIPE_PRICE_ID_YEARLY || "",
    },
    PORTAL_RETURN_URL: `${process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"}/dashboard`,
};
