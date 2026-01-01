DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('牛乳および牛乳加工品に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 61)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳製造におけるホモジナイズとは、カゼインミセルの大きさを均質化する ことである。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バター製造におけるチャーニングとは、牛乳やクリームから分離した脂肪を 練り上げることである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'チーズ製造におけるカードとは、原料乳にレンネットを加えた際に生じる凝 固物のことをいう。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アイスクリーム類の1つであるラクトアイスは、乳固形成分が 15. 0％ 以上 と規定されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発酵乳であるヨーグルトは、主にβ ─ ラクトグロブリンが等電点沈殿したも のである。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品とその製造に利用される酵素の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 62)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水あめインベルターゼ', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カップリングシュガーカタラーゼ', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果糖ぶどう糖液糖グルコースイソメラーゼ', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食用油脂トランスグルタミナーゼ', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成型肉ペクチナーゼ', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の保存に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 63)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '質量パーセント濃度が同一であれば、ショ糖より食塩の方が浸透圧を高める 効果が大きい。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レトルト食品の殺菌は、65°C で 30 分以上行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分活性 0. 9 以上において、ほとんどの微生物の増殖は抑制される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '無機酸の微生物増殖抑制効果は、有機酸より優れている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'チルドとは、食品を半凍結状態で貯蔵することである。 21', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('植物性食品の加熱調理とその目的の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 64)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '山菜を重曹水でゆでる。軟化の抑制', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'れんこんを酢水でゆでる。軟化の促進', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '黒豆を鉄なべで煮る。色の安定化', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'さつまいもをミョウバン入りの水でゆでる。軟化の促進', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリフラワーを酢水でゆでる。あく抜き', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('揚げ物の調理に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 65)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '揚げ物に用いる油の比熱は、水の約2倍である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '150°C 程度の揚げ油では、天ぷら衣はすぐに浮き広がる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '魚介の天ぷらの揚げ油の適温は、ドーナッツよりも高い。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フライドポテトの揚げ油の適温は、200°C 程度である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポテトチップスの吸油率は、かき揚げよりも高い。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('オレンジピーマン（果実・生）可食部 100 g 当たりのビタミン A 量を表に示した。 レチノール活性当量（μgRAE）として、最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 66)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '35', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '48', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '53', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '59', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '72 表 オレンジピーマン（果実・生）可食部100g当たりのビタミンA量（μg） レチノールα ─ カロテンβ ─ カロテンβ ─ クリプトキサンチン －150420290 日本食品標準成分表 2020 年版（八訂）からの抜粋 22', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('なす 200 g から先端とへたを取り除き（廃棄率 10％）、なす重量の5％ のなたね 油を用いて油いためを作った。表は、可食部 100 g 当たりのエネルギー値および調 理による重量変化率である。この油いためのエネルギー量（kcal）として、最も適当 なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 67)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '100', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '105', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '112', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '131', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '180 表 可食部100g当たりのエネルギー値および調理による重量変化率 エネルギー（kcal）重量変化率（％） なす 果実 生18－ なす 果実 油いため7376 なたね油887－ 日本食品標準成分表 2020 年版（八訂）からの抜粋', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食欲の調節に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 68)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '空腹感は、出生後の食経験によって形成される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪細胞におけるトリグリセリド分解が亢進すると、満腹感が生じる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '満腹中枢は、動脈と静脈の血中グルコース濃度の差が大きいと刺激される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レプチンは、主に胃から分泌される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グレリンは、食欲を抑制する。 23', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('管腔内消化の調節に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 69)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腸相は、胃に食物が入ることによって起こる応答である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '交感神経は、消化液の分泌を促進する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副交感神経は、消化管の運動を抑制する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ガストリンは、胃酸分泌を抑制する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コレシストキニンは、胆嚢の収縮を促進する。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養素の吸収に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 70)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フルクトースは、Na + の濃度勾配を利用して吸収される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ラクトースを構成する単糖は、SGLT1により吸収される。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アミノ酸は、H + の濃度勾配を利用して吸収される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '短鎖脂肪酸は、主にミセルを形成して吸収される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コレステロールの吸収は、胆汁酸を必要としない。', false, 5);
END $$;



