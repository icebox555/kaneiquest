import { Question, User } from "./types";

export const MOCK_USERS: User[] = [
    {
        id: "user_admin",
        email: "admin@kaneiquest.com",
        name: "管理者",
        plan: "pro", // Admins get pro features implicitly
        role: "admin"
    },
    {
        id: "user_pro",
        email: "pro@kaneiquest.com",
        name: "合格 太郎 (Pro)",
        plan: "pro",
        role: "user"
    },
    {
        id: "user_free",
        email: "free@kaneiquest.com",
        name: "見習い 花子 (Free)",
        plan: "free",
        role: "user"
    }
];

// Keep for backward compatibility if needed, but alias to pro user
export const MOCK_USER = MOCK_USERS[1];

export const MOCK_QUESTIONS: Question[] = [
    {
        id: "38-1",
        category: "社会・環境と健康",
        text: "健康増進法に基づき、厚生労働大臣が定めることとされているものである。正しいのはどれか。1つ選べ。",
        options: [
            "健康増進事業実施要綱",
            "食事摂取基準",
            "国民健康・栄養調査の実施計画",
            "特定給食施設における栄養管理基準",
            "健康日本21（第二次）の目標"
        ],
        correctAnswerIndex: 1,
        explanation: "健康増進法第30条に基づき、厚生労働大臣は「国民の健康の保持・増進を図る上で摂取することが望ましいエネルギー及び栄養素の量の基準（食事摂取基準）」を定めるものとされている。",
        year: 2024
    },
    {
        id: "35-12",
        category: "臨床栄養学",
        text: "糖尿病性腎症の第3期における食事療法に関する記述である。最も適当なのはどれか。1つ選べ。",
        options: [
            "エネルギー摂取量は、25〜30 kcal/kg 標準体重/日とする。",
            "たんぱく質摂取量は、1.0〜1.2 g/kg 標準体重/日とする。",
            "食塩摂取量は、7.5 g/日未満とする。",
            "カリウム摂取量は、制限しない。",
            "水分の摂取は、制限する。"
        ],
        correctAnswerIndex: 0,
        explanation: "第3期（顕性腎症期）では、たんぱく質制限が開始され（0.8〜1.0g/kg）、食塩は6g未満が推奨される。エネルギーは十分な量（25〜30kcal/kg）を確保する必要があるため、1番が最も適当である。",
        year: 2021
    }
];

// Simulate API delay
export const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));
