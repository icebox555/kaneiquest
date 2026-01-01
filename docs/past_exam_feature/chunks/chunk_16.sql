DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('地域において公衆栄養プログラムを展開するための社会資源に関する記述であ る。最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 151)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '民間企業は、スマート・ライフ・プロジェクトに参画することができない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食生活改善推進員は、市町村の職員として公衆栄養活動を行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養ケア・ステーションは、市町村が設置する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '行政の管理栄養士の役割として、食育推進のためのネットワークの構築があ る。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域ケア会議は、都道府県知事が開催する。 23', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('母子に対する公衆栄養に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 152)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '未熟児の訪問指導の実施主体は、都道府県である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳児の健康診査の対象月齢は、全国で統一されている。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳幼児健康診査の受診者に対する支援方法の決定には、医師の指示が必要で ある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「妊娠前からはじめる妊産婦のための食生活指針」には、飲酒に関する記載が ある。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「授乳・離乳の支援ガイド」では、離乳食を進める際は月齢を最優先すること と記載されている。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定給食施設が給食を通して担うことのできる役割である。 誤っているのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 153)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '給食を活用した栄養教育', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '望ましい食習慣の形成', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不特定かつ多数の者の栄養管理', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '利用者の食環境の整備', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康の保持増進 24', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('健康増進法に基づく、特定給食施設と管理栄養士の配置に関する組合せである。 最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 154)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '昼食を 100 食提供する保育所配置しなければならない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '朝食、昼食、夕食をそれぞれ 150 食提供 する介護老人福祉施設 配置しなければならない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '朝食、昼食、夕食をそれぞれ 250 食提供 する介護老人保健施設 配置しなければならない。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '朝食、昼食、夕食を合わせて 800 食提供 する病院 配置するように努めなけれ ばならない。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '従業員の８割が利用する、1日 1,500 食 提供する従業員食堂 配置するように努めなけれ ばならない。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('給食経営管理におけるサブシステムと、その主な目的の組合せである。 最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 155)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養・食事管理 大量調理機器の購入計画の作成', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '品質管理 計画どおりの食事の提供', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '提供管理 調理従事者の労働安全性の確保', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '人事・労務管理 献立作成基準の設定', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '施設・設備管理 作業工程計画に沿った食事の生産', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('給食施設における管理栄養士の業務と、その業務に関して連携することが望まし い他職種の組合せである。最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 156)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保育所での児の食事摂取状況の把握 健康運動指導士', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小学校給食の配膳指導 スクールカウンセラー', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '事業所給食の給与栄養目標量の設定 食品衛生監視員', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '病院での患者の食事摂取量の把握 臨床検査技師', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '病院での摂食嚥下機能障害がある患者に 対する食形態の決定 言語聴覚士 25', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('小学校の給食業務を外部委託している自治体が、給食受託会社に委託できる業務 である。誤っているのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 157)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アレルギー対応の献立作成', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食材料の調達', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理従事者の健康チェック表の点検・確認', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理作業時の異物の確認', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理機器の保守点検', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 病院では直営で給食を運営し、調理システムはクックサーブシステムを採用 している。人的資源不足に対応した取組に関する記述として、最も適当なのはどれ か。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 158)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理する献立の品数を増やす。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '加工度の高い食材料から加工度の低い食材料に切り替える。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大量調理機器の稼働率を下げる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中央配膳方式から病棟配膳方式に切り替える。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '朝食をアッセンブリーサーブシステムで運用する。 26', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食単価契約で給食を運営している K 事業所における、給食販売価格の構成であ る（図）。図のａ～ｃに該当する用語の組合せとして、最も適当なのはどれか。1つ 選べ。 abc (1) 直接費製造原価利益 (2) 直接費 製造原価売上高 (3) 直接費 総原価利益 (4) 製造原価 総原価利益 (5) 製造原価 総原価売上高 図 K事業所における給食販売価格の構成 食材料費労務費経費c a b 販売経費 ・ 一般管理費', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 159)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ある社員食堂では、利用率を高めるための対策を検討している。取り組む内容と マーケティング用語の組合せとして、最も適当なのはどれか。1つ選べ。', '2a4257c6-2021-4dea-84e4-490609c4751c', 2, 39, 160)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '提供メニューが購入された時 間と食数の情報を管理する。 merchandising', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '売上成長率と売上構成比から、 既存メニューの位置づけを知る。 product portfolio management', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '期間限定メニューを商品化す る計画を立てる。 point of sales', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '新規メニューの写真入りポス ターを社内に掲示する。 place', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '新規メニューをテイクアウト コーナーで販売する。 promotion 27', false, 5);
END $$;



