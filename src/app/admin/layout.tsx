import { AdminSidebar } from "@/components/admin/AdminSidebar";

export default function AdminLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <div className="min-h-screen bg-slate-950">
            <AdminSidebar />
            <div className="lg:ml-64 min-h-screen">
                {children}
            </div>
        </div>
    );
}
