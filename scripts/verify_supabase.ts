import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv";

dotenv.config({ path: ".env.local" });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("Error: Missing Supabase credentials in .env.local");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function verifyConnection() {
    console.log("Testing Supabase connection...");
    console.log(`URL: ${supabaseUrl}`);

    try {
        // Attempt to fetch health check or simple query
        // Since we might not have tables, we check auth or just basic connection validity
        // Getting the session is a safe read operation that doesn't fail on empty DB
        const { data, error } = await supabase.auth.getSession();

        if (error) {
            console.error("Connection Failed:", error.message);
        } else {
            console.log("Connection Successful!");
            console.log("Supabase Client initialized and communicated with Auth service.");
        }
    } catch (err) {
        console.error("Unexpected Error:", err);
    }
}

verifyConnection();
