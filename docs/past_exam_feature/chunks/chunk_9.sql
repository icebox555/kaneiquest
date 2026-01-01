DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('35 歳、女性。身長 158 cm、体重 50 kg、BMI 20. 0 kg/m 2 。基礎代謝基準値 22. 0 kcal/kg 体重/日、安静時代謝量は基礎代謝量の 1. 1 倍。5. 0 メッツの活動を 2時間行った。その2時間の総エネルギー消費量（kcal）として、最も適当なのはど れか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 81)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '242', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '417', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '458', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '504', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '726', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養アセスメントに関する記述である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 82)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '上腕筋面積は、肩甲骨下部皮下脂肪厚と上腕周囲長から求める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体脂肪率は、水中体重秤量法により推定できる。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ウエスト周囲長は、息を吸った状態で測定する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿中クレアチニン排泄量は、測定前に摂取した食事たんぱく質の影響を受け る。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生体電気インピーダンス（BIA）法は、測定前に摂取した食事の影響を受けな い。 27', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）における基本的事項に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 83)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'DG の設定で対象とした生活習慣病の1つに、COPD がある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'DG には、エビデンスレベルが付されている。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '単糖は、AI が設定されている。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '参照体位は、性・年齢区分別の望ましい体位である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '習慣的な摂取を把握するための期間は、３日間程度とされている。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）におけるエネルギーに関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 84)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成人の身体活動レベルの算出には、二重標識水法による総エネルギー消費量 測定値が用いられた。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小児におけるエネルギー摂取量の過不足の評価は、BMI で行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '目標とする BMI の範囲は、40 歳と 75 歳で同じである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成人の推定エネルギー必要量（EER）の算定式は、安静時代謝量（kcal/日）× 身体活動レベルである。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '推定エネルギー必要量（EER）は、高齢者施設の自立した入所者には適用で きない。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）におけるビタミン・ミネラルに関する記述で ある。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 85)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン A の UL は、成人と乳児とで回避対象としている健康障害が異な る。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン E の AI は、血中のγ ─ トコフェロール濃度から算定された。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 の EAR は、たんぱく質1g 当たりの必要量から算定された。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナトリウムの DG は、24 時間尿中ナトリウム排泄量から算定された。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄の妊娠後期のEAR付加量は、妊娠初期と同じ鉄吸収率を基に算定された。 28', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）において、生活習慣病の重症化予防を目的と した量を設定した栄養素である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 86)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '飽和脂肪酸', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トランス脂肪酸', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナトリウム', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウム', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('妊娠期の母体の生理的変化に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 87)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '循環血液量は、減少する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '基礎代謝は、低下する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の同化は、抑制される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血清総コレステロール値は、低下する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリン感受性は、低下する。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020年版）における授乳婦の推定エネルギー必要量 （kcal/日）の求め方である。妊娠前の推定エネルギー必要量（kcal/日）を A 、母乳 のエネルギー量（kcal/日）を B 、体重減少分のエネルギー量（kcal/日）を C とした 算出式として、最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 88)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋C', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B＋C', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B－C 29', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('新生児期・乳児期の生理的特徴に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 89)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳児の体重に対する細胞外液量の割合は、成人と比べて低い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生理的体重減少は、生後1か月頃に出現する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '唾液中のアミラーゼ活性は、離乳食の開始により低下する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '吸啜反応は、頬や口唇に触れた刺激に対して、その方向に顔を向け口を開く 反射である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '新生児の最大尿濃縮能は、成人と比べて低い。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('新生児期・乳児期の栄養ケア・マネジメントに関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 90)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '母乳性黄疸では、母乳を中止しなければならない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄欠乏性貧血は、乳児期の後期（離乳期）に起こりやすい。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳糖不耐症のある乳児には、母乳を与える。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'はちみつは、生後9か月から与えても良い。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物アレルギーの発症予防のためには、離乳期における特定の食物の摂取開 始を遅らせる。', false, 5);
END $$;



