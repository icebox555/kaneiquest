
import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, ScrollView, ActivityIndicator, Alert } from 'react-native';
import Animated, { FadeInDown, FadeInUp } from 'react-native-reanimated';
import { useLocalSearchParams, useRouter } from 'expo-router';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../components/AuthProvider';
import { FontAwesome5 } from '@expo/vector-icons';
import { SafeAreaView } from 'react-native-safe-area-context';
import clsx from 'clsx';
import * as Haptics from 'expo-haptics';

type Option = {
    id: string;
    content: string;
    is_correct: boolean;
};

type Question = {
    id: string;
    content: string;
    explanation: string;
    options: Option[];
};

export default function QuizScreen() {
    const { type, id } = useLocalSearchParams<{ type: string; id: string }>();
    const router = useRouter();
    const { session } = useAuth();

    const [questions, setQuestions] = useState<Question[]>([]);
    const [currentIndex, setCurrentIndex] = useState(0);
    const [loading, setLoading] = useState(true);
    const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
    const [isAnswered, setIsAnswered] = useState(false);
    const [score, setScore] = useState(0);

    useEffect(() => {
        fetchQuestions();
    }, [type, id]);

    const fetchQuestions = async () => {
        try {
            setLoading(true);
            let query = supabase.from('questions').select('id, content, explanation, options(id, content, is_correct)');

            if (type === 'random') {
                // Random 10 questions for now
                // Note: Supabase random selection is complex, for MVP we fetch specific range or just limit
                query = query.limit(10);
            } else if (type === 'category' && id) {
                query = query.eq('category_id', id).limit(10);
            } else if (type === 'year' && id) {
                query = query.eq('exam_year', id).limit(10);
            }

            const { data, error } = await query;

            if (error) throw error;
            if (data) {
                // Shuffle options and questions if needed
                const formattedQuestions = data.map((q: any) => ({
                    ...q,
                    options: q.options.sort(() => Math.random() - 0.5)
                }));
                setQuestions(formattedQuestions.sort(() => Math.random() - 0.5));
            }
        } catch (error) {
            console.error(error);
            Alert.alert('Error', 'Failed to load questions');
        } finally {
            setLoading(false);
        }
    };

    const handleAnswer = async (optionId: string) => {
        if (isAnswered) return;

        setSelectedOptionId(optionId);
        setIsAnswered(true);

        const question = questions[currentIndex];
        const selectedOption = question.options.find(o => o.id === optionId);
        const isCorrect = selectedOption?.is_correct || false;

        if (isCorrect) {
            setScore(s => s + 1);
            Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success);
        } else {
            Haptics.notificationAsync(Haptics.NotificationFeedbackType.Error);
        }

        // Save attempt (fire and forget)
        if (session?.user) {
            supabase.from('question_attempts').insert({
                user_id: session.user.id,
                question_id: question.id,
                selected_option_id: optionId,
                is_correct: isCorrect,
                mode: type || 'practice'
            }).then(({ error }) => {
                if (error) console.error("Failed to save attempt", error);
            });
        }
    };

    const nextQuestion = () => {
        Haptics.selectionAsync();
        if (currentIndex < questions.length - 1) {
            setCurrentIndex(c => c + 1);
            setIsAnswered(false);
            setSelectedOptionId(null);
        } else {
            // Finish
            Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success);
            Alert.alert("Quiz Completed", `Score: ${score}/${questions.length}`, [
                { text: "OK", onPress: () => router.back() }
            ]);
        }
    };

    if (loading) {
        return (
            <View className="flex-1 justify-center items-center bg-stone-50">
                <ActivityIndicator size="large" color="#d97706" />
            </View>
        );
    }

    if (questions.length === 0) {
        return (
            <View className="flex-1 justify-center items-center bg-stone-50 p-6">
                <Text className="text-lg text-stone-600 mb-4">問題が見つかりませんでした。</Text>
                <TouchableOpacity onPress={() => router.back()} className="bg-amber-500 px-6 py-3 rounded-xl">
                    <Text className="text-white font-bold">戻る</Text>
                </TouchableOpacity>
            </View>
        )
    }

    const currentQuestion = questions[currentIndex];

    return (
        <SafeAreaView className="flex-1 bg-stone-50">
            {/* Header */}
            <View className="flex-row items-center justify-between px-4 py-2 border-b border-stone-200 bg-white">
                <TouchableOpacity onPress={() => router.back()} className="p-2">
                    <FontAwesome5 name="times" size={20} color="#78716c" />
                </TouchableOpacity>
                <View className="flex-row items-center">
                    <View className="w-32 h-2 bg-stone-100 rounded-full overflow-hidden mr-2">
                        <View
                            className="h-full bg-amber-500"
                            style={{ width: `${((currentIndex + 1) / questions.length) * 100}%` }}
                        />
                    </View>
                    <Text className="font-bold text-stone-600">{currentIndex + 1}/{questions.length}</Text>
                </View>
            </View>

            <ScrollView className="flex-1 p-6">
                <Text className="text-xl font-bold text-stone-800 leading-8 mb-8">
                    {currentQuestion.content}
                </Text>

                <View className="gap-3">
                    {currentQuestion.options.map((option, index) => {
                        const isSelected = selectedOptionId === option.id;
                        const showCorrect = isAnswered && option.is_correct;
                        const showWrong = isAnswered && isSelected && !option.is_correct;

                        return (
                            <Animated.View
                                key={option.id}
                                entering={FadeInDown.delay(index * 100)}
                            >
                                <TouchableOpacity
                                    disabled={isAnswered}
                                    onPress={() => handleAnswer(option.id)}
                                    className={clsx(
                                        "p-4 rounded-xl border-2 flex-row items-center",
                                        showCorrect ? "bg-emerald-50 border-emerald-500" :
                                            showWrong ? "bg-rose-50 border-rose-500" :
                                                isSelected ? "bg-amber-50 border-amber-500" :
                                                    "bg-white border-stone-200"
                                    )}
                                >
                                    <View className={clsx(
                                        "w-6 h-6 rounded-full border-2 items-center justify-center mr-3",
                                        showCorrect ? "border-emerald-500 bg-emerald-500" :
                                            showWrong ? "border-rose-500 bg-rose-500" :
                                                isSelected ? "border-amber-500" :
                                                    "border-stone-300"
                                    )}>
                                        {showCorrect && <FontAwesome5 name="check" size={12} color="white" />}
                                        {showWrong && <FontAwesome5 name="times" size={12} color="white" />}
                                    </View>
                                    <Text className={clsx(
                                        "flex-1 font-medium",
                                        showCorrect ? "text-emerald-700" :
                                            showWrong ? "text-rose-700" :
                                                "text-stone-700"
                                    )}>
                                        {option.content}
                                    </Text>
                                </TouchableOpacity>
                            </Animated.View>
                        );
                    })}
                </View>

                {isAnswered && (
                    <Animated.View
                        entering={FadeInUp}
                        className="mt-8 bg-blue-50 p-4 rounded-xl border border-blue-100"
                    >
                        <Text className="font-bold text-blue-800 mb-2">解説</Text>
                        <Text className="text-blue-900 leading-6">{currentQuestion.explanation || "解説は準備中です。"}</Text>
                    </Animated.View>
                )}

                <View className="h-20" />
            </ScrollView>

            {isAnswered && (
                <View className="absolute bottom-0 left-0 right-0 p-6 bg-white border-t border-stone-100 shadow-lg">
                    <TouchableOpacity
                        onPress={nextQuestion}
                        className="bg-amber-500 p-4 rounded-xl items-center shadow-md shadow-amber-200"
                    >
                        <Text className="text-white font-bold text-lg">
                            {currentIndex < questions.length - 1 ? "次へ" : "結果を見る"}
                        </Text>
                    </TouchableOpacity>
                </View>
            )}
        </SafeAreaView>
    );
}
