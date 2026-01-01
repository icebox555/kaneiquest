DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ある工場の従業員食堂では、昼食に定食を毎日提供している。表は、1か月を 30 日とした場合の、定食の主食種類別の提供頻度（表1）と、食品構成表の抜粋（表 2）である。主食に使用する1人1食当たりの米の純使用量（g）として、最も適当 なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 161)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '40', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '50', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '60', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '70', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '90 表1 定食の主食種類別の提供頻度 主食の種類回/月 ご飯20 パン 3 めん 7 表2 定食の食品構成表（抜粋） 食品群小分類 重量 （g） エネルギー （kcal） 穀類 米類60215 パン類 6 18 めん類30 51 その他穀類 4 15', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('給食の品質管理に関する記述である。最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 162)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '設計品質は、発注書で示される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '設計品質は、検収簿で確認できる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '適合品質は、検食簿で評価する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '適合品質は、利用者の満足度調査の結果で評価する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '総合品質は、献立表で評価する。 28', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ブロッコリーのサラダを調理する。1人当たりの純使用量を60g、廃棄率を 40％ とした場合、300 人分のブロッコリーの使用量（kg）として、最も適当なのは どれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 163)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '10. 8', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '18. 0', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '25. 2', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '30. 0', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '45. 0', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食材料管理に関する記述である。最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 164)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '年間の価格変動が大きい生鮮果物は、指名競争入札方式で購入する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生鮮カット野菜は、1週間ごとに一括購入する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食肉類は、納入時の品温が 10°C 以下であることを確認する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トッピング用のかつお節は、検収を省略できる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '同じ料理に使う食肉類と野菜類は、まとめて同じ容器に保管する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('給食の生産・提供システムに関する記述である。 最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 165)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コンベンショナルシステムでは、前倒し調理による計画生産が可能である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セントラルキッチンシステムでは、サテライトキッチンで調理した料理をセ ントラルキッチンに配送する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '真空調理システムでは、低温加熱により食材料の風味を逃さず軟らかく調理 することができる。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クックサーブシステムでは、調理した料理を急速冷凍して、提供日まで保管 する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クックチルシステムでは、加熱調理後の料理を 90 分以内に5°C まで冷却す る。 29', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('白身魚のフライと人参のサラダの作業動線の案を作成した（図）。図中の機器・設 備の配置は変えずに、適切な作業動線となるよう、見直すべき事項として、最も適 当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 166)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '検収した人参を洗浄するシンク', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '下処理後の人参を加熱機器に運ぶ動線', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '加熱後の人参を冷却機器に運ぶ動線', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '加熱後の人参を冷却する機器', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '冷却後の人参を調味する作業場所 図 作業動線の案 作業台 作業台 作業台 消毒保管庫 【洗浄室】 【下処理室（野菜）】 【下処理室（魚肉）】 【配膳室】 【調理室】 【前室】 【検収室】 【事務所】 シンク 人参のサラダの作業動線 白身魚のフライの作業動線 冷蔵庫 ブラスト チラー 消毒保管庫 冷蔵庫 ガス テーブル フライヤー 回転釡 スチーム コンベクション オーブン 炊飯器 冷蔵庫 冷蔵庫 シンク シンク シンク 切さい機 コールド テーブル 30', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 事業所の食堂では、対面サービス方式で給食を提供している（図）。各料理を適 温で効率よく安全に提供したい。鶏の唐揚げ（付け合わせ：トマト、レタス）、小松 菜のお浸し、味噌汁、ご飯の献立の場合、提供場所（A～C コーナー）と料理の組合 せとして、最も適当なのはどれか。1つ選べ。 A コーナーB コーナーC コーナー (1) 鶏の唐揚げ小松菜のお浸し味噌汁 (2) 鶏の唐揚げ 味噌汁小松菜のお浸し (3) 小松菜のお浸し 鶏の唐揚げ味噌汁 (4) 小松菜のお浸し 味噌汁鶏の唐揚げ (5) 味噌汁 鶏の唐揚げ小松菜のお浸し A コーナーB コーナー 利用者の動線 温蔵庫 C コーナー 図 配膳場所のレイアウト ライス ジャー 31', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 167)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('給食施設において、鮭のムニエル（付け合わせ：トマト）を調理した。各調理工程 における衛生管理上の問題とその際の対応に関する記述である。 最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 168)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鮭の検収時の温度が８°C であったため、急速冷却した。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トマトの殺菌用の次亜塩素酸ナトリウム溶液の濃度が 20 mg/L であったた め、殺菌時間を5分間から 15 分間に延長した。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '消毒済みのトマトを魚用のバットで保管したため、トマトの細菌検査を実施 した。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鮭の加熱調理時の中心温度が 70°C であったため、75°C 以上になるまで加熱 を続け1分間維持した。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鮭のムニエルを保温するウォーマーの温度が 50°C であったため、鮭をス チームコンベクションオーブンで再加熱した。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('大量調理施設衛生管理マニュアルに基づく衛生管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 169)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '手指に化膿創がある場合は、手袋を着用して調理を行う。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フードカッターの取扱いは、床面から 30 cm の場所で行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '加熱調理後に冷却した食品の一時保管は、下処理室で行う。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '貯水槽の水を使用する場合は、遊離残留塩素が 0. 1 mg/L 以上であることを 確認する。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '使用後の容器は、洗浄後 60°C で5分間の加熱殺菌をする。 32', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 病院において、災害発生時の食事提供に関するマニュアルを更新する。更新に 当たり、改めて確認が必要な内容として、誤っているのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 170)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '協力機関との連絡方法', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '冷凍野菜の購入先', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電気・ガスが使えないときの熱源', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理従事者の通勤手段', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事の配膳・下膳方法 33 次の文を読み「171」、「172」、「173」に答えよ。 K 市保健センターに勤務する管理栄養士である。乳幼児相談において、男児（８か 月、第一子）の母親からの相談に応じている。 母親は、授乳や離乳食の与え方が適切かどうか自信がなく、男児の発育の状態を心 配している。夫は育児に協力的だが、昼間は母親と男児の2人でおり、引っ越してき たばかりで近所に知り合いはいない。', false, 5);
END $$;



