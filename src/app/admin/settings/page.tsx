import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { SettingsForm } from "@/components/admin/SettingsForm";

export default async function SettingsPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Check admin role
    const { data: profile } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profile?.role !== "admin") {
        redirect("/dashboard");
    }

    // Fetch settings
    const { data: settingsData } = await supabase
        .from("app_settings")
        .select("*");

    // Transform data
    // Default values if not found in DB
    const settingsMap = settingsData?.reduce((acc, curr) => {
        acc[curr.key] = curr.value;
        return acc;
    }, {} as Record<string, any>) || {};

    const initialSettings = {
        maintenance_mode: settingsMap["maintenance_mode"] ?? false,
        announcement: settingsMap["announcement"] ?? { message: "", active: false },
    };

    return (
        <div className="p-8 pt-24 text-white">
            <div className="mb-8">
                <h1 className="text-3xl font-bold text-white">
                    システム設定
                </h1>
                <p className="text-slate-400 mt-2">
                    メンテナンスモードや全体アナウンスの管理
                </p>
            </div>

            <div className="max-w-3xl">
                <SettingsForm initialSettings={initialSettings} />
            </div>
        </div>
    );
}
