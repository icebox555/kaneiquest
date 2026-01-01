DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('A 群β溶血性連鎖球菌感染を契機とする急性糸球体腎炎に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 31)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高齢者に多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '感染後1～３日で発症する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧を引き起こす。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血清中の補体価は上昇する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '半数以上は慢性化する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('甲状腺・副甲状腺の疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 32)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バセドウ病では、血中 LDL コレステロール値が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バセドウ病では、血中甲状腺刺激ホルモン（TSH）値が上昇する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '橋本病では、基礎代謝が亢進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副甲状腺機能亢進症では、腎臓におけるカルシウム再吸収が抑制される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副甲状腺機能低下症では、テタニーが起こる。 11', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('パーキンソン病に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 33)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主な責任病巣は側頭葉である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳内のドーパミンが増加している。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'まだら認知症がみられる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '四肢の筋肉は弛緩する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '便秘をきたす。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('呼吸器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 34)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '呼吸中枢は、大脳皮質に存在する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '気管支平滑筋は、副交感神経の興奮で弛緩する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '横隔膜は、吸気時に収縮する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '内呼吸は、肺胞で行われるガス交換である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺活量は、1回換気量と残気量の和である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('呼吸器疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 35)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COPD に対する治療には、在宅酸素療法がある。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '気管支喘息では、発作時に気道が拡張する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺結核に対する予防接種には、ツベルクリン反応がある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マイコプラズマ肺炎は、ウイルス性肺炎である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クリプトコッカス肺炎は、細菌性肺炎である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('平滑筋に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 36)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞は円柱形である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '横紋が観察される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介在板が観察される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨に付着する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不随意筋である。 12', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('骨粗鬆症に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 37)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性に多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '類骨が増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脆弱性骨折がない時の診断基準は、骨密度が若年成人平均値（YAM）の 60％ 未満である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小児に発症した骨粗鬆症をくる病という。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖質コルチコイド過剰により発症する。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('妊娠糖尿病に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 38)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '50 g 経口ブドウ糖負荷試験で診断する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '空腹時血糖値 150 mg/dL で HbA1c 6. 5％ の場合、妊娠糖尿病と診断でき る。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '妊娠 20 週以降には、耐糖能は改善する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '将来の2型糖尿病発症リスクである。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '経口血糖降下薬を使用する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 39)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヒトのヘモグロビンは、2本のグロビンからなる二量体である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘモグロビンと酸素の親和性は、ヘモグロビンと一酸化炭素の親和性よりも 高い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '還元ヘモグロビン濃度が上昇すると、チアノーゼが出現する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エリスロポエチンは、白血球の成熟を促す。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'プラスミンは、凝固因子である。 13', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 40)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄欠乏性貧血では、血清フェリチン値が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '再生不良性貧血では、骨髄の過形成がみられる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '溶血性貧血では、血中の網赤血球が減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血友病 A は、第IX因子の異常である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特発性血小板減少性紫斑病（ITP）では、抗血小板抗体が認められる。', true, 5);
END $$;



