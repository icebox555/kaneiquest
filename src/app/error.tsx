"use client";

import { useEffect } from "react";

export default function Error({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        console.error(error);
    }, [error]);

    // Show detailed messages only in development to avoid leaking internal details
    // (DB schema, API keys, stack traces) to end users in production.
    const displayMessage =
        process.env.NODE_ENV === "development"
            ? (error.message || "Something went wrong!")
            : "予期せぬエラーが発生しました。しばらく経ってから再度お試しください。";

    return (
        <div className="flex min-h-screen flex-col items-center justify-center p-4 text-center">
            <h2 className="text-2xl font-bold mb-4">エラーが発生しました</h2>
            <p className="mb-4 text-red-500 bg-red-50 p-4 rounded text-left w-full max-w-lg overflow-auto">
                {displayMessage}
            </p>
            <div className="space-x-4">
                <button
                    onClick={() => reset()}
                    className="rounded-md bg-primary px-4 py-2 text-white hover:bg-primary/90"
                >
                    もう一度試す (Try again)
                </button>
                <button
                    onClick={() => window.location.reload()}
                    className="rounded-md border border-input bg-background px-4 py-2 hover:bg-accent"
                >
                    再読み込み
                </button>
            </div>
        </div>
    );
}
