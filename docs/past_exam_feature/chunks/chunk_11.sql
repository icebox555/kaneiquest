DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('減量が必要な女性に対し、動機づけ面接を用いたカウンセリングを行った。アン ビバレンスを示す女性の発言として、最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 101)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '飲み会に誘われると嬉しいですし、付き合いもあるので断るのは難しいで す。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '家族に協力してもらいながら食事制限に取り組んで、体重を減らしたいと思 います。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事制限はストレスがたまるので、暴飲暴食してしまうかもしれないです。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'お菓子の量を減らした方が良いと思いますが、お菓子が好きなので我慢する のは難しいです。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'お菓子作りは一番の趣味なので、やめられないです。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('地域在住の高齢女性に、個別の栄養カウンセリングを行い、フレイル予防のため の目標を話し合った。行動契約の目標宣言として、最も適切なのはどれか。1つ選 べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 102)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質を多く含む食品の摂取量を増やす。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '間食で牛乳や乳製品を摂るように心がける。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '今よりも体重が低下しないようにする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肉と魚を両方とも1日1回以上食べる。', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 社では、社員の多くが食塩を過剰に摂取しており、健康への関心が薄い。そこ で、社員食堂で減塩を目指し、ナッジを活用した取組を実施することにした。効果 が見込める取組内容として、最も適切なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 103)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '社員の食塩摂取状況を、社員食堂の入口でデジタルサイネージに表示する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全てのメニューの食塩相当量を、社員食堂の食券販売機に掲示する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩を多く含むメニューを、提供しないようにする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '減塩をアピールせずに、減塩メニューに魅力的な名称をつけて販売する。 2', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ストレスマネジメントには、問題焦点コーピングと情動焦点コーピングがある。 毎日の離乳食作りが負担になっている母親のストレスマネジメントである。母親の 行動とコーピングの組合せとして、最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 104)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '友人に、離乳食作りの苦労について話を聞いて もらう。 問題焦点コーピング', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '離乳食作りは一生続くわけではないと自分に言 い聞かせる。 問題焦点コーピング', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '夫婦で、離乳食作りの分担について話し合う。 問題焦点コーピング', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '負担を感じたときに利用できる市販の離乳食を 常備する。 情動焦点コーピング', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '離乳食作りの動画を視聴して、負担軽減の方法 を考える。 情動焦点コーピング', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 大学では一人暮らしの1年生に対して、5月の連休明けに、自宅での食事作り をサポートすることになった。参加者のグループダイナミクスが期待できる取組と して、最も適切なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 105)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '自宅で食事を作るようになった先輩の話を聞かせた上で、各自の感想をオン ラインフォームに入力してもらう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '各自で、自宅での食事作りの目標を設定してもらう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事作りの悩みや苦労していることについて、グループに分かれて話し合っ てもらう。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グループに分かれて、インターネットで簡単そうなレシピを探してもらう。 3', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('若い世代の魚離れが進んでいる漁港のある町で、子育て中の保護者を対象に魚食 推進の食育プログラムを計画した。プリシード・プロシードモデルの項目とアセス メント内容の組合せとして、最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 106)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '行動とライフスタイル 漁港から魚類を安価で入手できる方法を知っ ている者の割合', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '環 境 家庭で魚料理を作る頻度', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '準備要因 魚の調理を面倒と思わない者の割合', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '強化要因 地域のスーパーマーケットにおける魚類の 販売状況', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '実現要因 地場産の魚類の名前を知っている者の割合', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('健康教育において、目標設定を行うために SMART の法則を用いた。SMART を構成する5つの項目である。誤っているのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 107)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Specific', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Measurable', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Achievable', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Representative', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Time-bound 4', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('正常高値血圧の人を対象とした教室を開催することになり、栄養教育の目標を設 定した。目標の内容と種類の組合せとして、最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 108)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '減塩調味料を常備している家庭の割合を、60％ 以上に増 やす。 実施目標', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩摂取量の目標が６g/日未満であることを知っている 人の割合を、70％ 以上に増やす。 学習目標', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '減塩メニューがある飲食店を利用する人の割合を、50％ 以上に増やす。 環境目標', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '教室に最後まで参加した人の割合を、70％ 以上にする。 結果目標', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '半年後に参加者の収縮期血圧の平均値を、3mmHg 下げ る。 行動目標', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 女子高校で「やせ」をテーマとした食育を、全校生徒を対象に実施することに なった。効果的な実施方法として、最も適切なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 109)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '養護教諭が、過度なダイエット行動の危険性について動画を作成し、視聴を 勧める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '教育委員会の栄養教諭が、簡易な食事記録用紙を作成し、生徒に配布する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '家庭科クラブの生徒が、家庭科教員のレクチャーを含めたワークショップを 企画し実施する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生徒会が、やせ防止に関するポスターコンテストを開催し、入賞作品を食堂 に掲示する。 5', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('地域在住高齢者を対象に、フレイル予防の食事講座を5回シリーズで開催した。 事業に対する評価の内容と種類の組合せである。 最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 110)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '講座終了後に参加者同士のグループが形成され、 仲が深まったと感じている者の割合 企画評価', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '講座で使用した教材は分かりやすかったと回答した 者の割合 経過評価', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '講座終了後に食品摂取の多様性得点が改善した者の 割合 形成的評価', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '講座の参加費が適正であると回答した者の割合経済評価', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フレイル予防には食事が大切であると理解できた者 の割合 結果評価', false, 5);
END $$;



