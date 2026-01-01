"use client";

import { Input } from "@/components/ui/Input";
import { Search } from "lucide-react";
import { useRouter, useSearchParams, usePathname } from "next/navigation";
import { useDebouncedCallback } from "use-debounce";

export function SearchInput({ placeholder = "Search..." }: { placeholder?: string }) {
    const searchParams = useSearchParams();
    const pathname = usePathname();
    const router = useRouter();

    const handleSearch = useDebouncedCallback((term: string) => {
        const params = new URLSearchParams(searchParams);
        if (term) {
            params.set("q", term);
        } else {
            params.delete("q");
        }
        router.replace(`${pathname}?${params.toString()}`);
    }, 300);

    return (
        <div className="relative flex-1 max-w-sm">
            <Search className="absolute left-3 top-3 h-4 w-4 text-slate-400" />
            <Input
                placeholder={placeholder}
                className="pl-10 bg-white/5 border-white/10 text-white placeholder:text-slate-500 focus:bg-white/10"
                onChange={(e) => handleSearch(e.target.value)}
                defaultValue={searchParams.get("q")?.toString()}
            />
        </div>
    );
}
