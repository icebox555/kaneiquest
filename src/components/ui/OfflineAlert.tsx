import { CloudOff } from "lucide-react";

interface OfflineAlertProps {
    onRetry?: () => void;
}

export function OfflineAlert({ onRetry }: OfflineAlertProps) {
    return (
        <div className="flex min-h-[300px] w-full items-center justify-center bg-gray-50 p-4">
            <div className="w-full max-w-sm rounded-lg bg-white p-8 text-center shadow-lg">
                <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-purple-100">
                    <CloudOff className="h-8 w-8 text-purple-600" />
                </div>

                <h2 className="mb-2 text-xl font-bold text-gray-900">
                    You're Offline
                </h2>

                <p className="mb-8 text-sm text-gray-500">
                    It looks like you've lost your internet connection. Please check your connection and try again.
                </p>

                <button
                    onClick={onRetry}
                    className="w-full rounded-md bg-blue-500 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                >
                    Try Again
                </button>
            </div>
        </div>
    );
}
