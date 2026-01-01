import { Megaphone } from "lucide-react";

export function AnnouncementBanner({ message, active }: { message: string | null; active?: boolean }) {
    if (!message || active === false) return null;

    return (
        <div className="w-full bg-gradient-to-r from-rose-100/80 to-rose-50/80 border border-rose-200 rounded-xl p-4 flex items-start gap-4 shadow-sm mb-6">
            <div className="p-2 bg-white/60 rounded-lg">
                <Megaphone className="w-5 h-5 text-rose-500" />
            </div>
            <div>
                <h3 className="text-sm font-bold text-rose-700 mb-1">お知らせ</h3>
                <p className="text-sm text-rose-600/90 leading-relaxed">
                    {message}
                </p>
            </div>
        </div>
    );
}
