DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('55 歳、男性。会社員。運動習慣なし。電車通勤片道1時間。健康診断で高尿 酸血症を指摘され医療機関を受診した。医師より薬物治療を勧められたが、本人 の希望で服薬せずに食事療法を開始することになり、栄養食事指導を行った。身長 170 cm、体重 65 kg、BMI 22. 5 kg/m 2 。空腹時の血液検査値は、血糖 95 mg/dL、 HbA1c 5. 3％、尿酸 8. 2 mg/dL、LDL コレステロール 125 mg/dL、HDL コレス テロール 65 mg/dL、トリグリセリド 115 mg/dL。表は、患者から聞き取った普 段の食事内容である。優先すべき栄養食事指導の内容として、最も適切なのはどれ か。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 121)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主菜（魚、肉、卵、大豆）の量を少なくする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '卵は1日に1個までにする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜料理を追加する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '禁酒を勧める。 表 普段の食事内容 朝食昼食（弁当）夕食 ご飯（150 g）ご飯（200 g）ご飯（150 g） 納豆（40 g）卵焼き（3切れ）刺身（100 g） 鶏卵（1個）鶏唐揚げ（60 g）冷奴（200 g） 味噌汁（1杯）ウインナー（40 g）肉野菜炒め（1皿） 温野菜（80 g）焼酎（25 度）（360 mL） マヨネーズ（10 g） 10', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('膵炎の栄養管理に関する記述である。最も適当なのはどれか。1つ選べ。 20 kcal/kg 標準体重に制限する。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 122)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性膵炎で激しい上腹部痛がある場合、成分栄養剤を用いて経腸栄養を行 う。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性膵炎患者の食事開始時は、脂質 10 g/日以下とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期では、たんぱく質を 0. 8 g/kg 標準体重/日に制限する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期では、脂溶性ビタミンの摂取を制限する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期で二次性糖尿病がみられる場合、エネルギー量は', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('消化器疾患と摂取を制限すべき栄養素等の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 123)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '逆流性食道炎 炭水化物', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胆石症 カルシウム', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質漏出性胃腸症 たんぱく質', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '潰瘍性大腸炎寛解期 水分', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クローン病活動期 脂 肪 11', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('57歳、男性。高校教諭。狭心症の外来患者。身長176cm、体重70kg、 BMI 22. 6 kg/m 2 。血圧145/85mmHg。空腹時の血液検査値は、LDLコレステ ロール 150 mg/dL、HDL コレステロール 52 mg/dL、トリグリセリド 136 mg/dL。 この患者の1日当たりの目標栄養量を、コレステロール200mg/日未満、食塩 6. 0 g/日未満とした。これと併せて設定した、他の目標栄養量の組合せとして、最 も適当なのはどれか。1つ選べ。 エネルギー （kcal/日） 脂肪 （g/日） 飽和脂肪酸 （g/日未満） (1) 1,6004015 (2) 1,600 5520 (3) 2,000 4515 (4) 2,000 4520 (5) 2,000 6020', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 124)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('75 歳、女性。心不全。軽度の身体活動で呼吸苦があり、状態が悪化して入院と なった。浮腫も認められ、利尿薬の投与が開始された。身長 150 cm、体重 45 kg、 BMI 20. 0 kg/m 2 。空腹時の血液検査値は、ナトリウム135mEq/L、カリウム 4. 0 mEq/L、クレアチニン 0. 6 mg/dL。かろうじて経口摂取ができている。この 患者の1日当たりの目標栄養量として、最も適切なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 125)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギーは、1,600 kcal とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、60 g とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩は、3g とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分は、2,000 mL とする。 12', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('45 歳、女性。会社員。CKD。身長 153 cm、体重 50 kg、BMI 21. 4 kg/m 2 。血 圧 145/92 mmHg。食塩摂取量を推定するために 24 時間蓄尿を行ったところ、尿 量 1. 0 L、尿中ナトリウム濃度 255 mEq/L であった。この患者の尿中食塩排泄量 （g/日）として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 126)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '5', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '8', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '10', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '12', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '15', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('62 歳、男性。無職。糖尿病腎症。身長 165 cm、体重 63 kg、目標体重 60 kg。血 圧 148/92 mmHg。空腹時の血液検査値は、血糖 151 mg/dL、HbA1c 8. 4％、尿 素窒素 38 mg/dL、クレアチニン 1. 3 mg/dL、eGFR 45 mL/分/1. 73 m 2 、カリウ ム 5. 7 mEq/L。尿アルブミン /クレアチニン比 350 mg/gCr。この患者の1日当た りの目標栄養量として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 127)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギーは、2,200 kcal とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、30 g とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪は、20 g とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩は、7. 5 g とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウムは、1,800 mg とする。 13', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('腎疾患の病態および栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 128)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '一次性ネフローゼ症候群では、LDL コレステロール値が低下する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性腎障害（AKI）では、血清クレアチニン値が低下する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '微小変化型ネフローゼ症候群では、たんぱく質摂取量を 0. 8 g/kg 標準体重/ 日とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性糸球体腎炎の乏尿期では、食塩を5g/日とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹膜透析では、食事のエネルギー量は、目標エネルギー量から、腹膜吸収ブ ドウ糖のエネルギー分を差し引いて求める。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ステロイド薬を服用している患者に対して栄養食事指導を行うことになった。こ の患者に認められる所見である。誤っているのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 129)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '免疫力の低下', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲の亢進', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高カリウム血症', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '耐糖能異常', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('神経疾患の病態、診断および栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 130)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食行動異常は、認知症の中核症状である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '認知症のスクリーニングには、DESIGN-R®が用いられる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'パーキンソン病では、嚥下障害がみられる。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'パーキンソン病では、エネルギー目標量を安静時エネルギー消費量の2倍と する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レボドパ（L-ドーパ）は、薬の効果を高めるために、高たんぱく質食と一緒 に内服する。 14', false, 5);
END $$;



