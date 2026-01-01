DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('地球温暖化に伴い、流行地域の拡大が懸念されている感染症として、最も適当な のはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 11)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '麻疹', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '風疹', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポリオ（急性灰白髄炎）', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マラリア', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'B 型肝炎 5', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('難病の患者に対する医療等に関する法律（難病法）における、難病の定義に関する 記述である。誤っているのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 12)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発病の機構が明らかでない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '治療方法が確立していない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '希少な疾病である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '致命率が高い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '長期にわたり療養を必要とする。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('わが国の社会保障制度を構成するもののうち、生活保護が該当するものとして、 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 13)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '社会保険', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '恩給', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '公的扶助', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保健医療・公衆衛生', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '社会福祉', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('市町村保健センターに関する記述である。最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 14)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '市町村は、設置しなければならない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'センター長は、原則として医師でなければならない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品衛生の監視を行う。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '住民の健康相談を担う。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域における健康危機管理の拠点となる。 6', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定健康診査・特定保健指導に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 15)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '根拠法は、健康増進法である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '75 歳以上の被保険者は、対象とならない。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保険者は、降圧薬を服薬中の者を、特定保健指導の対象としなければならな い。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '採血は、空腹時に限定されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹囲が 90 cm で喫煙習慣がある 50 歳男性の場合、1つの追加リスクがある と動機付け支援の対象となる。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('高齢者の介護に関する記述である。最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 16)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '直近の国民生活基礎調査（大規模調査年）によると、要介護者となった原因と して最も多いのは、年齢にかかわらず脳卒中である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護保険制度における保険給付の財源は、全額が被保険者から徴収した保険 料である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護保険制度における予防給付サービスは、要介護者が対象である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護老人保健施設では、医学的管理は行われない。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域包括支援センターの業務には、権利擁護に関する業務が含まれている。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('人体を構成する細胞に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 17)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血小板には、核が存在する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞外のナトリウムイオン濃度は、細胞内より低い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全ての細胞は、1つの受精卵から発生する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞周期の S 期では、染色体が形成される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マクロファージは、リンパ球から分化する。 7', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('アミノ酸・たんぱく質・糖質に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 18)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アミノ酸は、両性化合物である。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の二次構造は、ジスルフィド結合により形成される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、プロテアソームにより折りたたまれる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フルクトースは、アルデヒド基をもつ。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'でんぷんは、β ─ 1,4 グリコシド結合をもつ。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('生体エネルギー源と代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 19)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'AMP は、分子内に高エネルギー結合をもつ。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ホスホエノールピルビン酸は、高エネルギー化合物である。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電子伝達系は、ミトコンドリアの外膜にある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電子伝達系の電子受容体は、窒素分子である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脱共役たんぱく質（UCP）による熱産生は、ATP の合成を伴う。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('アミノ酸・糖質・脂質の代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 20)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 は、アミノ基転移反応の補酵素である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿素回路は、腎臓に存在する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セロトニンは、トリプトファンから合成される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖新生は、小胞体で行われる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪酸の合成は、ミトコンドリアで行われる。 8', false, 5);
END $$;



