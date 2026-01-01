import { Tabs } from 'expo-router';
import React from 'react';
import { FontAwesome5, Ionicons } from '@expo/vector-icons';
import { useColorScheme } from 'react-native';

export default function TabLayout() {
  const colorScheme = useColorScheme();
  const tintColor = colorScheme === 'dark' ? '#fbbf24' : '#d97706'; // Amber-500/Amber-600

  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: tintColor,
        headerShown: false,
        tabBarStyle: {
          backgroundColor: colorScheme === 'dark' ? '#1c1917' : '#ffffff', // Stone-900 / White
          borderTopWidth: 0,
          elevation: 0,
          height: 60,
          paddingBottom: 8,
          paddingTop: 8,
        },
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'ホーム',
          tabBarIcon: ({ color }) => <FontAwesome5 size={24} name="home" color={color} />,
        }}
      />
      <Tabs.Screen
        name="practice"
        options={{
          title: '演習',
          tabBarIcon: ({ color }) => <FontAwesome5 size={24} name="book-open" color={color} />,
        }}
      />
      <Tabs.Screen
        name="profile"
        options={{
          title: 'マイページ',
          tabBarIcon: ({ color }) => <FontAwesome5 size={24} name="user-alt" color={color} />,
        }}
      />
    </Tabs>
  );
}
