DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('酸塩基平衡に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 21)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '過換気症候群では、呼吸性アシドーシスになる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COPD では、呼吸性アルカローシスになる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大量の嘔吐では、代謝性アシドーシスになる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '原発性アルドステロン症では、代謝性アシドーシスになる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腎不全では、代謝性アシドーシスになる。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('加齢・疾患に伴う変化に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 22)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'テロメアは、細胞分裂を繰り返すと長くなる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肉芽組織は、線維芽細胞に富んでいる。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '良性腫瘍は、悪性腫瘍に比べて細胞の分化度が低い。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '上皮性の悪性腫瘍は、肉腫と呼ばれる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳死では、自発呼吸がみられる。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('臨床検査に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 23)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '動脈血ガス分析検査では、pH が測定される。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビリルビンは、血清たんぱく質である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心電図の QRS 波は、心房の興奮を反映している。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スパイロメトリは、経皮的酸素飽和度を調べる検査である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'CT（コンピューター断層撮影）は、磁気を利用する検査である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('治療に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 24)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発熱の患者に対する解熱鎮痛薬の投与は、原因療法である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細菌性肺炎に対する抗菌薬の投与は、対症療法である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リハビリテーションは、根治療法である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '輸血療法は、血液浄化療法である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'iPS 細胞（人工多能性幹細胞）の使用は、再生医療である。 9', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('脂質代謝に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 25)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリンは、リポたんぱく質リパーゼ活性を低下させる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リポたんぱく質リパーゼの異常では、高キロミクロン血症をきたす。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '家族性高コレステロール血症は、グルコース ─ 6 ─ ホスファターゼの欠損に よって起こる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ネフローゼ症候群の診断基準では、脂質異常症が必須条件である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '著明な高コレステロール血症では、急性膵炎を起こす。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('消化器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 26)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '嚥下時には、軟口蓋が気管を塞ぐ。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '内因子は、主細胞から分泌される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胆汁は、総胆管を経て胆嚢に運ばれる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'オッディ（Oddi）括約筋が弛緩すると、胆汁が十二指腸に排出される。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大腸粘膜には、輪状ヒダがある。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('肝疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 27)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 型肝炎は、血液感染が最も多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'B 型肝炎ウイルスは、RNA ウイルスである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝硬変では、プロトロンビン時間が短縮する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝硬変では、血中コリンエステラーゼ値が上昇する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'NASH では、肝の線維化がみられる。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('循環器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 28)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心臓血管中枢は、中脳にある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺動脈は、肺と左心房をつなぐ。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心室の収縮期では、僧帽弁は閉鎖する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '動脈は、内膜と外膜の2層からなる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副交感神経の興奮により、心拍数は増加する。 10', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('循環器疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 29)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心室細動では、心拍出量が増加する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '深部静脈血栓症では、急性肺塞栓を起こす。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '右心不全では、肺うっ血がみられる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心不全では、血中 BNP（脳性ナトリウム利尿ペプチド）値が低下する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '重度の貧血では、低心拍出性心不全がみられる。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('腎・尿路系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 30)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '1個の腎臓には、約1万個のネフロンがある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘンレ係蹄は、遠位尿細管と集合管との間に存在する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '近位尿細管では、グルコースが再吸収される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健常成人の1日当たりの糸球体濾過量は、約 1. 5 L である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健常成人の尿比重は、1. 100 以上に調節されている。', false, 5);
END $$;



