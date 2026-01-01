import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, ScrollView, Alert, ActivityIndicator } from 'react-native';
import { supabase } from '../../lib/supabase';
import { useRouter } from 'expo-router';
import { FontAwesome5, Ionicons } from '@expo/vector-icons';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function ProfileScreen() {
    const router = useRouter();
    const [profile, setProfile] = useState<any>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchProfile();
    }, []);

    const fetchProfile = async () => {
        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;

            const { data } = await supabase.from('profiles').select('*').eq('id', user.id).single();
            setProfile({ ...data, email: user.email });
        } catch (e) {
            console.error(e);
        } finally {
            setLoading(false);
        }
    };

    const handleLogout = async () => {
        Alert.alert("ログアウト", "本当にログアウトしますか？", [
            { text: "キャンセル", style: "cancel" },
            {
                text: "ログアウト",
                style: "destructive",
                onPress: async () => {
                    await supabase.auth.signOut();
                    router.replace('/');
                }
            }
        ]);
    };

    if (loading) {
        return (
            <View className="flex-1 justify-center items-center bg-stone-50">
                <ActivityIndicator color="#d97706" />
            </View>
        );
    }

    return (
        <SafeAreaView className="flex-1 bg-stone-50">
            <View className="px-6 py-4 flex-row items-center justify-between bg-white border-b border-stone-100">
                <Text className="text-xl font-bold text-stone-800">マイページ</Text>
                <View className="bg-amber-100 px-3 py-1 rounded-full">
                    <Text className="text-amber-700 font-bold text-xs">
                        {profile?.plan === 'pro' ? 'PRO PLAN' : 'FREE PLAN'}
                    </Text>
                </View>
            </View>

            <ScrollView className="p-4">
                {/* Profile Header */}
                <View className="bg-white p-6 rounded-2xl shadow-sm border border-stone-200 mb-6 items-center">
                    <View className="w-20 h-20 bg-stone-200 rounded-full mb-4 items-center justify-center">
                        <FontAwesome5 name="user-alt" size={32} color="#78716c" />
                    </View>
                    <Text className="text-xl font-bold text-stone-800 mb-1">{profile?.name || 'ゲストユーザー'}</Text>
                    <Text className="text-stone-500 text-sm">{profile?.email}</Text>
                </View>

                <View className="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden mb-6">
                    <TouchableOpacity className="p-4 border-b border-stone-100 flex-row justify-between items-center">
                        <View className="flex-row items-center">
                            <Ionicons name="settings-outline" size={20} color="#57534e" style={{ marginRight: 12 }} />
                            <Text className="text-stone-700 font-medium">アカウント設定</Text>
                        </View>
                        <FontAwesome5 name="chevron-right" size={12} color="#d6d3d1" />
                    </TouchableOpacity>
                    <TouchableOpacity className="p-4 border-b border-stone-100 flex-row justify-between items-center">
                        <View className="flex-row items-center">
                            <FontAwesome5 name="history" size={16} color="#57534e" style={{ marginRight: 12, width: 20, textAlign: 'center' }} />
                            <Text className="text-stone-700 font-medium">学習履歴</Text>
                        </View>
                        <FontAwesome5 name="chevron-right" size={12} color="#d6d3d1" />
                    </TouchableOpacity>
                    <TouchableOpacity className="p-4 border-b border-stone-100 flex-row justify-between items-center">
                        <View className="flex-row items-center">
                            <FontAwesome5 name="envelope" size={16} color="#57534e" style={{ marginRight: 12, width: 20, textAlign: 'center' }} />
                            <Text className="text-stone-700 font-medium">お問い合わせ</Text>
                        </View>
                        <FontAwesome5 name="chevron-right" size={12} color="#d6d3d1" />
                    </TouchableOpacity>
                </View>

                <TouchableOpacity onPress={handleLogout} className="bg-rose-50 p-4 rounded-xl items-center border border-rose-100">
                    <Text className="text-rose-600 font-bold">ログアウト</Text>
                </TouchableOpacity>

                <Text className="text-center text-stone-400 text-xs mt-8">Version 1.0.0 (Expo)</Text>
            </ScrollView>
        </SafeAreaView>
    );
}
