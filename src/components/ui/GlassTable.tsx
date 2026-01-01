interface Column<T> {
    header: string;
    accessor: keyof T | ((item: T) => React.ReactNode);
    className?: string;
}

interface GlassTableProps<T> {
    data: T[];
    columns: Column<T>[];
    keyField: keyof T;
    isLoading?: boolean;
}

export function GlassTable<T extends Record<string, any>>({ data, columns, keyField, isLoading }: GlassTableProps<T>) {
    if (isLoading) {
        return (
            <div className="glass rounded-xl p-8 flex justify-center items-center">
                <div className="w-8 h-8 border-4 border-primary/30 border-t-primary rounded-full animate-spin" />
            </div>
        );
    }

    if (data.length === 0) {
        return (
            <div className="glass rounded-xl p-8 text-center text-slate-400">
                データがありません
            </div>
        );
    }

    return (
        <div className="glass rounded-xl overflow-hidden">
            <div className="overflow-x-auto">
                <table className="w-full text-sm text-left text-slate-400">
                    <thead className="text-xs text-slate-300 uppercase bg-white/5">
                        <tr>
                            {columns.map((col, index) => (
                                <th key={index} className={`px-6 py-4 ${col.className || ""}`}>
                                    {col.header}
                                </th>
                            ))}
                        </tr>
                    </thead>
                    <tbody>
                        {data.map((item, rowIndex) => (
                            <tr
                                key={String(item[keyField])}
                                className="border-b border-white/5 hover:bg-white/5 transition-colors last:border-0"
                            >
                                {columns.map((col, colIndex) => (
                                    <td key={colIndex} className={`px-6 py-4 ${col.className || ""}`}>
                                        {typeof col.accessor === "function"
                                            ? col.accessor(item)
                                            : item[col.accessor]}
                                    </td>
                                ))}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
