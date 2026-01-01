import React from 'react';
import { View, Text, ScrollView, TouchableOpacity } from 'react-native';
import { useRouter } from 'expo-router';

export default function PracticeScreen() {
    const router = useRouter();

    return (
        <View className="flex-1 bg-stone-50 p-6 pt-16">
            <Text className="text-2xl font-bold text-stone-800 mb-6">演習モード</Text>

            <View className="gap-4">
                <View className="bg-white p-6 rounded-2xl shadow-sm border border-stone-200">
                    <Text className="text-lg font-bold text-stone-800 mb-2">ランダム演習</Text>
                    <Text className="text-stone-500 mb-4">全範囲からランダムに出題されます。</Text>
                    <TouchableOpacity
                        onPress={() => router.push({ pathname: '/quiz/[type]', params: { type: 'random' } })}
                        className="bg-indigo-600 p-3 rounded-xl items-center"
                    >
                        <Text className="text-white font-bold">スタート</Text>
                    </TouchableOpacity>
                </View>

                <View className="bg-white p-6 rounded-2xl shadow-sm border border-stone-200">
                    <Text className="text-lg font-bold text-stone-800 mb-2">分野別演習</Text>
                    <Text className="text-stone-500 mb-4">苦手な分野を集中特訓。</Text>
                    <TouchableOpacity
                        onPress={() => router.push('/practice/categories')}
                        className="bg-stone-100 p-3 rounded-xl items-center border border-stone-200"
                    >
                        <Text className="text-stone-600 font-bold">分野を選ぶ</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    );
}
