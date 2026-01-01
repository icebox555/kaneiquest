const fs = require('fs');
const path = require('path');

const envPath = path.join(process.cwd(), '.env.local');
const secret = 'whsec_1cfa1d92dc090a0175dc6e63bf380e3e5825ff655';

try {
    let content = '';
    if (fs.existsSync(envPath)) {
        content = fs.readFileSync(envPath, 'utf8');
    }

    let newContent = content;
    const regex = /^STRIPE_WEBHOOK_SECRET=.*$/m;

    if (regex.test(content)) {
        newContent = content.replace(regex, `STRIPE_WEBHOOK_SECRET=${secret}`);
    } else {
        newContent = content + `\nSTRIPE_WEBHOOK_SECRET=${secret}`;
    }

    fs.writeFileSync(envPath, newContent, 'utf8');
    console.log('Successfully updated .env.local with new Webhook Secret.');
} catch (error) {
    console.error('Error updating .env.local:', error);
    process.exit(1);
}
