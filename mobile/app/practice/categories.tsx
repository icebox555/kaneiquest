
import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, ScrollView, ActivityIndicator } from 'react-native';
import { useRouter } from 'expo-router';
import { supabase } from '../../lib/supabase';
import { FontAwesome5 } from '@expo/vector-icons';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function CategorySelectionScreen() {
    const router = useRouter();
    const [categories, setCategories] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchCategories();
    }, []);

    const fetchCategories = async () => {
        try {
            const { data, error } = await supabase.from('categories').select('*').order('name');
            if (data) setCategories(data);
        } catch (e) {
            console.error(e);
        } finally {
            setLoading(false);
        }
    };

    return (
        <SafeAreaView className="flex-1 bg-stone-50">
            <View className="px-6 py-4 border-b border-stone-200 bg-white flex-row items-center">
                <TouchableOpacity onPress={() => router.back()} className="mr-4">
                    <FontAwesome5 name="arrow-left" size={20} color="#57534e" />
                </TouchableOpacity>
                <Text className="text-xl font-bold text-stone-800">分野を選択</Text>
            </View>

            {loading ? (
                <View className="flex-1 justify-center items-center">
                    <ActivityIndicator color="#d97706" />
                </View>
            ) : (
                <ScrollView className="p-4">
                    <View className="gap-3">
                        {categories.map((category) => (
                            <TouchableOpacity
                                key={category.id}
                                className="bg-white p-5 rounded-xl border border-stone-100 shadow-sm flex-row justify-between items-center"
                                onPress={() => router.push({ pathname: '/quiz/[type]', params: { type: 'category', id: category.id } })}
                            >
                                <Text className="text-stone-700 font-bold text-lg">{category.name}</Text>
                                <FontAwesome5 name="chevron-right" size={14} color="#d6d3d1" />
                            </TouchableOpacity>
                        ))}
                    </View>
                    <View className="h-20" />
                </ScrollView>
            )}
        </SafeAreaView>
    );
}
