"use client";

import {
    Radar,
    RadarChart,
    PolarGrid,
    PolarAngleAxis,
    PolarRadiusAxis,
    ResponsiveContainer,
    Tooltip
} from "recharts";

interface CategoryRadarChartProps {
    data: {
        subject: string;
        A: number; // Score
        fullMark: number;
    }[];
}

export function CategoryRadarChart({ data }: CategoryRadarChartProps) {
    if (!data || data.length === 0) {
        return (
            <div className="h-[300px] flex items-center justify-center text-slate-500">
                Not enough data
            </div>
        );
    }

    // Wrap subject text if too long
    const renderPolarAngleAxis = ({ payload, x, y, cx, cy, ...rest }: any) => {
        return (
            <text
                {...rest}
                x={x}
                y={y}
                cx={cx}
                cy={cy}
                textAnchor="middle"
                fill="#94a3b8"
                fontSize={10}
            >
                {payload.value.split('・').map((line: string, i: number) => (
                    <tspan x={x} dy={i * 12} key={i}>
                        {line}
                    </tspan>
                ))}
            </text>
        );
    };

    return (
        <div className="w-full h-[300px]">
            <ResponsiveContainer width="100%" height="100%">
                <RadarChart cx="50%" cy="50%" outerRadius="70%" data={data}>
                    <PolarGrid stroke="rgba(255,255,255,0.1)" />
                    <PolarAngleAxis
                        dataKey="subject"
                        tick={{ fill: '#94a3b8', fontSize: 11 }}
                    />
                    <PolarRadiusAxis
                        angle={30}
                        domain={[0, 100]}
                        tick={false}
                        axisLine={false}
                    />
                    <Radar
                        name="Performance"
                        dataKey="A"
                        stroke="#f59e0b"
                        strokeWidth={2}
                        fill="#f59e0b"
                        fillOpacity={0.4}
                    />
                    <Tooltip
                        content={({ active, payload }) => {
                            if (active && payload && payload.length) {
                                return (
                                    <div className="bg-slate-900/90 border border-slate-700 p-2 rounded-lg shadow-xl backdrop-blur-md">
                                        <p className="text-primary font-bold text-sm">
                                            {payload[0].value}%
                                        </p>
                                    </div>
                                );
                            }
                            return null;
                        }}
                    />
                </RadarChart>
            </ResponsiveContainer>
        </div>
    );
}
