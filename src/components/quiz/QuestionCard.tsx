"use client";

import { useState } from "react";
import { CheckCircle, XCircle } from "lucide-react";
import { cn } from "@/lib/utils";

export type Question = {
    id: string;
    text: string;
    options: string[];
    correctAnswerIndex: number;
    explanation: string;
    category: string;
};

interface QuestionCardProps {
    question: Question;
    onNext?: () => void;
}

export function QuestionCard({ question, onNext }: QuestionCardProps) {
    const [selectedOption, setSelectedOption] = useState<number | null>(null);
    const [isAnswered, setIsAnswered] = useState(false);

    const handleOptionClick = (index: number) => {
        if (isAnswered) return;
        setSelectedOption(index);
    };

    const handleSubmit = () => {
        if (selectedOption === null) return;
        setIsAnswered(true);
    };

    const isCorrect = selectedOption === question.correctAnswerIndex;

    return (
        <div className="w-full max-w-3xl glass rounded-2xl overflow-hidden shadow-2xl relative">
            {/* Header */}
            <div className="bg-stone-50/50 px-8 py-6 border-b border-stone-100 flex justify-between items-center backdrop-blur-sm">
                <span className="text-xs font-bold tracking-wider text-primary uppercase bg-primary/10 px-3 py-1 rounded-full border border-primary/20">
                    {question.category}
                </span>
                <span className="text-xs font-medium text-stone-400">ID: {question.id}</span>
            </div>

            <div className="p-8 space-y-8">
                {/* Question Text */}
                <h3 className="text-xl md:text-2xl font-bold leading-relaxed text-stone-800">
                    {question.text}
                </h3>

                {/* Options */}
                <div className="space-y-4">
                    {question.options.map((option, index) => {
                        const isSelected = selectedOption === index;
                        const isCorrectOption = index === question.correctAnswerIndex;

                        // Determine styles based on state
                        let optionStyle = "border-stone-200 hover:bg-stone-50 hover:border-primary/30 text-stone-600";
                        if (isAnswered) {
                            if (isCorrectOption) {
                                optionStyle = "border-primary bg-primary/20 text-primary-foreground shadow-[0_4px_14px_rgba(251,113,133,0.3)]";
                            } else if (isSelected && !isCorrect) {
                                optionStyle = "border-red-200 bg-red-50 text-red-600";
                            } else {
                                optionStyle = "opacity-40 grayscale";
                            }
                        } else if (isSelected) {
                            optionStyle = "border-primary bg-primary/10 text-primary-foreground shadow-[0_4px_10px_rgba(251,113,133,0.2)] ring-1 ring-primary";
                        }

                        return (
                            <button
                                key={index}
                                onClick={() => handleOptionClick(index)}
                                disabled={isAnswered}
                                className={cn(
                                    "w-full text-left p-5 rounded-xl border transition-all duration-300 group relative overflow-hidden",
                                    optionStyle
                                )}
                            >
                                <div className="flex items-start gap-4 z-10 relative">
                                    <div className={cn(
                                        "flex-shrink-0 w-8 h-8 rounded-full border flex items-center justify-center text-sm font-bold mt-0.5 transition-colors",
                                        isSelected || (isAnswered && isCorrectOption)
                                            ? "border-primary bg-primary text-stone-900"
                                            : "border-stone-200 text-stone-500 group-hover:border-primary/50 group-hover:text-primary"
                                    )}>
                                        {index + 1}
                                    </div>
                                    <span className="text-base md:text-lg leading-relaxed">{option}</span>
                                </div>
                            </button>
                        );
                    })}
                </div>

                {/* Actions / Feedback */}
                <div className="pt-6">
                    {!isAnswered ? (
                        <div className="flex justify-end">
                            <button
                                onClick={handleSubmit}
                                disabled={selectedOption === null}
                                className="w-full md:w-auto bg-gradient-to-r from-primary to-rose-400 text-white px-10 py-4 rounded-full font-bold shadow-lg hover:shadow-[0_6px_20px_rgba(251,113,133,0.4)] hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none transition-all"
                            >
                                回答を送信
                            </button>
                        </div>
                    ) : (
                        <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
                            <div className={cn(
                                "p-6 rounded-xl flex items-center gap-4 border",
                                isCorrect
                                    ? "bg-primary/20 border-primary/30 text-primary-foreground"
                                    : "bg-red-50 border-red-200 text-red-600"
                            )}>
                                {isCorrect ? (
                                    <CheckCircle className="w-8 h-8 text-primary flex-shrink-0" />
                                ) : (
                                    <XCircle className="w-8 h-8 text-red-500 flex-shrink-0" />
                                )}
                                <div>
                                    <span className="font-bold text-xl block">
                                        {isCorrect ? "正解！" : "残念..."}
                                    </span>
                                    <span className="text-sm opacity-90">
                                        {isCorrect ? "素晴らしい理解力です。" : "解説を読んで復習しましょう。"}
                                    </span>
                                </div>
                            </div>

                            <div className="bg-stone-50/50 p-8 rounded-2xl border border-stone-100 relative overflow-hidden">
                                <div className="absolute top-0 left-0 w-1 h-full bg-gradient-to-b from-primary to-transparent" />
                                <h4 className="font-bold mb-4 text-sm text-primary uppercase tracking-wider flex items-center gap-2">
                                    <span className="w-2 h-2 rounded-full bg-primary" />
                                    解説
                                </h4>
                                <p className="leading-relaxed text-stone-600 text-base md:text-lg">
                                    {question.explanation}
                                </p>
                            </div>

                            {onNext && (
                                <div className="flex justify-end pt-4">
                                    <button
                                        onClick={onNext}
                                        className="bg-white border border-stone-200 text-stone-700 px-8 py-3 rounded-full font-bold hover:bg-stone-50 hover:border-primary/30 transition-all flex items-center gap-2 group"
                                    >
                                        次の問題へ
                                        <span className="group-hover:translate-x-1 transition-transform">→</span>
                                    </button>
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
