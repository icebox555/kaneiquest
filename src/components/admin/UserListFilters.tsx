"use client";

import { useRouter, useSearchParams, usePathname } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Filter, ArrowUpDown } from "lucide-react";

export function UserListFilters() {
    const router = useRouter();
    const pathname = usePathname();
    const searchParams = useSearchParams();

    const currentSort = searchParams.get("sort") || "created_at";
    const currentOrder = searchParams.get("order") || "desc";
    const currentPlan = searchParams.get("plan") || "all";

    const updateParams = (key: string, value: string) => {
        const params = new URLSearchParams(searchParams.toString());
        if (value === "all" || value === "") {
            params.delete(key);
        } else {
            params.set(key, value);
        }
        router.push(`${pathname}?${params.toString()}`);
    };

    const toggleSort = (field: string) => {
        if (currentSort === field) {
            updateParams("order", currentOrder === "asc" ? "desc" : "asc");
        } else {
            const params = new URLSearchParams(searchParams.toString());
            params.set("sort", field);
            params.set("order", "desc"); // Default to new for date
            router.push(`${pathname}?${params.toString()}`);
        }
    };

    return (
        <div className="flex gap-4 items-center mb-4">
            {/* Plan Filter */}
            <div className="flex items-center gap-2">
                <Filter className="w-4 h-4 text-slate-400" />
                <select
                    className="bg-slate-800 border border-slate-700 rounded-md px-3 py-1.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                    value={currentPlan}
                    onChange={(e) => updateParams("plan", e.target.value)}
                >
                    <option value="all">全プラン</option>
                    <option value="free">Free</option>
                    <option value="pro">Pro</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            {/* Sort Buttons */}
            <div className="flex gap-2">
                <Button
                    variant={currentSort === "created_at" ? "premium" : "ghost"}
                    size="sm"
                    onClick={() => toggleSort("created_at")}
                    className="gap-2"
                >
                    登録日
                    {currentSort === "created_at" && (
                        <ArrowUpDown className={`w-3 h-3 ${currentOrder === "asc" ? "rotate-180" : ""}`} />
                    )}
                </Button>
                <Button
                    variant={currentSort === "name" ? "premium" : "ghost"}
                    size="sm"
                    onClick={() => toggleSort("name")}
                    className="gap-2"
                >
                    名前順
                    {currentSort === "name" && (
                        <ArrowUpDown className={`w-3 h-3 ${currentOrder === "asc" ? "rotate-180" : ""}`} />
                    )}
                </Button>
            </div>
        </div>
    );
}
