"use client";

import {
    LineChart,
    Line,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer
} from "recharts";

interface ScoreHistoryChartProps {
    data: {
        date: string;
        score: number;
    }[];
}

export function ScoreHistoryChart({ data }: ScoreHistoryChartProps) {
    if (!data || data.length === 0) {
        return (
            <div className="h-[300px] flex items-center justify-center text-slate-500">
                No data available
            </div>
        );
    }

    const CustomTooltip = ({ active, payload, label }: any) => {
        if (active && payload && payload.length) {
            return (
                <div className="bg-slate-900/90 border border-slate-700 p-3 rounded-xl shadow-xl backdrop-blur-md">
                    <p className="text-slate-300 text-sm mb-1">{label}</p>
                    <p className="text-primary font-bold">
                        Score: {payload[0].value}%
                    </p>
                </div>
            );
        }
        return null;
    };

    return (
        <div className="w-full h-[300px]">
            <ResponsiveContainer width="100%" height="100%">
                <LineChart
                    data={data}
                    margin={{ top: 10, right: 10, left: -20, bottom: 0 }}
                >
                    <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.1)" vertical={false} />
                    <XAxis
                        dataKey="date"
                        stroke="#94a3b8"
                        fontSize={12}
                        tickLine={false}
                        axisLine={false}
                        tick={{ fill: '#94a3b8' }}
                        dy={10}
                    />
                    <YAxis
                        stroke="#94a3b8"
                        fontSize={12}
                        tickLine={false}
                        axisLine={false}
                        tick={{ fill: '#94a3b8' }}
                        domain={[0, 100]}
                        ticks={[0, 25, 50, 75, 100]}
                    />
                    <Tooltip content={<CustomTooltip />} />
                    <Line
                        type="monotone"
                        dataKey="score"
                        stroke="#f59e0b" // amber-500
                        strokeWidth={3}
                        dot={{ fill: '#f59e0b', strokeWidth: 2, r: 4, stroke: '#1e293b' }}
                        activeDot={{ r: 6, strokeWidth: 0 }}
                    />
                </LineChart>
            </ResponsiveContainer>
        </div>
    );
}
