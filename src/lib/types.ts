export type User = {
    id: string;
    email: string;
    name: string;
    plan: 'free' | 'pro';
    role: 'admin' | 'user';
};

export type Question = {
    id: string;
    category: string;
    text: string;
    options: string[];
    correctAnswerIndex: number;
    explanation: string;
    year: number; // e.g., 2024 (38th exam)
};

export type QuizAttempt = {
    id: string;
    userId: string;
    date: string;
    score: number;
    totalQuestions: number;
    mode: 'practice' | 'mock_exam';
    timeRemaining?: number; // in seconds
    answers: {
        questionId: string;
        selectedOptionIndex: number;
        isCorrect: boolean;
    }[];
};
