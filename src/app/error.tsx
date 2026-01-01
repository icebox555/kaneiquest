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

    return (
        <div className="flex min-h-screen flex-col items-center justify-center p-4 text-center">
            <h2 className="text-2xl font-bold mb-4">エラーが発生しました</h2>
            <p className="mb-4 text-red-500 bg-red-50 p-4 rounded text-left w-full max-w-lg overflow-auto">
                {error.message || "Something went wrong!"}
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
