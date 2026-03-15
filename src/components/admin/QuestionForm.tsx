"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { saveQuestion } from "@/lib/actions/admin";
import { Button } from "@/components/ui/Button";
import { Input } from "@/components/ui/Input";
import { Label } from "@/components/ui/Label";
import { Plus, Trash, Save } from "lucide-react";

type Category = {
    id: string;
    name: string;
};

type Option = {
    id?: string;
    content: string;
    is_correct: boolean;
};

type QuestionData = {
    id?: string;
    category_id: string;
    content: string;
    explanation: string;
    difficulty: number;
    exam_year?: number;
    question_number?: number;
    options: Option[];
};

interface QuestionFormProps {
    categories: Category[];
    initialData?: QuestionData;
}

export function QuestionForm({ categories, initialData }: QuestionFormProps) {
    const router = useRouter();
    const [loading, setLoading] = useState(false);
    const [formData, setFormData] = useState<QuestionData>({
        category_id: initialData?.category_id || categories[0]?.id || "",
        content: initialData?.content || "",
        explanation: initialData?.explanation || "",
        difficulty: initialData?.difficulty || 1,
        exam_year: initialData?.exam_year,
        question_number: initialData?.question_number,
        options: initialData?.options || [
            { content: "", is_correct: true },
            { content: "", is_correct: false },
        ]
    });

    const handleOptionChange = (index: number, field: string, value: any) => {
        const newOptions = [...formData.options];
        if (field === "is_correct") {
            // Ensure only one correct answer
            newOptions.forEach(opt => opt.is_correct = false);
            newOptions[index].is_correct = true;
        } else {
            (newOptions[index] as unknown as Record<string, any>)[field] = value;
        }
        setFormData({ ...formData, options: newOptions });
    };

    const addOption = () => {
        setFormData({
            ...formData,
            options: [...formData.options, { content: "", is_correct: false }]
        });
    };

    const removeOption = (index: number) => {
        if (formData.options.length <= 2) return;
        const newOptions = formData.options.filter((_, i) => i !== index);
        if (formData.options[index].is_correct && newOptions.length > 0) {
            newOptions[0].is_correct = true;
        }
        setFormData({ ...formData, options: newOptions });
    };

    const [validationError, setValidationError] = useState<string | null>(null);

    const validate = (): boolean => {
        if (!formData.content.trim()) {
            setValidationError("問題文を入力してください。");
            return false;
        }
        if (formData.options.length < 2) {
            setValidationError("選択肢は2つ以上必要です。");
            return false;
        }
        const emptyOption = formData.options.findIndex(o => !o.content.trim());
        if (emptyOption !== -1) {
            setValidationError(`選択肢 ${emptyOption + 1} が空欄です。`);
            return false;
        }
        const hasCorrect = formData.options.some(o => o.is_correct);
        if (!hasCorrect) {
            setValidationError("正解の選択肢を選んでください。");
            return false;
        }
        setValidationError(null);
        return true;
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!validate()) return;
        setLoading(true);

        try {
            // Collect option IDs that were removed (update only)
            const optionIdsToDelete: string[] = [];
            if (initialData?.id && initialData.options) {
                const currentIds = formData.options.map((o) => o.id).filter(Boolean);
                initialData.options
                    .map((o) => o.id)
                    .filter((id): id is string => !!id && !currentIds.includes(id))
                    .forEach((id) => optionIdsToDelete.push(id));
            }

            // Server Action: verifies admin role and validates all inputs server-side
            const result = await saveQuestion({
                id: initialData?.id,
                category_id: formData.category_id,
                content: formData.content,
                explanation: formData.explanation,
                difficulty: formData.difficulty,
                exam_year: formData.exam_year,
                question_number: formData.question_number,
                options: formData.options,
                optionIdsToDelete,
            });

            if (result.error) throw new Error(result.error);

            alert(initialData ? "保存しました" : "問題を作成しました");
            router.push("/admin/questions");
            router.refresh();
        } catch (error: unknown) {
            const message = error instanceof Error ? error.message : "不明なエラーが発生しました";
            alert("エラーが発生しました: " + message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="space-y-8">
            <div className="grid gap-6 md:grid-cols-2">
                <div className="space-y-2">
                    <Label htmlFor="category">分野</Label>
                    <select
                        id="category"
                        className="w-full rounded-md border border-slate-700 bg-slate-800/50 px-3 py-2 text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                        value={formData.category_id}
                        onChange={(e) => setFormData({ ...formData, category_id: e.target.value })}
                        required
                    >
                        {categories.map((cat) => (
                            <option key={cat.id} value={cat.id}>
                                {cat.name}
                            </option>
                        ))}
                    </select>
                </div>

                <div className="space-y-2">
                    <Label htmlFor="difficulty">難易度</Label>
                    <select
                        id="difficulty"
                        className="w-full rounded-md border border-slate-700 bg-slate-800/50 px-3 py-2 text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                        value={formData.difficulty}
                        onChange={(e) => setFormData({ ...formData, difficulty: parseInt(e.target.value) })}
                    >
                        <option value={1}>★☆☆ Easy</option>
                        <option value={2}>★★☆ Medium</option>
                        <option value={3}>★★★ Hard</option>
                    </select>
                </div>
            </div>

            <div className="grid gap-6 md:grid-cols-2">
                <div className="space-y-2">
                    <Label htmlFor="exam_year">実施年度 (任意)</Label>
                    <Input
                        id="exam_year"
                        type="number"
                        placeholder="例: 2024"
                        value={formData.exam_year || ""}
                        onChange={(e) => setFormData({ ...formData, exam_year: e.target.value ? parseInt(e.target.value) : undefined })}
                    />
                </div>
                <div className="space-y-2">
                    <Label htmlFor="question_number">問番号 (任意)</Label>
                    <Input
                        id="question_number"
                        type="number"
                        placeholder="例: 1"
                        value={formData.question_number || ""}
                        onChange={(e) => setFormData({ ...formData, question_number: e.target.value ? parseInt(e.target.value) : undefined })}
                    />
                </div>
            </div>

            <div className="space-y-2">
                <Label htmlFor="content">問題文</Label>
                <textarea
                    id="content"
                    className="min-h-[100px] w-full rounded-md border border-slate-700 bg-slate-800/50 px-3 py-2 text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                    value={formData.content}
                    onChange={(e) => setFormData({ ...formData, content: e.target.value })}
                    required
                />
            </div>

            <div className="space-y-4">
                <div className="flex items-center justify-between">
                    <Label>選択肢</Label>
                    <Button type="button" variant="outline" size="sm" onClick={addOption} className="gap-2">
                        <Plus className="w-4 h-4" /> 選択肢を追加
                    </Button>
                </div>

                <div className="grid gap-4">
                    {formData.options.map((option, index) => (
                        <div key={index} className="flex gap-4 items-center animate-in fade-in slide-in-from-left-4 duration-300">
                            <div className="pt-2">
                                <input
                                    type="radio"
                                    name="correct_option"
                                    checked={option.is_correct}
                                    onChange={() => handleOptionChange(index, "is_correct", true)}
                                    className="w-4 h-4 text-primary focus:ring-primary bg-slate-700 border-slate-600"
                                />
                            </div>
                            <div className="flex-1">
                                <Input
                                    placeholder={`選択肢 ${index + 1}`}
                                    value={option.content}
                                    onChange={(e) => handleOptionChange(index, "content", e.target.value)}
                                    required
                                />
                            </div>
                            <Button
                                type="button"
                                variant="ghost"
                                size="sm"
                                onClick={() => removeOption(index)}
                                className="text-slate-400 hover:text-red-400"
                                disabled={formData.options.length <= 2}
                            >
                                <Trash className="w-4 h-4" />
                            </Button>
                        </div>
                    ))}
                </div>
                <p className="text-xs text-slate-400">※ ラジオボタンで正解を選択してください</p>
            </div>

            <div className="space-y-2">
                <Label htmlFor="explanation">解説 (任意)</Label>
                <textarea
                    id="explanation"
                    className="min-h-[100px] w-full rounded-md border border-slate-700 bg-slate-800/50 px-3 py-2 text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                    value={formData.explanation || ""}
                    onChange={(e) => setFormData({ ...formData, explanation: e.target.value })}
                    placeholder="問題の解説を入力してください..."
                />
            </div>

            {validationError && (
                <p className="text-sm text-red-400 bg-red-900/20 border border-red-700/30 rounded-md px-3 py-2">
                    {validationError}
                </p>
            )}

            <div className="flex justify-end gap-4">
                <Button type="button" variant="ghost" onClick={() => router.back()}>
                    キャンセル
                </Button>
                <Button type="submit" variant="premium" disabled={loading} className="gap-2">
                    {loading ? "保存中..." : (
                        <>
                            <Save className="w-4 h-4" /> {initialData ? "更新する" : "保存する"}
                        </>
                    )}
                </Button>
            </div>
        </form>
    );
}
