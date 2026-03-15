import { createClient } from "@/lib/supabase/server";

export interface CategoryWeakness {
    categoryId: string;
    categoryName: string;
    accuracy: number; // 0-100
    attemptCount: number;
}

export interface DailyQuest {
    weakCategories: CategoryWeakness[];
    questions: any[]; // Specific Question Type to be defined
    targetScore: number;
    xpReward: number;
}

export async function getWeaknessAnalysis(userId: string): Promise<CategoryWeakness[]> {
    const supabase = await createClient();

    // 1. Fetch recent completed attempts (last 100)
    const { data: attempts } = await supabase
        .from("exam_attempts")
        .select(`
      score,
      total_questions,
      category_id,
      completed_at,
      categories (
        id,
        name
      )
    `)
        .eq("user_id", userId)
        .eq("is_completed", true)
        .not("category_id", "is", null)
        .order("completed_at", { ascending: false })
        .limit(100);

    if (!attempts || attempts.length === 0) {
        return [];
    }

    // 2. Aggregate data by category with simple recency weighting
    // We will split attempts into "Recent" (last 10) and "Older"
    // But for simple start, just aggregate all. 
    // To make it smarter, let's weight the last 5 attempts x2.

    const categoryStats: Record<string, {
        name: string;
        totalCorrect: number;
        totalQuestions: number;
        attempts: number
    }> = {};

    attempts.forEach((attempt, index) => {
        const cat = attempt.categories as unknown as { id: string, name: string };
        const catId = cat.id;
        const catName = cat.name;

        if (!categoryStats[catId]) {
            categoryStats[catId] = { name: catName, totalCorrect: 0, totalQuestions: 0, attempts: 0 };
        }

        // Weight: Newest 10 attempts get 2x weight
        const weight = index < 10 ? 2 : 1;

        // score is number of correct answers? 
        // Wait, in previous dashboard code: score is raw score.

        categoryStats[catId].totalCorrect += (attempt.score || 0) * weight;
        categoryStats[catId].totalQuestions += (attempt.total_questions || 0) * weight;
        categoryStats[catId].attempts += 1;
    });

    // 3. Calculate Accuracy and Sort
    const results: CategoryWeakness[] = Object.entries(categoryStats).map(([id, stat]) => ({
        categoryId: id,
        categoryName: stat.name,
        accuracy: stat.totalQuestions > 0 ? (stat.totalCorrect / stat.totalQuestions) * 100 : 0,
        attemptCount: stat.attempts
    }));

    // Sort by accuracy ascending (lowest first) -> Weakest
    return results.sort((a, b) => a.accuracy - b.accuracy);
}

export async function generateDailyQuest(userId: string): Promise<DailyQuest | null> {
    const weaknesses = await getWeaknessAnalysis(userId);

    if (weaknesses.length === 0) return null;

    // Pick top 3 weakest categories
    const targetWeaknesses = weaknesses.slice(0, 3);
    const targetCategoryIds = targetWeaknesses.map(w => w.categoryId);

    const supabase = await createClient();

    // Fetch 10 questions from these categories
    // Ideally we want questions user got WRONG or hasn't answered.
    // For V1 (Performance), just Random 10 from these categories.
    // RPC or multiple queries?
    // Let's rely on client-side randomization or a simple query if predictable.
    // supabase .from('questions') .in('category_id', targetCategoryIds) .limit(10) is biased to first inserted.

    // Better approach: Get a larger pool (e.g. 50) and random pick in JS.
    const { data: questionsCandidate } = await supabase
        .from("questions")
        .select("id, question_text, choices, correct_answer_index, explanation, category_id")
        .in("category_id", targetCategoryIds)
        .limit(50); // Get pool

    if (!questionsCandidate || questionsCandidate.length === 0) return null;

    // Fisher-Yates shuffle and pick 10
    const pool = [...questionsCandidate];
    for (let i = pool.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [pool[i], pool[j]] = [pool[j], pool[i]];
    }
    const selectedQuestions = pool.slice(0, 10);

    return {
        weakCategories: targetWeaknesses,
        questions: selectedQuestions,
        targetScore: 80, // Target 80%
        xpReward: 50 // Bonus XP
    };
}
