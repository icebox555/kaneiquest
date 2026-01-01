"use client";

import { createContext, useContext, useState, useEffect, ReactNode } from "react";
import { User } from "@/lib/types";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

interface AuthContextType {
    user: User | null;
    isLoading: boolean;
    login: () => Promise<void>; // Kept for compatibility, but mainly unused
    logout: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<User | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const router = useRouter();
    const supabase = createClient();

    useEffect(() => {
        // Fetch initial session
        const initializeAuth = async () => {
            try {
                const { data: { session } } = await supabase.auth.getSession();
                if (session?.user) {
                    await fetchProfile(session.user.id, session.user.email!);
                } else {
                    setUser(null);
                }
            } catch (error) {
                console.error("Auth initialization error:", error);
            } finally {
                setIsLoading(false);
            }
        };

        initializeAuth();

        // Listen for auth changes
        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (session?.user) {
                // If we don't have user loaded or ID mismatches, fetch profile
                if (!user || user.id !== session.user.id) {
                    await fetchProfile(session.user.id, session.user.email!);
                }
            } else {
                setUser(null);
                setIsLoading(false);
            }
        });

        return () => {
            subscription.unsubscribe();
        };
    }, [supabase, user]);

    const fetchProfile = async (userId: string, email: string) => {
        try {
            const { data: profile, error } = await supabase
                .from("profiles")
                .select("*")
                .eq("id", userId)
                .single();

            if (error) {
                console.error("Profile fetch error:", error);
                // Fallback basic user if profile missing (should be created by trigger though)
                setUser({
                    id: userId,
                    email: email,
                    name: "",
                    plan: "free",
                    role: "user"
                });
            } else {
                setUser({
                    id: userId,
                    email: email,
                    name: profile.name || "",
                    plan: profile.plan || "free",
                    role: profile.role || "user",
                });
            }
        } catch (err) {
            console.error(err);
        } finally {
            setIsLoading(false);
        }
    };

    const login = async () => {
        // Redirect to login page is handled by UI links mostly
        router.push("/login");
    };

    const logout = async () => {
        setIsLoading(true);
        await supabase.auth.signOut();
        setUser(null);
        setIsLoading(false);
        router.push("/login");
    };

    return (
        <AuthContext.Provider value={{ user, isLoading, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
}

export function useAuth() {
    const context = useContext(AuthContext);
    if (context === undefined) {
        throw new Error("useAuth must be used within an AuthProvider");
    }
    return context;
}
