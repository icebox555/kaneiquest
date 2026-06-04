import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';

config({ path: '.env.local' });

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY,
    { auth: { autoRefreshToken: false, persistSession: false } }
);

// 認証情報は .env.local / 環境変数から取得（リポジトリにパスワードを残さない）
const EMAIL = process.env.ADMIN_EMAIL;
const PASSWORD = process.env.ADMIN_PASSWORD;

if (!EMAIL || !PASSWORD) {
    console.error('ADMIN_EMAIL と ADMIN_PASSWORD を .env.local に設定してください');
    process.exit(1);
}

async function main() {
    // Create user (auto-confirmed)
    const { data: user, error: createError } = await supabase.auth.admin.createUser({
        email: EMAIL,
        password: PASSWORD,
        email_confirm: true,
    });

    if (createError) {
        console.error('User creation failed:', createError.message);
        process.exit(1);
    }

    console.log('User created:', user.user.id);

    // Set role to admin in profiles
    const { error: updateError } = await supabase
        .from('profiles')
        .update({ role: 'admin' })
        .eq('id', user.user.id);

    if (updateError) {
        console.error('Profile update failed:', updateError.message);
        process.exit(1);
    }

    console.log('Admin account ready!');
    console.log(`  Email: ${EMAIL}`);
    console.log(`  Password: ${PASSWORD}`);
    console.log('  Login at: https://kaneiquest.vercel.app/login');
}

main();
