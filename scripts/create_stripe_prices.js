const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '../.env.local') });
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

async function main() {
    const productId = 'prod_Tg6PJKkmpCB1ee';

    if (!process.env.STRIPE_SECRET_KEY) {
        console.error('Error: STRIPE_SECRET_KEY is missing in .env.local');
        return;
    }

    console.log('Creating prices for product:', productId);

    try {
        // Create Monthly Price
        const monthlyPrice = await stripe.prices.create({
            unit_amount: 980,
            currency: 'jpy',
            recurring: { interval: 'month' },
            product: productId,
            metadata: { type: 'monthly' }
        });
        console.log('Created Monthly Price:', monthlyPrice.id);

        // Create Yearly Price
        const yearlyPrice = await stripe.prices.create({
            unit_amount: 9800,
            currency: 'jpy',
            recurring: { interval: 'year' },
            product: productId,
            metadata: { type: 'yearly' }
        });
        console.log('Created Yearly Price:', yearlyPrice.id);

    } catch (error) {
        console.error('Error creating prices:', error);
    }
}

main();
