"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { ArrowLeft, ArrowRight, CheckCircle, XCircle } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import { BookmarkButton } from "./BookmarkButton";
import { motion, AnimatePresence } from "framer-motion";
import { cn } from "@/lib/utils";

type Option = {
    id: string;
    content: string;
    is_correct: boolean;
};

type Question = {
    id: string;
    content: string;
    explanation: string | null;
    question_number?: number;
    options: Option[];
};

type QuizMode = 'normal' | 'quest' | 'exam';

export function QuizPlayer({
    questions,
    categoryId,
    examYear,
    mode = 'normal',
    initialSeconds
}: {
    questions: Question[],
    categoryId?: string,
    examYear?: number,
    mode?: QuizMode,
    initialSeconds?: number
}) {
    const router = useRouter();
    const supabase = createClient();

    const [currentIndex, setCurrentIndex] = useState(0);
    const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
    const [isAnswered, setIsAnswered] = useState(false);
    const [score, setScore] = useState(0);
    const [attemptId, setAttemptId] = useState<string | null>(null);
    const [userId, setUserId] = useState<string | null>(null);
    const [loading, setLoading] = useState(false);
    const [quizCompleted, setQuizCompleted] = useState(false);
    const [attemptCreated, setAttemptCreated] = useState(false);
    const [bookmarkedQuestionIds, setBookmarkedQuestionIds] = useState<Set<string>>(new Set());

    // Fetch bookmarks for these questions
    useEffect(() => {
        const fetchBookmarks = async () => {
            if (questions.length === 0) return;
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;
            setUserId(user.id);

            const ids = questions.map(q => q.id);
            if (ids.length === 0) return;

            const { data } = await supabase
                .from("bookmarks")
                .select("question_id")
                .eq("user_id", user.id)
                .in("question_id", ids);

            if (data) {
                setBookmarkedQuestionIds(new Set(data.map(b => b.question_id)));
            }
        };
        fetchBookmarks();
    }, [questions, supabase]);

    const [secondsRemaining, setSecondsRemaining] = useState<number | null>(initialSeconds || null);

    useEffect(() => {
        if (secondsRemaining === null || quizCompleted) return;

        const timer = setInterval(() => {
            setSecondsRemaining(prev => {
                if (prev === null || prev <= 0) {
                    clearInterval(timer);
                    return 0;
                }
                return prev - 1;
            });
        }, 1000);

        return () => clearInterval(timer);
    }, [secondsRemaining, quizCompleted]);

    // Auto-finish on timeout
    useEffect(() => {
        if (secondsRemaining === 0 && !quizCompleted) {
            // Timeout! Finish Quiz
            // Ideally trigger handleNext recursively or just set completed
            setQuizCompleted(true);
        }
    }, [secondsRemaining, quizCompleted]);

    useEffect(() => {
        const startAttempt = async () => {
            if (attemptCreated || questions.length === 0) return;

            // ... (existing logic)

            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;
            // UserId cached in other effect but safe to get here too

            const { data } = await supabase
                .from("exam_attempts")
                .insert({
                    user_id: user.id,
                    category_id: categoryId || null,
                    exam_year: examYear || null,
                    total_questions: questions.length,
                    score: 0
                })
                .select()
                .single();

            if (data) {
                setAttemptId(data.id);
                setAttemptCreated(true);
            }
        };

        startAttempt();
    }, [questions.length, categoryId, examYear, attemptCreated, supabase]);

    const currentQuestion = questions[currentIndex];

    // Helper to update user XP and Level
    const updateUserStats = async (finalScore: number) => {
        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;

            const { data: profile } = await supabase
                .from("profiles")
                .select("level, xp")
                .eq("id", user.id)
                .single();

            if (!profile) return;

            let currentLevel = profile.level || 1;
            let currentXp = profile.xp || 0;

            const earnedXp = (finalScore * 10) + 20;

            let newXp = currentXp + earnedXp;
            let newLevel = currentLevel;

            let nextLevelXp = newLevel * 100;

            while (newXp >= nextLevelXp) {
                newXp -= nextLevelXp;
                newLevel++;
                nextLevelXp = newLevel * 100;
            }

            await supabase
                .from("profiles")
                .update({ level: newLevel, xp: newXp })
                .eq("id", user.id);

        } catch (error) {
            console.error("Failed to update stats:", error);
        }
    };

    const handleAnswer = async () => {
        if (!selectedOptionId || isAnswered || !attemptId || !userId) return;

        setIsAnswered(true);
        const selectedOption = currentQuestion.options.find(o => o.id === selectedOptionId);
        const isCorrect = selectedOption?.is_correct || false;

        if (isCorrect) {
            setScore(s => s + 1);
        }

        // Save detailed answer to question_attempts
        try {
            await supabase.from("question_attempts").insert({
                user_id: userId,
                attempt_id: attemptId,
                question_id: currentQuestion.id,
                option_id: selectedOptionId,
                is_correct: isCorrect
            });
        } catch (err) {
            console.error("Error saving attempt:", err);
        }
    };

    const finishQuiz = async () => {
        if (loading || quizCompleted) return;
        setLoading(true);

        const finalScore = score;

        if (attemptId) {
            await supabase
                .from("exam_attempts")
                .update({
                    is_completed: true,
                    completed_at: new Date().toISOString(),
                    score: finalScore
                })
                .eq("id", attemptId);
        }

        // Update user stats
        await updateUserStats(finalScore);

        setQuizCompleted(true);
        setLoading(false);
        router.refresh();
    };

    const handleNext = async () => {
        if (currentIndex < questions.length - 1) {
            setCurrentIndex(i => i + 1);
            setSelectedOptionId(null);
            setIsAnswered(false);
        } else {
            await finishQuiz();
        }
    };

    // Auto-finish on timeout
    useEffect(() => {
        if (secondsRemaining === 0 && !quizCompleted) {
            finishQuiz();
        }
    }, [secondsRemaining, quizCompleted]);

    if (questions.length === 0) {
        return (
            <div className="text-center py-20">
                <h2 className="text-xl text-stone-800 font-bold">問題が見つかりませんでした</h2>
                <Button onClick={() => router.back()} className="mt-4" variant="outline">戻る</Button>
            </div>
        );
    }

    if (quizCompleted) {
        return (
            <div className="max-w-xl mx-auto py-12 px-4 text-center">
                <motion.div
                    initial={{ opacity: 0, scale: 0.9 }}
                    animate={{ opacity: 1, scale: 1 }}
                    className="glass p-8 rounded-2xl"
                >
                    <h2 className="text-3xl font-bold text-stone-800 mb-4">お疲れ様でした！</h2>
                    <div className="text-6xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-primary to-amber-300 mb-6">
                        {score} / {questions.length}
                    </div>
                    <p className="text-stone-500 mb-8">
                        正答率: {Math.round((score / questions.length) * 100)}%
                    </p>
                    <div className="flex justify-center gap-4">
                        <Button onClick={() => router.push("/practice")} variant="outline">
                            演習一覧へ
                        </Button>
                        <Button onClick={() => window.location.reload()} variant="premium">
                            もう一度解く
                        </Button>
                    </div>
                </motion.div>
            </div>
        );
    }

    if (!currentQuestion) return <div>Loading...</div>;

    return (
        <div className="max-w-3xl mx-auto py-12 px-4">
            {/* Timer Display */}
            {secondsRemaining !== null && (
                <div className={cn(
                    "fixed top-20 right-4 z-50 glass px-4 py-2 rounded-full font-mono font-bold text-xl shadow-lg border-2",
                    secondsRemaining < 60 ? "border-red-500 text-red-500 bg-red-50" : "border-primary/20 text-stone-700"
                )}>
                    {Math.floor(secondsRemaining / 60)}:{String(secondsRemaining % 60).padStart(2, '0')}
                </div>
            )}
            {/* Progress Bar */}
            <div className="mb-8">
                <div className="flex justify-between text-sm text-stone-500 mb-2">
                    <span className="flex items-center gap-2">
                        Question {currentIndex + 1}
                        {currentQuestion.question_number && <span className="text-stone-500">(No.{currentQuestion.question_number})</span>}
                        <BookmarkButton
                            questionId={currentQuestion.id}
                            initialBookmarked={bookmarkedQuestionIds.has(currentQuestion.id)}
                            onToggle={(isBookmarked) => {
                                const newSet = new Set(bookmarkedQuestionIds);
                                if (isBookmarked) newSet.add(currentQuestion.id);
                                else newSet.delete(currentQuestion.id);
                                setBookmarkedQuestionIds(newSet);
                            }}
                        />
                    </span>
                    <span>{questions.length} total</span>
                </div>
                <div className="h-2 bg-stone-200 rounded-full overflow-hidden">
                    <motion.div
                        className="h-full bg-primary"
                        initial={{ width: 0 }}
                        animate={{ width: `${((currentIndex + 1) / questions.length) * 100}%` }}
                        transition={{ duration: 0.5, ease: "easeInOut" }}
                    />
                </div>
            </div>

            <div className="min-h-[400px]">
                <AnimatePresence mode="wait">
                    <motion.div
                        key={currentQuestion.id}
                        initial={{ opacity: 0, x: 20 }}
                        animate={{ opacity: 1, x: 0 }}
                        exit={{ opacity: 0, x: -20 }}
                        transition={{ duration: 0.3 }}
                        className="glass p-6 md:p-8 rounded-2xl mb-6 flex flex-col h-full"
                    >
                        <h3 className="text-xl font-bold text-stone-800 mb-6 leading-relaxed">
                            {currentQuestion.content}
                        </h3>

                        <div className="space-y-3 flex-1">
                            {currentQuestion.options.map((option) => (
                                <motion.div
                                    key={option.id}
                                    whileHover={!isAnswered ? { scale: 1.02 } : {}}
                                    whileTap={!isAnswered ? { scale: 0.98 } : {}}
                                    onClick={() => !isAnswered && setSelectedOptionId(option.id)}
                                    className={cn(
                                        "p-4 rounded-xl border-2 transition-all cursor-pointer flex items-center gap-3",
                                        isAnswered && option.is_correct
                                            ? "bg-green-500/10 border-green-500 text-green-400"
                                            : isAnswered && selectedOptionId === option.id && !option.is_correct
                                                ? "bg-red-500/10 border-red-500 text-red-400"
                                                : selectedOptionId === option.id
                                                    ? "bg-primary/10 border-primary text-primary-foreground font-semibold"
                                                    : "bg-white border-stone-200 hover:border-primary/50 text-stone-600 hover:bg-stone-50"
                                    )}
                                >
                                    <div className={cn(
                                        "w-6 h-6 rounded-full border-2 flex items-center justify-center shrink-0 transition-colors",
                                        isAnswered && option.is_correct
                                            ? "border-green-500 bg-green-500 text-black"
                                            : isAnswered && selectedOptionId === option.id && !option.is_correct
                                                ? "border-red-500"
                                                : selectedOptionId === option.id
                                                    ? "border-primary bg-primary"
                                                    : "border-stone-500"
                                    )}>
                                        {isAnswered && option.is_correct && <CheckCircle className="w-4 h-4" />}
                                        {isAnswered && selectedOptionId === option.id && !option.is_correct && <XCircle className="w-4 h-4" />}
                                    </div>
                                    {option.content}
                                </motion.div>
                            ))}
                        </div>

                        {isAnswered && (
                            <motion.div
                                initial={{ opacity: 0, y: 10 }}
                                animate={{ opacity: 1, y: 0 }}
                                className="mt-6 pt-6 border-t border-stone-200"
                            >
                                <div className="font-bold text-stone-800 mb-2">解説</div>
                                <p className="text-stone-600 text-sm leading-relaxed">
                                    {currentQuestion.explanation || "解説はありません。"}
                                </p>
                            </motion.div>
                        )}
                    </motion.div>
                </AnimatePresence>
            </div>

            <div className="flex justify-end">
                {!isAnswered ? (
                    <Button
                        onClick={handleAnswer}
                        disabled={!selectedOptionId}
                        variant="premium" // Using premium variant defined in Button.tsx
                        className="w-full md:w-auto shadow-lg shadow-primary/20"
                    >
                        回答する
                    </Button>
                ) : (
                    <Button
                        onClick={handleNext}
                        variant="premium"
                        className="w-full md:w-auto gap-2 shadow-lg shadow-primary/20"
                        disabled={loading}
                    >
                        {currentIndex < questions.length - 1 ? "次の問題へ" : "結果を見る"} <ArrowRight className="w-4 h-4" />
                    </Button>
                )}
            </div>
        </div>
    );
}
