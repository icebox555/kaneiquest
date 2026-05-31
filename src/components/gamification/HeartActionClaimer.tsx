"use client";

import { useEffect } from "react";
import { earnHeart, processReferral } from "@/lib/actions/heart";

// Runs once on dashboard mount:
// 1. Claims daily login heart
// 2. Processes referral if a ref code is stored in localStorage
export function HeartActionClaimer() {
    useEffect(() => {
        // Daily login bonus
        earnHeart('daily_login').catch(() => {});

        // Referral bonus: check if a referral code was stored at signup
        const refId = localStorage.getItem('kanei_ref');
        if (refId) {
            processReferral(refId)
                .then(() => localStorage.removeItem('kanei_ref'))
                .catch(() => {});
        }
    }, []);

    return null;
}
