import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import { ProfileForm } from "@/components/profile/ProfileForm";

export default async function ProfilePage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        redirect("/login");
    }

    // Fetch profile
    const { data: profile } = await supabase
        .from("profiles")
        .select("*")
        .eq("id", user.id)
        .single();

    if (!profile) {
        redirect("/dashboard");
    }

    const initialProfile = {
        id: profile.id,
        name: profile.name || "",
        email: profile.email,
        avatar_url: profile.avatar_url,
    };

    return (
        <div className="min-h-screen bg-transparent pt-24 pb-12">
            <div className="container max-w-2xl mx-auto px-4 md:px-6">
                <div className="mb-8">
                    <h1 className="text-3xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-stone-800 to-stone-600">
                        マイプロフィール
                    </h1>
                    <p className="text-stone-500 mt-2">
                        アカウント設定の管理
                    </p>
                </div>

                <ProfileForm initialProfile={initialProfile} />
            </div>
        </div>
    );
}
