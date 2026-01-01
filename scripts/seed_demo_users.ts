
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';

// Load env vars
dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const users = [
    { email: 'admin@kaneiquest.com', password: 'demo1234', role: 'admin' },
    { email: 'pro@kaneiquest.com', password: 'demo1234', plan: 'pro' },
    { email: 'free@kaneiquest.com', password: 'demo1234', plan: 'free' },
];

async function seedUsers() {
    console.log('Seeding users...');

    for (const user of users) {
        console.log(`Creating ${user.email}...`);
        const { data, error } = await supabase.auth.signUp({
            email: user.email,
            password: user.password,
        });

        if (error) {
            console.error(`Error creating ${user.email}:`, error.message);
        } else {
            console.log(`Success: ${user.email} (ID: ${data.user?.id})`);
        }
    }

    console.log('Use SQL to updated roles/plans/confirmation status if needed.');
}

seedUsers();
