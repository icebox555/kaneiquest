DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('インスリンの作用に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 71)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲を促進する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'GLUT4の細胞膜への移行を促進する。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グリコーゲンの分解を促進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖新生を促進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体たんぱく質の分解を促進する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('空腹時と比べたときの食後の糖質代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 72)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨格筋への血中グルコースの取り込みが抑制される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝臓グリコーゲンの合成が抑制される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グルコースからの脂肪酸の合成が亢進する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳酸からのグルコースの合成が亢進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アラニンからのグルコースの合成が亢進する。 24', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('空腹時と比べたときの食後の脂質代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 73)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小腸上皮細胞でキロミクロンの合成が抑制される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢血管でリポたんぱく質リパーゼの活性が抑制される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨格筋でβ酸化が亢進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳でケトン体の利用が亢進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血中への遊離脂肪酸の放出が抑制される。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('脂肪酸および脂肪酸由来の生理活性物質に関する記述である。 誤っているのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 74)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'オレイン酸は、一価不飽和脂肪酸である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'α ─ リノレン酸は、生体内で合成されない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'EPA は、リノール酸から合成される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アラキドン酸は、エイコサノイドの前駆体である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'プロスタグランジンは、エイコサノイドの一種である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('たんぱく質・アミノ酸の体内代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 75)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が不足すると、窒素出納が正になる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が不足すると、ビタミン B 6 の必要量が増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が増加すると、尿中尿素量が減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質を過剰に摂取すると、アミノ酸の異化が抑制される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギー摂取量が不足すると、たんぱく質の必要量が増加する。 25', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ビタミン D の栄養学的特徴と機能に関する記述である。 誤っているのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 76)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D 2 は、7 ─ デヒドロコレステロールから合成される。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D は、水酸化されることにより活性型となる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D は、腎臓で活性型に至る。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '活性型ビタミン D は、核内受容体と結合する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '活性型ビタミン D は、カルシウム結合たんぱく質の合成を促進する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ビタミンB群とその補酵素型の組合せである。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 77)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 ピリドキサールリン酸（PLP）', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 2 フラビンアデニンジヌクレオチド（FAD）', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 6 チアミン二リン酸（TDP）', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビオチンコエンザイム A（CoA）', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '葉酸メチルコバラミン', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ミネラルとそれを構成成分とする酵素の組合せである。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 78)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄セルロプラスミン', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '亜鉛キサンチンオキシダーゼ', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '銅カタラーゼ', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セレン グルタチオンペルオキシダーゼ', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'モリブデンスーパーオキシドジスムターゼ（SOD）', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('鉄の吸収と体内利用に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 79)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄の吸収は、体内鉄貯蔵量の影響を受けない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '非ヘム鉄は、Fe ３+ として吸収される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トランスフェリンは、鉄の血中輸送を行う。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '貯蔵鉄は、主にヘモグロビンとして蓄えられる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '赤血球の破壊で遊離した鉄は、再利用されない。 26', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('水の出納に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 80)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養素1g 当たりの代謝水の量は、たんぱく質より脂質が多い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分摂取量が増加すると、不可避尿量は増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分摂取量が不足すると、バソプレシンの分泌は減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発汗では、ナトリウムの損失がない。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不感蒸泄量は、外気温の影響を受けない。', false, 5);
END $$;



