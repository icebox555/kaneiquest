"use client";

import { X } from "lucide-react";
import { useEffect, useState } from "react";
import { createPortal } from "react-dom";

interface ModalProps {
    isOpen: boolean;
    onClose: () => void;
    title: string;
    children: React.ReactNode;
}

export function Modal({ isOpen, onClose, title, children }: ModalProps) {
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        setMounted(true);
        if (isOpen) {
            document.body.style.overflow = "hidden";
        } else {
            document.body.style.overflow = "unset";
        }
        return () => {
            document.body.style.overflow = "unset";
        };
    }, [isOpen]);

    if (!mounted || !isOpen) return null;

    return createPortal(
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6 bg-black/60 backdrop-blur-sm animate-in fade-in duration-200">
            <div
                className="relative w-full max-w-lg transform rounded-2xl bg-[#0F172A]/90 border border-white/10 p-6 shadow-2xl transition-all animate-in zoom-in-95 duration-200 slide-in-from-bottom-4"
                onClick={(e) => e.stopPropagation()}
            >
                <div className="flex items-center justify-between mb-6">
                    <h3 className="text-xl font-bold text-white leading-6">
                        {title}
                    </h3>
                    <button
                        onClick={onClose}
                        className="rounded-full p-1 text-slate-400 hover:bg-white/10 hover:text-white transition-colors"
                    >
                        <X className="w-5 h-5" />
                    </button>
                </div>

                <div className="mt-2">
                    {children}
                </div>
            </div>
        </div>,
        document.body
    );
}
