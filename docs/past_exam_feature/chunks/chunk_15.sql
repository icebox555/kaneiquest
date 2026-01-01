DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('健康増進法に定められている事項と、その実施者の組合せである。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 141)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事摂取基準の策定 内閣総理大臣', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特別用途表示の許可 内閣総理大臣', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '国民健康・栄養調査の調査世帯の指定 厚生労働大臣', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養指導員の任命 厚生労働大臣', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康診査の実施等に関する指針の策定 都道府県知事', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養士法に関する記述である。最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 142)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大正時代に制定された。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養士は、特定多数人に対して継続的に食事を供給する施設において、特別 の配慮を必要とする給食管理を行うことを業とする者と定義されている。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士は、傷病者に対する療養のために必要な栄養の指導を行うことを 業とする者と定義されている。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士免許は都道府県知事が与えることについて定めている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '国民健康・栄養調査員の任命について定めている。 19', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('健康日本 21（第三次）における目標である。誤っているのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 143)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '適正体重を維持している者の増加（肥満、若年女性のやせ、低栄養傾向の高 齢者の減少）', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果物摂取量の改善', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域等で共食している者の増加', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品ロス削減のために何らかの行動をしている者の増加', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「健康的で持続可能な食環境づくりのための戦略的イニシアチブ」の推進', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('第4次食育推進基本計画に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 144)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '各都道府県において策定されている。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '計画期間は、12 年間である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「持続可能な食を支える食育の推進」を重点事項としている。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「20 歳未満の者の飲酒をなくす」という目標項目がある。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食育推進計画を作成・実施している市町村を 80％ にする目標値を設定して いる。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('国民健康・栄養調査に関する記述である。最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 145)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '対象者は、住民基本台帳から無作為に抽出する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養摂取状況調査の対象者は、６歳以上である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養摂取状況調査は、日曜日または祝祭日に実施する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養摂取状況調査は、陰膳法を用いる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養素等摂取量の算出では、調理による食品中の栄養素量の変化を考慮して いる。 20', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食事バランスガイドにおける料理区分と「1つ（SV）」基準の組合せである。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 146)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主食 主材料に由来する炭水化物として 80 g', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副菜 主材料の重量として 100 g', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主菜 主材料に由来するたんぱく質として６g', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳・乳製品 主材料に由来するカルシウムとして 200 mg', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果物 主材料の重量として 50 g', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('集団の栄養素等摂取量を評価するために行う食事記録法に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 147)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事記録法のうち、目安量法は、秤量法に比べて摂取量推定の誤差が小さ い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '陰膳法に比べて、対象者1人当たりの調査費用が高い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '24 時間食事思い出し法に比べて、対象者の負担が小さい。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物摂取頻度調査法に比べて、対象者の記憶に依存する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物摂取頻度調査法に比べて、調査員の負担が大きい。 21', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 地域における 20 歳台女性 100 人の BMI の分布である（図）。この集団のエネル ギー摂取状況について、日本人の食事摂取基準（2020 年版）を用いて評価した。こ の評価に関する記述である。最も適当なのはどれか。1つ選べ。 2 2 11 11 4 4 4', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 148)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'BMI の中央値のある階級は、17. 5～18. 0 kg/m 2 である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'BMI の中央値と平均値は、同じである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギー摂取量の不足者の割合は、35％ である。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギー摂取量の過剰者の割合は、16％ である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギー摂取量が適切である者の割合は、30％ である。 図 BMIの分布（n＝100） 14 12 10 8 （人） 99 22 33 1111 10 13 7 6 4 （kg/m 2 ） ※区間の上限は未満である。 2 0 16. 5～17. 0 17. 0～17. 5 17. 5～18. 0 18. 0～18. 5 18. 5～19. 0 19. 0～19. 5 19. 5～20. 0 20. 0～20. 5 20. 5～21. 0 21. 0～21. 5 21. 5～22. 0 22. 0～22. 5 22. 5～23. 0 23. 0～23. 5 23. 5～24. 0 24. 0～24. 5 24. 5～25. 0 25. 0～25. 5 25. 5～26. 0 26. 0～26. 5 22', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('公衆栄養マネジメントに関する記述である。誤っているのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 149)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域診断の結果を基に、PDCA サイクルに従って進める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'プリシード・プロシードモデルの最終目標は、QOL の向上である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '課題解決型アプローチでは、目指す姿を、専門家ではなく住民が主体となっ て決定する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '目標達成までの取組期間を明示する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '投入した資源に対する、公衆栄養活動の効果を評価する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('公衆栄養アセスメントに用いる統計情報とその出典の組合せである。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 150)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '平均寿命 国民生活基礎調査', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '幼児の朝食習慣 乳幼児栄養調査', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '学校給食実施率 学校保健統計調査', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食中毒の患者数 感染症発生動向調査', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健診・人間ドックの受診状況 患者調査', false, 5);
END $$;



