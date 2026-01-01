
import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Alert, ImageBackground, ActivityIndicator } from 'react-native';
import { supabase } from '../lib/supabase';

export default function LoginScreen() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);

    async function signInWithEmail() {
        setLoading(true);
        const { error } = await supabase.auth.signInWithPassword({
            email,
            password,
        });

        if (error) Alert.alert("Error", error.message);
        setLoading(false);
    }

    // Simple Glass UI using Tailwind
    return (
        <View className="flex-1 bg-stone-900 justify-center px-8">
            <View className="absolute inset-0 bg-stone-900" />

            {/* Background Gradients could go here */}

            <View className="bg-white/10 p-8 rounded-3xl border border-white/20 backdrop-blur-xl">
                <Text className="text-3xl font-bold text-white mb-2 text-center">Kanei Quest</Text>
                <Text className="text-stone-300 mb-8 text-center">管理栄養士国家試験対策</Text>

                <TextInput
                    className="bg-black/30 text-white p-4 rounded-xl mb-4 border border-white/10"
                    placeholder="Email"
                    placeholderTextColor="#9ca3af"
                    onChangeText={setEmail}
                    value={email}
                    autoCapitalize="none"
                />

                <TextInput
                    className="bg-black/30 text-white p-4 rounded-xl mb-6 border border-white/10"
                    placeholder="Password"
                    placeholderTextColor="#9ca3af"
                    secureTextEntry
                    onChangeText={setPassword}
                    value={password}
                    autoCapitalize="none"
                />

                <TouchableOpacity
                    className="bg-amber-500 p-4 rounded-xl items-center"
                    onPress={signInWithEmail}
                    disabled={loading}
                >
                    {loading ? (
                        <ActivityIndicator color="white" />
                    ) : (
                        <Text className="font-bold text-stone-900">ログイン</Text>
                    )}
                </TouchableOpacity>

                <TouchableOpacity className="mt-4 items-center">
                    <Text className="text-stone-400 text-sm">アカウントをお持ちでない方はWeb版で登録</Text>
                </TouchableOpacity>
            </View>
        </View>
    );
}
