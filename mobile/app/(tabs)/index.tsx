
import React, { useEffect, useState } from 'react';
import { View, Text, ScrollView, TouchableOpacity, Image } from 'react-native';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../components/AuthProvider';
import { FontAwesome5, Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import * as Haptics from 'expo-haptics';

export default function DashboardScreen() {
  const { session } = useAuth();
  const router = useRouter();
  const [hearts, setHearts] = useState(5);
  const [streak, setStreak] = useState(0); // Placeholder
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (session?.user) {
      fetchHearts();
    }
  }, [session]);

  const fetchHearts = async () => {
    try {
      const { data, error } = await supabase
        .from('hearts')
        .select('count, last_updated')
        .eq('user_id', session?.user.id)
        .single();

      if (data) {
        setHearts(data.count);
        // Refresh calculation for recovery could be done here similar to backend
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  return (
    <View className="flex-1 bg-stone-50">
      <ScrollView contentContainerStyle={{ paddingBottom: 100 }}>
        {/* Header */}
        <View className="pt-16 pb-6 px-6 bg-white shadow-sm border-b border-stone-100 flex-row justify-between items-center">
          <View>
            <Text className="text-xl font-bold text-stone-800">こんにちは,</Text>
            <Text className="text-stone-500">{session?.user.email?.split('@')[0]}さん</Text>
          </View>
          {/* Heart Display */}
          <View className="flex-row items-center bg-rose-50 px-3 py-1.5 rounded-full border border-rose-100">
            <Ionicons name="heart" size={20} color="#f43f5e" />
            <Text className="ml-1.5 font-bold text-rose-600">{hearts}</Text>
          </View>
        </View>

        {/* Quick Actions */}
        <View className="p-6">
          <Text className="text-lg font-bold text-stone-800 mb-4">今日の学習</Text>

          <View className="flex-row justify-between gap-4">
            <TouchableOpacity
              className="flex-1 bg-indigo-600 rounded-2xl p-5 shadow-lg shadow-indigo-200"
              onPress={() => {
                Haptics.selectionAsync();
                router.push({ pathname: '/quiz/[type]', params: { type: 'random' } });
              }}
            >
              <View className="bg-white/20 w-10 h-10 rounded-full items-center justify-center mb-3">
                <FontAwesome5 name="random" size={18} color="white" />
              </View>
              <Text className="text-white font-bold text-lg">ランダム演習</Text>
              <Text className="text-indigo-200 text-xs mt-1">時間がない時はこれ</Text>
            </TouchableOpacity>

            <TouchableOpacity
              className="flex-1 bg-amber-500 rounded-2xl p-5 shadow-lg shadow-amber-200"
              onPress={() => {
                Haptics.selectionAsync();
                router.push({ pathname: '/quiz/[type]', params: { type: 'random', limit: 5 } });
              }}
            >
              <View className="bg-white/20 w-10 h-10 rounded-full items-center justify-center mb-3">
                <FontAwesome5 name="check-circle" size={18} color="white" />
              </View>
              <Text className="text-white font-bold text-lg">今日の５問</Text>
              <Text className="text-amber-100 text-xs mt-1">毎日コツコツ</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Stats / Resume */}
        <View className="px-6 mb-6">
          <View className="bg-white p-5 rounded-2xl border border-stone-200 shadow-sm">
            <View className="flex-row justify-between items-center mb-4">
              <Text className="font-bold text-stone-700">前回の続きから</Text>
              <TouchableOpacity>
                <Text className="text-stone-400 text-xs">すべて見る</Text>
              </TouchableOpacity>
            </View>

            <TouchableOpacity className="flex-row items-center justify-between p-3 bg-stone-50 rounded-xl border border-stone-100">
              <View className="flex-row items-center">
                <View className="w-10 h-10 bg-emerald-100 rounded-full items-center justify-center mr-3">
                  <FontAwesome5 name="clock" size={18} color="#10b981" />
                </View>
                <View>
                  <Text className="font-bold text-stone-700">第39回 過去問</Text>
                  <Text className="text-xs text-stone-500">残り: 12問</Text>
                </View>
              </View>
              <FontAwesome5 name="chevron-right" size={12} color="#a8a29e" />
            </TouchableOpacity>
          </View>
        </View>

      </ScrollView>
    </View>
  );
}
