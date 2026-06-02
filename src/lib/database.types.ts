export type Json =
    | string
    | number
    | boolean
    | null
    | { [key: string]: Json | undefined }
    | Json[]

export type Database = {
    // Allows to automatically instantiate createClient with right options
    // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
    __InternalSupabase: {
        PostgrestVersion: "14.1"
    }
    public: {
        Tables: {
            app_settings: {
                Row: {
                    description: string | null
                    key: string
                    updated_at: string | null
                    updated_by: string | null
                    value: Json
                }
                Insert: {
                    description?: string | null
                    key: string
                    updated_at?: string | null
                    updated_by?: string | null
                    value: Json
                }
                Update: {
                    description?: string | null
                    key?: string
                    updated_at?: string | null
                    updated_by?: string | null
                    value?: Json
                }
                Relationships: [
                    {
                        foreignKeyName: "app_settings_updated_by_fkey"
                        columns: ["updated_by"]
                        isOneToOne: false
                        referencedRelation: "profiles"
                        referencedColumns: ["id"]
                    },
                ]
            }
            categories: {
                Row: {
                    created_at: string
                    description: string | null
                    id: string
                    image_url: string | null
                    name: string
                    order: number | null
                    slug: string | null
                }
                Insert: {
                    created_at?: string
                    description?: string | null
                    id?: string
                    image_url?: string | null
                    name: string
                    order?: number | null
                    slug?: string | null
                }
                Update: {
                    created_at?: string
                    description?: string | null
                    id?: string
                    image_url?: string | null
                    name?: string
                    order?: number | null
                    slug?: string | null
                }
                Relationships: []
            }
            exam_attempts: {
                Row: {
                    category_id: string | null
                    completed_at: string | null
                    id: string
                    is_completed: boolean | null
                    score: number | null
                    exam_year: number | null
                    started_at: string
                    total_questions: number | null
                    user_id: string
                }
                Insert: {
                    category_id?: string | null
                    completed_at?: string | null
                    id?: string
                    is_completed?: boolean | null
                    score?: number | null
                    exam_year?: number | null
                    started_at?: string
                    total_questions?: number | null
                    user_id: string
                }
                Update: {
                    category_id?: string | null
                    completed_at?: string | null
                    id?: string
                    is_completed?: boolean | null
                    score?: number | null
                    exam_year?: number | null
                    started_at?: string
                    total_questions?: number | null
                    user_id?: string
                }
                Relationships: [
                    {
                        foreignKeyName: "exam_attempts_category_id_fkey"
                        columns: ["category_id"]
                        isOneToOne: false
                        referencedRelation: "categories"
                        referencedColumns: ["id"]
                    },
                ]
            }
            options: {
                Row: {
                    content: string
                    id: string
                    is_correct: boolean | null
                    order: number | null
                    question_id: string
                }
                Insert: {
                    content: string
                    id?: string
                    is_correct?: boolean | null
                    order?: number | null
                    question_id: string
                }
                Update: {
                    content?: string
                    id?: string
                    is_correct?: boolean | null
                    order?: number | null
                    question_id?: string
                }
                Relationships: [
                    {
                        foreignKeyName: "options_question_id_fkey"
                        columns: ["question_id"]
                        isOneToOne: false
                        referencedRelation: "questions"
                        referencedColumns: ["id"]
                    },
                ]
            }
            profiles: {
                Row: {
                    email: string | null
                    full_name: string | null
                    id: string
                    level: number | null
                    plan: string | null
                    role: string | null
                    updated_at: string | null
                    xp: number | null
                }
                Insert: {
                    email?: string | null
                    full_name?: string | null
                    id: string
                    level?: number | null
                    plan?: string | null
                    role?: string | null
                    updated_at?: string | null
                    xp?: number | null
                }
                Update: {
                    email?: string | null
                    full_name?: string | null
                    id?: string
                    level?: number | null
                    plan?: string | null
                    role?: string | null
                    updated_at?: string | null
                    xp?: number | null
                }
                Relationships: []
            }
            questions: {
                Row: {
                    category_id: string
                    content: string
                    created_at: string
                    difficulty: number | null
                    exam_year: number | null
                    explanation: string | null
                    id: string
                    image_url: string | null
                    question_number: number | null
                    question_type: string | null
                    updated_at: string
                }
                Insert: {
                    category_id: string
                    content: string
                    created_at?: string
                    difficulty?: number | null
                    exam_year?: number | null
                    explanation?: string | null
                    id?: string
                    image_url?: string | null
                    question_number?: number | null
                    question_type?: string | null
                    updated_at?: string
                }
                Update: {
                    category_id?: string
                    content?: string
                    created_at?: string
                    difficulty?: number | null
                    exam_year?: number | null
                    explanation?: string | null
                    id?: string
                    image_url?: string | null
                    question_number?: number | null
                    question_type?: string | null
                    updated_at?: string
                }
                Relationships: [
                    {
                        foreignKeyName: "questions_category_id_fkey"
                        columns: ["category_id"]
                        isOneToOne: false
                        referencedRelation: "categories"
                        referencedColumns: ["id"]
                    },
                ]
            }
            user_answers: {
                Row: {
                    attempt_id: string
                    created_at: string
                    id: string
                    is_correct: boolean | null
                    question_id: string
                    selected_option_id: string | null
                }
                Insert: {
                    attempt_id: string
                    created_at?: string
                    id?: string
                    is_correct?: boolean | null
                    question_id: string
                    selected_option_id?: string | null
                }
                Update: {
                    attempt_id?: string
                    created_at?: string
                    id?: string
                    is_correct?: boolean | null
                    question_id?: string
                    selected_option_id?: string | null
                }
                Relationships: [
                    {
                        foreignKeyName: "user_answers_attempt_id_fkey"
                        columns: ["attempt_id"]
                        isOneToOne: false
                        referencedRelation: "exam_attempts"
                        referencedColumns: ["id"]
                    },
                    {
                        foreignKeyName: "user_answers_options_id_fkey"
                        columns: ["selected_option_id"]
                        isOneToOne: false
                        referencedRelation: "options"
                        referencedColumns: ["id"]
                    },
                    {
                        foreignKeyName: "user_answers_question_id_fkey"
                        columns: ["question_id"]
                        isOneToOne: false
                        referencedRelation: "questions"
                        referencedColumns: ["id"]
                    },
                ]
            }
        }
        Views: {
            [_ in never]: never
        }
        Functions: {
            [_ in never]: never
        }
        Enums: {
            [_ in never]: never
        }
        CompositeTypes: {
            [_ in never]: never
        }
    }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

type SchemaName = Exclude<keyof Database, "__InternalSupabase">

export type Tables<
    PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: SchemaName },
    TableName extends PublicTableNameOrOptions extends { schema: SchemaName }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: SchemaName }
    ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
            Row: infer R
        }
    ? R
    : never
    : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
            Row: infer R
        }
    ? R
    : never
    : never

export type TablesInsert<
    PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: SchemaName },
    TableName extends PublicTableNameOrOptions extends { schema: SchemaName }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: SchemaName }
    ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
        Insert: infer I
    }
    ? I
    : never
    : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
    }
    ? I
    : never
    : never

export type TablesUpdate<
    PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: SchemaName },
    TableName extends PublicTableNameOrOptions extends { schema: SchemaName }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: SchemaName }
    ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
        Update: infer U
    }
    ? U
    : never
    : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
    }
    ? U
    : never
    : never

export type Enums<
    PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: SchemaName },
    EnumName extends PublicEnumNameOrOptions extends { schema: SchemaName }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: SchemaName }
    ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
    : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never

export type CompositeTypes<
    PublicCompositeTypeNameOrOptions extends
    | keyof PublicSchema["CompositeTypes"]
    | { schema: SchemaName },
    CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
        schema: SchemaName
    }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: SchemaName }
    ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
    : PublicCompositeTypeNameOrOptions extends keyof PublicSchema["CompositeTypes"]
    ? PublicSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never
