DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('3月5日の昼、腹痛と下痢を発症した者は、新入社員 60 人、調理従事者4人に 増えた。その頃、保健所から、有症者の便と3月3日夕食のちらし寿司の保存食か ら、ノロウイルスが検出されたと報告があった。 図は、ちらし寿司の作業工程に、保健所の職員が作業時の手洗い、中心温度測 定、手袋着用の有無を聞き取り、追記したものである。ちらし寿司の材料は、米 飯、ちらし寿司の素（しいたけ甘煮・酢れんこん・人参）、卵、さやえんどう、えび である。ノロウイルスの汚染が疑われる作業工程として、最も適切なのはどれか。 1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 191)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ａ', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ｂ', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ｃ', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ｄ 48 図 作業工程 えびの下処理 冷却 （a）煮る 割卵 保健所職員による追記 焼く （b）薄焼き卵を切る さやえんどうの下処理 ゆでる 切る 手袋着用 手袋着用手袋着用手袋着用 手袋着用 手袋着用 手袋着用 手洗い 手洗い 手洗い 手洗い 手洗い 手洗い ：手洗いとアルコール消毒 手袋着用 ：使い捨て手袋着用 ：中心温度測定・記録 中心温度 中心温度 中心温度 洗米・浸漬 炊飯 （c）具を加え混ぜる （d）盛り付け ちらし寿司の素 （しいたけ甘煮・ 酢れんこん・人参）', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('今回の件を踏まえ、調理従事者に衛生教育を実施することになった。重点的に行 う内容として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 192)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食材料の検収・保管に関すること。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '加熱調理食品の加熱温度管理に関すること。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '手洗い及び手袋着用に関すること。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調理機器および調理器具の洗浄・殺菌に関すること。 49 次の文を読み「193」、「194」、「195」に答えよ。 K 町健康課の管理栄養士である。K 町は人口 7,000 人で高齢化率は 30％、国民健 康保険（国保）加入率は 27％ である。町民は農業のほか、地場産業関連の中小企業へ の就労が多い。隣接市には大手 A 社の事業場（従業員 50 名）があり、勤務している町 民もいる。 K 町は、脳血管疾患の標準化死亡比が県内で最も高い。そこで、国保担当者と連携 して国保データベース（KDB）システム等の情報を活用し、町民の壮年期からの脳血 管疾患対策を検討することになった。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('町全体の脳血管疾患対策を検討することを目的として、特定健康診査・特定保健 指導、医療費に関する情報をより広く収集するために、優先して連携する組織であ る。最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 193)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 社健康保険組合', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全国健康保険協会（協会けんぽ）', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '後期高齢者医療広域連合', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '市町村職員共済組合 50', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定健康診査結果を見ると、K 町の年齢区分別高血圧有所見率は、壮年期を含め て、県内の市町村の中でも特に高い状況にあった。医療費分析の結果、高血圧症の 外来医療費は低く、脳血管疾患の入院医療費は高い傾向にあった。これらの結果を 踏まえ、今後の対策を検討するために、優先的に確認する情報である。 最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 194)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧症で通院している者の特定健康診査実施率', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特定保健指導実施率', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧に関して受診勧奨が行われた者の医療機関受診率', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '降圧薬の服用者の割合', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('分析の結果、高血圧改善に焦点を当て、栄養分野では減塩に取り組むことになっ た。県民健康・栄養調査結果を参照すると、K 町を含む地域での食塩摂取源は、調 味料が最も多かった。減塩に向けて効果が期待される取組である。 最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 195)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '町の SNS アカウントで、管理栄養士お勧めの減塩レシピ動画を配信する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '町の広報誌に高血圧有所見率が高いという情報を掲載し、減塩調味料の利用 を呼びかける。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保健センターで、壮年期を対象とした減塩料理教室を開催する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スーパーマーケットに協力を依頼し、減塩調味料の必要性の周知とともに、 販売促進を毎月行ってもらう。 51 次の文を読み「196」、「197」に答えよ。 K 市健康増進課の管理栄養士である。K 市では過疎化が進み、小売店の閉店が相次 ぎ、スーパーマーケットは K 市郊外の1店舗を残すのみとなった。また、高齢者は 身体活動の不足による食欲低下により、低栄養傾向にある者の割合が増加している。 この対策として、K 市は健康増進計画において、低栄養傾向にある者の割合の減少に 関する 10 年間の目標を設定し、取組を行ってきた。', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('高齢者を対象に食事調査を行った。図は、食事バランスガイドの SV の目安量の 範囲と、食事摂取量を比較した結果である。この結果を踏まえた食事改善のための 呼びかけとして、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 196)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギーを摂るために、主食を増やしましょう。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質を摂るために、主菜を増やしましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物繊維を摂るために、副菜を増やしましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミンを摂るために、果物を増やしましょう。 52 0 主食 副菜 主菜 牛乳・乳製品 範囲より少ない者の割合 （％） 範囲内の者の割合 範囲より多い者の割合 図 食事バランスガイドのSVの目安量の範囲と比較した食事摂取量の評価 果物 20406080100', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 市の高齢者における低栄養傾向を改善するために、市内のスーパーマーケッ トの協力を得て、食環境整備を行うことにした。このスーパーマーケットは、宅配 サービスと移動販売車による販売の実績がある。食環境整備の内容に関する記述と して、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 197)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高齢者を対象に、宅配サービスを無料にしてもらう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '移動販売車で扱う食品を増やし、巡回頻度を増やしてもらう。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '簡単に調理できる料理を店内で実演し、その食材の販売コーナーを作っても らう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'K 市が低栄養改善のための料理レシピを考案し、店内に置いてもらう。 53 次の文を読み「198」、「199」、「200」に答えよ。 K 県健康増進課の管理栄養士である。K 県では、全国に比べて、男女ともに脳血管 疾患と虚血性心疾患の年齢調整死亡率が高い。また、K 県では、全国に比べて、男女 ともに 20 歳以上の野菜摂取量の年齢調整平均値が低く、食塩摂取量の年齢調整平均 値が高い。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 県における高血圧症、脂質異常症、糖尿病の 20 歳以上の有病者数を推計する ためのデータとして、最も適当なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 198)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '人口動態調査による死亡の原因', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者調査による入院・外来の推計患者数', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '国民健康・栄養調査に準じる方法で行った県民健康・栄養調査の身体状況調 査結果', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '国民生活基礎調査（大規模調査年）における傷病による通院の状況', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レセプト情報・特定健診等情報データベース（NDB）の特定健康診査データ', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('県内の A 大学は、県の協力のもと、20 歳以上の県民を対象に前向きコホート研 究を実施してきた。食塩および野菜の摂取量に関して、高血圧症、脂質異常症、糖 尿病の罹患の相対危険を算出したところ、表の結果を得た。統計学的な有意水準は 両側5％ とする。この解釈として、最も適当なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 199)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩摂取量は、７g/日より多い群に比べて、７g/日以下の群で、高血圧症 罹患の相対危険が有意に低い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩摂取量は、７g/日より多い群に比べて、７g/日以下の群で、脂質異常 症罹患の相対危険が有意に低い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩摂取量は、７g/日より多い群に比べて、７g/日以下の群で、糖尿病罹 患の相対危険が有意に低い。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜摂取量は、350 g/日未満の群に比べて、350 g/日以上の群で、脂質異常 症罹患の相対危険が有意に低い。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜摂取量は、350 g/日未満の群に比べて、350 g/日以上の群で、糖尿病罹 患の相対危険が有意に低い。 54 表 食塩および野菜の摂取量による各疾患罹患の相対危険（95％信頼区間） 食塩摂取量野菜摂取量 ≦７g/日 ※1 ≧ 350 g/日 ※1 疾患相対危険 ※2 （95％ 信頼区間）相対危険 ※3 （95％ 信頼区間） 高血圧症0. 68（0. 55～0. 85）0. 76（0. 62～0. 93） 脂質異常症0. 98（0. 62～1. 56）0. 92（0. 62～1. 38） 糖尿病0. 89（0. 55～1. 44）0. 69（0. 46～1. 04） ※1 食塩摂取量は >７g/日、野菜摂取量は＜ 350 g/日が基準群 ※2 性、年齢、BMI、喫煙状況、総エネルギー摂取量、野菜摂取量で調整 ※3 性、年齢、BMI、喫煙状況、総エネルギー摂取量、食塩摂取量で調整', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('設問 199 の表の結果を踏まえ、K 県民の食事改善に向けたポピュレーションアプ ロ―チを実施することになった。具体的内容として、最も適切なのはどれか。1つ 選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 200)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'K 県内のスーパーマーケット、コンビニエンスストア、外食店に協力しても らい、野菜の多い料理を販売・提供してもらう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 大学の学生を対象とし、減塩のための標語コンテストを実施し、入選作品 を広報に掲載する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'K 県の県立病院の受診者を対象に、野菜摂取量増加と減塩の重要性が書かれ たチラシを配布する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '多くの K 県民が利用する駅構内とバス停に、野菜摂取量増加と減塩の重要 性に関するポスターを掲示する。 55', true, 4);
END $$;


