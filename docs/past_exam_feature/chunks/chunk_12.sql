DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('診療報酬における加算および指導料と、その算定の規定に関する組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 111)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '個別栄養食事管理加算 感染対策チームに管理栄養士が参画してい る。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養サポートチーム加算 栄養治療実施計画を作成する。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '入院栄養食事指導料 入院中3回まで算定できる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '集団栄養食事指導料 1回の指導時間は 20 分とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '早期栄養介入管理加算 回復期リハビリテーション病棟に入院中の 患者を対象とする。 6', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('臨床栄養における行為とそれに対応する用語の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 112)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者が治療に積極的に参加する。クリニカルパス', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養食事指導前に患者の氏名を確認す る。 守秘義務', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者の低栄養の重症度を判定する。リスクマネジメント', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養介入の内容を患者に説明し、同意 を得る。 インフォームド・コンセント', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者が医師の指示に従い治療を受け る。 ノーマリゼーション', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('骨格筋量をアセスメントするための指標である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 113)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹囲', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '下腿周囲長', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フィッシャー比', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿中ナトリウム排泄量', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '呼吸商', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('傷病者のエネルギー必要量に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 114)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ハリス - ベネディクト（Harris-Benedict）の式で算出された値は、推定エネ ルギー必要量である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ハリス - ベネディクト（Harris-Benedict）の式には、体表面積を用いる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳梗塞により意識障害をきたした患者のエネルギー必要量は、基礎代謝量の 1. 5 倍とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '安静時エネルギー消費量は、間接熱量計で測定できる。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '重症熱傷患者では、NPC/N を健常時より高くする。 7', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('静脈栄養法に関する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 115)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養では、2,500 kcal/日の投与ができる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養では、浸透圧比（血漿浸透圧との比）を5とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪は、1. 5 g/kg/時の速度で投与する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養では、糖質濃度 20％ の維持液の使用が可能である。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養は、経腸栄養に比べてバクテリアルトランスロケーションを起 こしにくい。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('77 歳、男性。身長 160 cm、体重 45 kg、BMI 17. 6 kg/m 2 。ここ1か月ほど、 ほとんど食事を摂れていなかった。3か月前の体重 55 kg。血液検査結果は、尿 素窒素 10 mg/dL、クレアチニン 0. 8 mg/dL。この患者が近医に入院し、1日当 たりエネルギー 1,500 kcal、アミノ酸 45 g、脂肪 20 g の静脈栄養が、入院初日か ら開始された。投与2日後、意識障害に陥り、K 病院に転院した。転院時の血液検 査結果として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 116)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウム値の上昇', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マグネシウム値の上昇', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 値の上昇', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リン値の低下', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリン値の低下', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品が医薬品に及ぼす影響に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 117)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳は、ビスホスホネート薬の効果を減弱する。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グレープフルーツジュースは、カルシウム拮抗薬の効果を減弱する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クロレラは、ワルファリンの効果を増強する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セント・ジョーンズ・ワートは、テオフィリンの効果を増強する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '納豆は、スタチンの効果を増強する。 8', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('大規模災害の被災地で、数か月にわたり在宅避難している高齢者の栄養アセスメ ントを行った。その中に皮下出血や歯茎からの出血がみられる者がいた。この症状 から欠乏が疑われるビタミンとして、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 118)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン A', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 2', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナイアシン', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン C', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('糖尿病治療薬とその主作用に関する記述である。 誤っているのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 119)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'α-グルコシダーゼ阻害薬は、二糖類の分解を抑制する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'SGLT2阻害薬は、尿細管での糖再吸収を抑制する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビグアナイド薬は、肝臓での糖新生を抑制する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'GLP-1受容体作動薬は、インクレチン分解を抑制する。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スルホニル尿素（SU）薬は、インスリン分泌を促進する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('高キロミクロン血症の栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 120)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '炭水化物の摂取エネルギー比率を 65％Ｅ以上とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪の摂取エネルギー比率を 15％Ｅ以下とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'n-3系多価不飽和脂肪酸の摂取を制限する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果汁飲料の摂取を増やす。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アルコールの摂取量の上限を 40 g/日とする。 9', false, 5);
END $$;



