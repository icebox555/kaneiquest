import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/Avatar";
import { Crown, Heart } from "lucide-react";
import { MotionWrapper } from "@/components/ui/MotionWrapper";
import { HeartSender } from "./HeartSender";

interface Ranker {
    user_id: string;
    name: string | null;
    avatar_url: string | null;
    xp: number;
    level: number;
    plan?: string;
}

interface RankingBoardProps {
    rankings: Ranker[];
    currentUserId: string;
    className?: string;
}

export function RankingBoard({ rankings, currentUserId, className }: RankingBoardProps) {
    const getRankIcon = (index: number) => {
        switch (index) {
            case 0: return <Crown className="w-8 h-8 text-yellow-500 fill-yellow-500 drop-shadow-sm" />; // Gold
            case 1: return <Crown className="w-7 h-7 text-stone-400 fill-stone-400 drop-shadow-sm" />; // Silver
            case 2: return <Crown className="w-6 h-6 text-orange-400 fill-orange-400 drop-shadow-sm" />; // Bronze
            default:
                return (
                    <div className="w-8 h-8 flex items-center justify-center bg-stone-100 rounded-full font-bold text-stone-600 text-sm border border-stone-200 shadow-inner">
                        {index + 1}
                    </div>
                );
        }
    };

    const getRankBg = (index: number) => {
        switch (index) {
            case 0: return "bg-gradient-to-r from-yellow-50 to-amber-50/50 border-yellow-200";
            case 1: return "bg-gradient-to-r from-stone-50 to-stone-100/50 border-stone-200";
            case 2: return "bg-gradient-to-r from-orange-50 to-orange-100/50 border-orange-200";
            default: return "bg-white/60 border-transparent hover:bg-stone-50/80";
        }
    }

    return (
        <div className={`glass border-stone-200 rounded-3xl overflow-hidden shadow-xl ${className}`}>
            <div className="flex flex-col divide-y divide-stone-100">
                {(rankings || []).map((ranker, i) => {
                    const isMe = ranker.user_id === currentUserId;
                    const isTop3 = i < 3;

                    return (
                        <MotionWrapper key={ranker.user_id} delay={i * 0.05} className="block relative group">
                            {/* Row Content */}
                            <div className={`p-4 flex items-center gap-4 transition-all duration-300 relative ${isMe ? 'bg-rose-50/30' : ''} ${getRankBg(i)}`}>

                                {/* Rank Badge */}
                                <div className="w-12 flex-shrink-0 flex justify-center items-center">
                                    {getRankIcon(i)}
                                </div>

                                {/* Avatar (Squircle) */}
                                <div className="relative">
                                    <Avatar className={`w-14 h-14 rounded-2xl border-4 shadow-sm ${isTop3 ? 'border-white ring-2 ring-offset-2 ring-' + (i === 0 ? 'yellow-400' : i === 1 ? 'stone-300' : 'orange-300') : 'border-white'}`}>
                                        <AvatarImage
                                            src={ranker.avatar_url || "/default-avatar.png"}
                                            className={`object-cover ${!ranker.avatar_url ? 'scale-[1.8]' : ''}`}
                                        />
                                        <AvatarFallback className="rounded-2xl bg-stone-100 text-stone-500 font-bold">
                                            {ranker.name?.slice(0, 1).toUpperCase()}
                                        </AvatarFallback>
                                    </Avatar>
                                    {isTop3 && (
                                        <div className="absolute -bottom-1 -right-1 bg-white rounded-full p-0.5 shadow-sm">
                                            <div className={`w-3 h-3 rounded-full ${i === 0 ? 'bg-yellow-400' : i === 1 ? 'bg-stone-300' : 'bg-orange-300'}`}></div>
                                        </div>
                                    )}
                                </div>

                                {/* Name & Level */}
                                <div className="flex-1 min-w-0">
                                    <div className="flex items-center gap-2">
                                        <p className="font-bold text-stone-800 text-base truncate">
                                            {ranker.name || "No Name"}
                                        </p>
                                        {isMe && (
                                            <span className="px-2 py-0.5 bg-rose-500 text-white text-[10px] font-bold rounded-full shadow-sm shadow-rose-200">
                                                YOU
                                            </span>
                                        )}
                                    </div>
                                    <div className="flex items-center gap-2 mt-0.5">
                                        <span className="text-xs font-bold text-stone-400 bg-stone-100 px-1.5 py-0.5 rounded text-[10px]">
                                            Lv.{ranker.level || 1}
                                        </span>
                                    </div>
                                </div>

                                {/* Score */}
                                <div className="text-right">
                                    <p className="font-Jost text-xl font-bold text-stone-700 tabular-nums tracking-tight">
                                        {ranker.xp.toLocaleString()}
                                    </p>
                                    <p className="text-[10px] text-stone-400 font-bold uppercase tracking-wider">
                                        SCORE
                                    </p>
                                </div>

                                {/* Heart Icon */}
                                <div className="pl-2">
                                    {isMe ? (
                                        <div className="w-10 h-10" /> // Spacer
                                    ) : (
                                        <HeartSender targetUserId={ranker.user_id} isMe={isMe} />
                                    )}
                                </div>

                            </div>

                            {/* Border Overlay for user highlight */}
                            {isMe && (
                                <div className={`absolute inset-0 border-2 border-rose-400 pointer-events-none z-20 shadow-[inset_0_0_10px_rgba(251,113,133,0.1)] ${i === 0 && i === rankings.length - 1 ? 'rounded-3xl' :
                                    i === 0 ? 'rounded-t-3xl' :
                                        i === rankings.length - 1 ? 'rounded-b-3xl' :
                                            'rounded-none'
                                    }`}></div>
                            )}
                        </MotionWrapper>
                    );
                })}
            </div>
        </div>
    );
}
