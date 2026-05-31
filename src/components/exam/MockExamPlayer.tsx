"use client";

import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/Button";
import { Timer, Flag, Grid, ChevronLeft, ChevronRight, CheckCircle, Save, AlertCircle, LogOut } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
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
    exam_year?: number;
};

interface MockExamPlayerProps {
    questions: Question[];
    examYear: number;
    initialTimeRemaining?: number; // Seconds
    initialAttemptId?: string;
    initialAnswers?: Record<string, string>;
}

export function MockExamPlayer({
    questions,
    examYear,
    initialTimeRemaining = 18000,
    initialAttemptId,
    initialAnswers = {}
}: MockExamPlayerProps) {
    const router = useRouter();
    const supabase = createClient();

    // State
    const [currentIndex, setCurrentIndex] = useState(0);
    const [answers, setAnswers] = useState<Record<string, string>>(initialAnswers); // questionId -> optionId
    const [markedQuestionIds, setMarkedQuestionIds] = useState<Set<string>>(new Set());
    const [timeRemaining, setTimeRemaining] = useState(initialTimeRemaining);
    const [isMenuOpen, setIsMenuOpen] = useState(false);
    const [attemptId, setAttemptId] = useState<string | null>(initialAttemptId || null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isFinished, setIsFinished] = useState(false);
    const [score, setScore] = useState(0);
    const [lastSavedTime, setLastSavedTime] = useState(initialTimeRemaining);
    const [showFinishDialog, setShowFinishDialog] = useState(false);

    const timerRef = useRef<NodeJS.Timeout | null>(null);

    // Initialize Attempt
    useEffect(() => {
        const initAttempt = async () => {
            if (attemptId) return; // Already have one

            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;

            const { data, error } = await supabase
                .from("exam_attempts")
                .insert({
                    user_id: user.id,
                    exam_year: examYear,
                    total_questions: questions.length,
                    is_completed: false,
                    score: 0,
                    mode: 'mock_exam',
                    time_remaining: initialTimeRemaining
                })
                .select()
                .single();

            if (data) setAttemptId(data.id);
            if (error) console.error("Failed to start exam attempt", error);
        };

        if (!initialAttemptId) {
            initAttempt();
        }

        // Start Timer
        timerRef.current = setInterval(() => {
            setTimeRemaining(prev => {
                if (prev <= 1) {
                    clearInterval(timerRef.current!);
                    handleFinish(); // Auto finish
                    return 0;
                }
                return prev - 1;
            });
        }, 1000);

        return () => {
            if (timerRef.current) clearInterval(timerRef.current);
        };
    }, []);

    // Warn on browser refresh / tab close during active exam
    useEffect(() => {
        if (isFinished) return;
        const handler = (e: BeforeUnloadEvent) => {
            e.preventDefault();
            e.returnValue = '';
        };
        window.addEventListener('beforeunload', handler);
        return () => window.removeEventListener('beforeunload', handler);
    }, [isFinished]);

    // Intercept browser back button during active exam
    useEffect(() => {
        if (isFinished) return;
        window.history.pushState(null, '', window.location.href);
        const handler = () => {
            window.history.pushState(null, '', window.location.href);
            setShowFinishDialog(true);
        };
        window.addEventListener('popstate', handler);
        return () => window.removeEventListener('popstate', handler);
    }, [isFinished]);

    // Auto-save progress every 30 seconds
    useEffect(() => {
        const saveProgress = async () => {
            if (!attemptId || isFinished) return;

            // Only save if time has changed significantly (avoid rapid calls) or answers changed?
            // Let's just update time_remaining for now.
            await supabase
                .from("exam_attempts")
                .update({ time_remaining: timeRemaining })
                .eq("id", attemptId);
        };

        const interval = setInterval(saveProgress, 30000);
        return () => clearInterval(interval);
    }, [attemptId, timeRemaining, isFinished]);

    // Save answers as they happen (debounced or immediate?)
    // Immediate is safer for "No immediate feedback" but we need to track them.
    // Let's rely on final submission for "grading" but saving choices to DB is good for resume.

    // Helper to save single answer
    const saveAnswerToDb = async (qId: string, oId: string) => {
        if (!attemptId) return;
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return;

        // Upsert answer
        // We use question_attempts table. But it has 'is_correct'.
        // For Mock Exam, we don't know is_correct yet (or we do but don't show).
        // It's fine to store is_correct in DB, user can't see it if UI doesn't show.
        const q = questions.find(qu => qu.id === qId);
        const isCorrect = q?.options.find(o => o.id === oId)?.is_correct || false;

        // Upsert requires conflict target. Current schema might not enforce unique (user, attempt, question).
        // Let's hope it's fast enough.
        // Or check if exists.
        // Better: Delete old for this question/attempt?
        // Actually, let's just insert. View will pick latest?
        // Or upsert based on (attempt_id, question_id).
        // If no unique constraint, we pile up rows. Querying latest is needed then.
        // Let's assume we Pile Up for now, resume logic picks latest.

        await supabase.from("question_attempts").insert({
            user_id: user.id,
            attempt_id: attemptId,
            question_id: qId,
            option_id: oId,
            is_correct: isCorrect
        });
    };

    // Format Time
    const formatTime = (seconds: number) => {
        const h = Math.floor(seconds / 3600);
        const m = Math.floor((seconds % 3600) / 60);
        const s = seconds % 60;
        return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    };

    const currentQuestion = questions[currentIndex];

    // Handlers
    const handleSelectOption = (optionId: string) => {
        if (isFinished) return;
        setAnswers(prev => ({
            ...prev,
            [currentQuestion.id]: optionId
        }));
        // Auto-save answer
        saveAnswerToDb(currentQuestion.id, optionId);
    };

    const toggleMark = () => {
        setMarkedQuestionIds(prev => {
            const next = new Set(prev);
            if (next.has(currentQuestion.id)) next.delete(currentQuestion.id);
            else next.add(currentQuestion.id);
            return next;
        });
    };

    const handleNext = () => {
        if (currentIndex < questions.length - 1) setCurrentIndex(prev => prev + 1);
    };

    const handlePrev = () => {
        if (currentIndex > 0) setCurrentIndex(prev => prev - 1);
    };

    const handleFinish = async () => {
        if (isFinished || isSubmitting) return;

        setShowFinishDialog(false);
        setIsSubmitting(true);
        if (timerRef.current) clearInterval(timerRef.current);

        // Calculate Score
        let calculatedScore = 0;
        const answerRecords = [];

        for (const q of questions) {
            const selectedOptionId = answers[q.id];
            const isCorrect = q.options.find(o => o.id === selectedOptionId)?.is_correct || false;

            if (isCorrect) calculatedScore++;

            answerRecords.push({
                user_id: (await supabase.auth.getUser()).data.user?.id,
                attempt_id: attemptId,
                question_id: q.id,
                option_id: selectedOptionId || null, // null if unanswered
                is_correct: isCorrect
            });
        }

        setScore(calculatedScore);

        // Save Records
        try {
            // Bulk insert attempts (might be large, so maybe chunk it if > 1000, but 200 is fine)
            // Note: saving per answer might be safer but bulk is faster for "Mock Exam" batch mode.
            // Actually, we should probably save answers as we go if we want to be safe, but simple is ok here.
            // Wait, question_attempts RLS might require user_id.

            // Save final result
            await supabase
                .from("exam_attempts")
                .update({
                    is_completed: true,
                    completed_at: new Date().toISOString(),
                    score: calculatedScore,
                    time_remaining: timeRemaining
                })
                .eq("id", attemptId);

            // Note: We might want to save detailed answers too for "Review", but
            // for now, let's just save the summary score as the primary goal.
            // Requirement said "Review Wrong Answers", so we DO need detailed records.
            // Let's insert them.
            const user = (await supabase.auth.getUser()).data.user;
            if (user && attemptId) {
                const records = questions.map(q => ({
                    user_id: user.id,
                    attempt_id: attemptId,
                    question_id: q.id,
                    option_id: answers[q.id] || null, // Allow null
                    is_correct: answers[q.id] ? (q.options.find(o => o.id === answers[q.id])?.is_correct ?? false) : false
                }));

                const { error } = await supabase.from("question_attempts").insert(records);
                if (error) console.error("Error saving details", error);
            }

        } catch (err) {
            console.error("Error finishing exam:", err);
            // Non-blocking: still show results even if save failed
        }

        setIsSubmitting(false);
        setIsFinished(true);
    };

    if (isFinished) {
        return (
            <div className="max-w-2xl mx-auto py-20 px-4 text-center">
                <div className="glass p-12 rounded-3xl">
                    <h2 className="text-3xl font-bold text-stone-800 mb-4">試験終了</h2>
                    <p className="text-stone-500 mb-8">お疲れ様でした。結果が表示されます。</p>

                    <div className="text-6xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-primary to-amber-300 mb-6">
                        {score} / {questions.length}
                    </div>
                    <p className="text-stone-500 mb-8 text-xl">
                        正答率: {Math.round((score / questions.length) * 100)}%
                    </p>

                    <div className="flex gap-4 justify-center">
                        <Button onClick={() => router.push("/dashboard")} variant="outline">
                            ダッシュボードへ
                        </Button>
                        <Button onClick={() => router.push("/practice/review/wrong")} variant="premium">
                            間違えた問題を見直す
                        </Button>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-stone-50 md:pb-20">
            {/* Header / Timer Bar */}
            <div className="fixed top-0 left-0 w-full h-16 bg-white/80 backdrop-blur-md border-b border-stone-200 flex items-center justify-between px-4 z-40">
                <div className="flex items-center gap-4">
                    <div className="flex items-center gap-2 font-mono text-xl font-bold text-stone-700 bg-stone-100 px-3 py-1 rounded-lg">
                        <Timer className="w-5 h-5 text-primary" />
                        {formatTime(timeRemaining)}
                    </div>
                </div>

                <div className="flex items-center gap-2">
                    <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => setIsMenuOpen(!isMenuOpen)}
                        className={cn("hidden md:flex", isMenuOpen && "bg-stone-100")}
                    >
                        <Grid className="w-5 h-5 mr-2" /> 問題一覧
                    </Button>
                    <Button
                        onClick={() => setShowFinishDialog(true)}
                        variant="default"
                        className="bg-stone-800 hover:bg-stone-700 text-white"
                        disabled={isSubmitting}
                    >
                        試験終了
                    </Button>
                </div>
            </div>

            {/* Main Content */}
            <div className="container max-w-4xl mx-auto pt-24 pb-32 px-4 flex gap-6">

                {/* Question Area */}
                <div className="flex-1">
                    <div className="glass p-8 rounded-2xl min-h-[500px] flex flex-col relative">
                        <div className="flex justify-between items-start mb-6">
                            <div className="text-sm font-bold text-stone-500">
                                Question {currentIndex + 1}
                                {currentQuestion.question_number && <span className="ml-2 bg-stone-100 text-stone-600 px-2 py-0.5 rounded text-xs">No.{currentQuestion.question_number}</span>}
                            </div>
                            <button onClick={toggleMark} className="text-stone-400 hover:text-yellow-500 transition-colors">
                                <Flag className={cn("w-6 h-6", markedQuestionIds.has(currentQuestion.id) && "fill-yellow-400 text-yellow-400")} />
                            </button>
                        </div>

                        <h3 className="text-xl md:text-2xl font-bold text-stone-800 mb-8 leading-relaxed">
                            {currentQuestion.content}
                        </h3>

                        <div className="space-y-3 flex-1">
                            {currentQuestion.options.map((option) => (
                                <div
                                    key={option.id}
                                    onClick={() => handleSelectOption(option.id)}
                                    className={cn(
                                        "p-4 rounded-xl border-2 transition-all cursor-pointer flex items-center gap-3 hover:bg-stone-50",
                                        answers[currentQuestion.id] === option.id
                                            ? "border-primary bg-primary/5"
                                            : "border-stone-200"
                                    )}
                                >
                                    <div className={cn(
                                        "w-6 h-6 rounded-full border-2 flex items-center justify-center shrink-0",
                                        answers[currentQuestion.id] === option.id
                                            ? "border-primary bg-primary text-white"
                                            : "border-stone-300"
                                    )}>
                                        {answers[currentQuestion.id] === option.id && <div className="w-2.5 h-2.5 bg-white rounded-full" />}
                                    </div>
                                    <span className={cn("font-medium", answers[currentQuestion.id] === option.id ? "text-primary" : "text-stone-700")}>
                                        {option.content}
                                    </span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Sidebar Grid (Desktop) */}
                <div className={cn(
                    "fixed right-0 top-16 bottom-0 w-80 bg-white border-l border-stone-200 p-4 overflow-y-auto transform transition-transform duration-300 z-30 md:relative md:transform-none md:w-64 md:border-none md:bg-transparent md:p-0 md:block",
                    isMenuOpen ? "translate-x-0" : "translate-x-full md:translate-x-0"
                )}>
                    <div className="bg-white/90 backdrop-blur rounded-xl p-4 md:glass md:sticky md:top-24">
                        <div className="flex items-center justify-between mb-4 md:hidden">
                            <h3 className="font-bold text-stone-700">問題一覧</h3>
                            <Button variant="ghost" size="sm" onClick={() => setIsMenuOpen(false)}>閉じる</Button>
                        </div>
                        <h3 className="font-bold text-stone-700 mb-4 hidden md:block">問題一覧</h3>

                        <div className="grid grid-cols-5 gap-2">
                            {questions.map((q, idx) => (
                                <button
                                    key={q.id}
                                    onClick={() => {
                                        setCurrentIndex(idx);
                                        setIsMenuOpen(false);
                                    }}
                                    className={cn(
                                        "w-8 h-8 rounded-lg flex items-center justify-center text-xs font-bold transition-all",
                                        idx === currentIndex
                                            ? "ring-2 ring-primary ring-offset-2 bg-white text-primary"
                                            : answers[q.id]
                                                ? "bg-primary text-white"
                                                : markedQuestionIds.has(q.id)
                                                    ? "bg-yellow-100 text-yellow-600 border border-yellow-300"
                                                    : "bg-stone-100 text-stone-400 hover:bg-stone-200"
                                    )}
                                >
                                    {idx + 1}
                                    {markedQuestionIds.has(q.id) && (
                                        <div className="absolute -top-1 -right-1 w-2 h-2 bg-yellow-400 rounded-full" />
                                    )}
                                </button>
                            ))}
                        </div>

                        <div className="mt-8 pt-4 border-t border-stone-200">
                            <div className="flex gap-4 text-xs text-stone-500 justify-center">
                                <div className="flex items-center gap-1"><div className="w-3 h-3 bg-primary rounded" /> 回答済</div>
                                <div className="flex items-center gap-1"><div className="w-3 h-3 bg-stone-100 rounded" /> 未回答</div>
                                <div className="flex items-center gap-1"><div className="w-3 h-3 bg-yellow-100 border border-yellow-300 rounded" /> チェック</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* Footer Navigation */}
            <div className="fixed bottom-0 left-0 w-full bg-white border-t border-stone-200 p-4 md:hidden z-40">
                <div className="flex justify-between items-center max-w-md mx-auto">
                    <Button variant="outline" onClick={handlePrev} disabled={currentIndex === 0}>
                        <ChevronLeft className="w-5 h-5" /> 前へ
                    </Button>
                    <span className="font-bold text-stone-600">
                        {currentIndex + 1} / {questions.length}
                    </span>
                    <Button variant="outline" onClick={handleNext} disabled={currentIndex === questions.length - 1}>
                        次へ <ChevronRight className="w-5 h-5" />
                    </Button>
                </div>
                <div className="mt-2 text-center">
                    <button onClick={() => setIsMenuOpen(true)} className="text-xs text-primary font-bold flex items-center justify-center gap-1 mx-auto">
                        <Grid className="w-3 h-3" /> 一覧を表示
                    </button>
                </div>
            </div>

            {/* Desktop Navigation Arrows (Floating) */}
            <div className="hidden md:block">
                <button
                    onClick={handlePrev}
                    disabled={currentIndex === 0}
                    className="fixed left-8 top-1/2 -translate-y-1/2 w-12 h-12 rounded-full glass flex items-center justify-center text-stone-600 hover:text-primary hover:scale-110 transition-all disabled:opacity-30 disabled:hover:scale-100"
                >
                    <ChevronLeft className="w-6 h-6" />
                </button>
                <button
                    onClick={handleNext}
                    disabled={currentIndex === questions.length - 1}
                    className="fixed right-8 top-1/2 -translate-y-1/2 w-12 h-12 rounded-full glass flex items-center justify-center text-stone-600 hover:text-primary hover:scale-110 transition-all disabled:opacity-30 disabled:hover:scale-100"
                >
                    <ChevronRight className="w-6 h-6" />
                </button>
            </div>

            {/* Finish Confirmation Dialog */}
            <AnimatePresence>
                {showFinishDialog && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 z-[100] flex items-center justify-center bg-black/50 backdrop-blur-sm px-4"
                        onClick={() => setShowFinishDialog(false)}
                    >
                        <motion.div
                            initial={{ scale: 0.9, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.9, opacity: 0 }}
                            transition={{ type: "spring", damping: 20 }}
                            className="bg-white rounded-2xl p-6 max-w-sm w-full shadow-2xl"
                            onClick={e => e.stopPropagation()}
                        >
                            <div className="flex items-center gap-3 mb-3">
                                <div className="p-2 rounded-full bg-red-50 text-red-500">
                                    <LogOut className="w-5 h-5" />
                                </div>
                                <h3 className="text-lg font-bold text-stone-800">試験を終了して採点しますか？</h3>
                            </div>
                            <p className="text-sm text-stone-500 mb-6">
                                未回答: {questions.length - Object.keys(answers).length}問 / 全{questions.length}問。<br />
                                この操作は取り消せません。
                            </p>
                            <div className="flex gap-3">
                                <Button
                                    variant="outline"
                                    className="flex-1"
                                    onClick={() => setShowFinishDialog(false)}
                                >
                                    続ける
                                </Button>
                                <Button
                                    className="flex-1 bg-red-500 hover:bg-red-600 text-white"
                                    loading={isSubmitting}
                                    onClick={handleFinish}
                                >
                                    終了して採点
                                </Button>
                            </div>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>
        </div>
    );
}
