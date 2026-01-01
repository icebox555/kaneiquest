DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('14 歳、女性。神経性やせ症。BMI 16. 5 kg/m 2 。母親に伴われ外来受診した。初 回の栄養食事指導に関する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 131)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '1か月後の体重増加目標量を決める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体重を毎日測定するように指示する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '過食症状の有無を確認する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲が増すように運動を推奨する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養バランスを整えるように食事内容を指導する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('80 歳、男性。ADL 自立。身長 155 cm、体重 47 kg、BMI 19. 6 kg/m 2 。標準 体重 53 kg。握力 20 kg。サルコペニアと診断された。血液検査値は、アルブミン 3. 2 g/dL、クレアチニン 0. 6 mg/dL、尿素窒素 12 mg/dL。たんぱく尿（－）。こ の患者の1日当たりの目標栄養量の組合せとして、最も適切なのはどれか。1つ選 べ。 エネルギー （kcal/日） たんぱく質 （g/日） (1) 1,000 40 (2) 1,600 40 (3) 1,600 65 (4) 2,000 100', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 132)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食物アレルギーと除去対象となる食品・原材料の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 133)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳アレルギー 牛肉', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鶏卵アレルギー 卵殻カルシウム', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大豆アレルギー 緑豆もやし', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カシューナッツアレルギー ピスタチオ', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小麦アレルギー 麦芽糖 15', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('イレウスにより空腸の一部、回腸全体および回盲弁を切除し、空腸と結腸を吻合 した。残存小腸は約 100 cm であった。この患者の病態の経過および栄養管理に関 する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 134)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第I期（術直後期）には、腸蠕動運動の亢進後に腸管麻痺が起こる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第I期（術直後期）には、経腸栄養法とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第II期（回復適応期）には、下痢の回数が増加する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第II期（回復適応期）には、経口摂取を禁忌とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第III期（安定期）には、ビタミン B 12 を注射により補給する。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('重度嚥下障害患者の直接訓練で用いる食品である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 135)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '麦茶', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'とろみ茶', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'おもゆ', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'よく潰したバナナ', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '絹ごし豆腐', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('メープルシロップ尿症の治療用ミルクで除去されているアミノ酸である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 136)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フェニルアラニン', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリプトファン', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'メチオニン', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ロイシン', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スレオニン 16', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('公衆栄養活動に関する記述である。最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 137)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '傷病者の治療を目的として行う。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ソーシャルキャピタルは、公衆栄養活動のための財源である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コミュニティオーガニゼーションは、住民参加を通して、地域に存在する諸 問題を解決に導く過程である。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポピュレーションアプローチでは、特定健康診査においてリスクありと判定 された個人に対して、働きかけを行う。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エンパワメントのための公衆栄養活動は、自治体が中心となって行う。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('平成 22（2010）年～令和元（2019）年の国民健康・栄養調査における 20 歳以上の身 体および栄養・食生活の状況に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 138)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性における肥満者（BMI 25 kg/m 2 以上）の割合は、減少している。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '女性におけるやせの者（BMI 18. 5 kg/m 2 未満）の割合は、減少している。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '65 歳以上の高齢者における低栄養傾向の者（BMI 20 kg/m 2 以下）の割合は、 増加している。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '令和元（2019）年の食塩摂取量の平均値は、男女ともに 40～50 歳台よりも 60 歳以上で多い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜摂取量の平均値は、増加している。 17', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食料需給表から算出された、わが国の食料自給率のうち、米、野菜、果実、鶏卵 の品目別自給率（重量ベース）の年次推移である（図）。鶏卵については、飼料自給率 を考慮した値である。図のａ～ｄに該当する食品の組合せとして、最も適当なのは どれか。1つ選べ。 abcd (1) 鶏卵米果実野菜 (2) 鶏卵 米野菜果実 (3) 米 鶏卵野菜果実 (4) 米 果実野菜鶏卵 (5) 米 野菜果実鶏卵 a 120 100 80 60 40 196519701975198019851990199520002005201020152020 （年） 品目別自給率（％） 20 0 b c d 図 品目別自給率（重量ベース）の推移 鶏卵の値は、飼料自給率を考慮している。 18', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 139)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('世界の健康・栄養問題の現状と課題に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 140)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '死亡者数は、NCDs によるものが最も多い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COVID-19 は、NCDs に分類される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '2000 年以降、低中所得国の NCDs による死亡者数は、減少傾向にある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主要先進国（G７）においては、過去 20 年で成人の肥満者の割合が減少して いる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '日本におけるナトリウム摂取量は、北アメリカに比べて少ない。', false, 5);
END $$;



