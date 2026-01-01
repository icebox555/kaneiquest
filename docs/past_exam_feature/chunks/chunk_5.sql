DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('関節リウマチに関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 41)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発症のピーク年齢は、60 歳以上である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性に多い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '滑膜の炎症が生じる。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '関節炎症状は、片側の関節に好発する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '自己抗体は、陰性である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('感染症に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 42)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '日和見感染とは、感染しても症状が現れない場合をいう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブドウ球菌は、グラム陰性菌である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '帯状疱疹の病原体は、単純ヘルペスウイルスである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '劇症型溶連菌感染症は、再興感染症である。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発疹チフスの病原体は、クラミジアである。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('野菜類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 43)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'なす果皮のナスニンは、カロテノイド色素である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'とうがらしの辛み成分は、イソチオシアネートである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ほうれんそうのあく成分は、ホモゲンチジン酸である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブロッコリー（花序・ゆで）の可食部 100 g 当たりのビタミン C 含量は、だ いこん（根・皮なし・生）より多い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'にんじん（根・皮なし・生）の可食部 100 g 当たりのカルシウム含量は、こま つな（葉・生）より多い。 14', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('きのこ類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 44)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '干ししいたけの香りの主成分は、ヌートカトンである。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'まつたけの香りの主成分は、ノナジエノールである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'きくらげは、7 ─ デヒドロコレステロールを含む。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '傘が7割程度開いた肉厚の干ししいたけを、どんこ（冬菇）という。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリュフは、コナラなどの原木で栽培される。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('肉類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 45)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'と畜後、グリコーゲンが嫌気的に分解されることで、pH が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鶏肉の0～4°C における最大死後硬直期までの時間は、牛肉より長い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'と畜後、アクトミオシンが形成されると、肉質は軟化する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '熟成中に ATP が増加することで、うま味が増す。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'メトミオグロビンにおけるヘム中の鉄イオンは、３価である。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('油脂類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 46)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'サフラワー油は、ヒマワリの種子を原料として製造される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バターのリノール酸含量は、とうもろこし油より多い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'えごま油のα ─ リノレン酸含量は、ごま油より多い。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カカオ脂のヨウ素価は、オリーブ油より大きい。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '米ぬか油のけん化価は、パーム油より大きい。 15', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('精白米の第一制限アミノ酸は、塩基性であり、アミノカルボニル反応が生じやす い。このアミノ酸の構造式として、最も適当なのはどれか。1つ選べ。 (1) (2) (3) (4) O O HO O OH OH OH O H ２ N OH H ２ N NH ２ NH ２ O (5) HO OH OO H ３ C 16', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 47)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の機能性成分には、消化管内で作用する機能（消化管内）と、吸収後に標的組 織で作用する機能（標的組織）とがある。食品成分の三次機能と作用する場所の組合 せとして、最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 48)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'サーデンペプチドによる血圧の降下消化管内', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大豆イソフラボンによる骨の健康維持消化管内', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '難消化性デキストリンによる血糖値上昇の抑制標的組織', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'EPA による血中中性脂肪の減少標的組織', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'CPP（カゼインホスホペプチド）によるカルシウムの吸収促進 標的組織', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定保健用食品の関与成分による三次機能と作用機序の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 49)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'キシリトールの低う蝕作用再石灰化の促進', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '難消化性オリゴ糖の整腸作用 プロバイオティクスとしての作用', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中鎖脂肪酸の体脂肪低蓄積性 脂肪組織でのβ酸化関連酵素の活性化', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'キトサンの血中コレステロー ル低下作用 胆汁酸の再吸収抑制', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'γ ─ アミノ酪酸（GABA）の降 圧作用 アンジオテンシン変換酵素の阻害', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の変質に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 50)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品中の生菌数が 10 ３ 個/g を超えると、初期腐敗と判定される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリメチルアミンは、肉類における初期腐敗の指標である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘテロサイクリックアミンは、非酵素的褐変により生成する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '油脂の自動酸化は、不飽和脂肪酸から水素原子が脱離することで開始する。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'K 値は、ATP 関連化合物の酵素的分解が進むと低下する。 17', false, 5);
END $$;



