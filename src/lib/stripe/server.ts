import Stripe from 'stripe';

let _stripe: Stripe | null = null;

export const stripe = new Proxy({} as Stripe, {
    get(_target, prop) {
        if (!_stripe) {
            _stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
                typescript: true,
            });
        }
        return (_stripe as any)[prop];
    },
});
