DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('幼児期・学童期・思春期に関する記述である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 91)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '基礎代謝基準値（kcal/kg 体重/日）は、思春期より幼児期の方が高い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳幼児身体発育曲線における1歳6か月児の身長は、立位で測定された値に 基づく。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳歯は、2歳までに生えそろう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '神経性やせ症では、頻脈がみられる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '起立性調節障害では、起立により血圧が上昇する。 30', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('更年期の女性において、増加または上昇するものである。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 92)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血中プロゲステロン値', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血中エストロゲン値', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血中 LDL コレステロール値', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血管内皮細胞での一酸化窒素の合成', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨密度', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('45 歳、男性。身長 170 cm、体重 66. 5 kg、BMI 23. 0 kg/m 2 。表は、1週間の 平均的な身体活動をまとめたものである。「健康づくりのための身体活動・運動ガ イド 2023」で推奨されている身体活動量（23 メッツ・時/週）の達成に向けた取組に 関する記述である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 93)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '達成しているため、追加すべき身体活動はない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '立位での食事の支度（2. 0 メッツ）30 分を、週7回追加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '犬の散歩（3. 0 メッツ）30 分を、週4回追加する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ランニング（6. 0 メッツ）15 分を、週３回追加する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腕立て伏せ（8. 0 メッツ）6分を、週2回追加する。 表 対象者の1週間の身体活動状況 強度（メッツ）時間（分）頻度（日/週） 自転車（通勤）4. 0155 デスクワーク（座位）1. 33005 打ち合わせ、会話、電話1. 51205 食事1. 5607 身支度2. 0207 スクワット5. 064 子どもの世話3. 0307 31', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('嚥下機能を評価するためのスクリーニング法である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 94)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Functional Independence Measure（FIM）', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Fall Risk Index（FRI）', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Geriatric Nutritional Risk Index（GNRI）', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Mini ─ Mental State Examination（MMSE）', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Repetitive Saliva Swallowing Test（RSST）', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('体力評価における測定項目と評価内容の組合せである。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 95)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '長座体前屈 敏捷性', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '20 m シャトルラン平衡性', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '握力巧緻性', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '閉眼片足立ち時間柔軟性', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '上体起こし筋持久力', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('25 歳、男性、バスケットボール選手。身長 170 cm、体重 70 kg、BMI 24. 2 kg/m 2 。 筋肉量の増加を目的に、通常の練習に加え筋力トレーニングを行っている。エネル ギー目標量を 3,200 kcal/日に設定した。1日当たりのたんぱく質摂取量（g）とし て、最も適切なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 96)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '70', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '120', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '180', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '240 32', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('汎（全身）適応症候群に関する記述である。最も適当なのはどれか。1つ選べ。 20 1 管理栄養士の名称を用いて業務を開始できる日として、最も適当なのはどれ 20 2 管理栄養士に求められる専門職としてのあり方に関する記述である。最も適', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 97)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '警告反応期のショック相では、血圧が低下する。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '警告反応期の反ショック相では、血糖値が低下する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '抵抗期では、基礎代謝が低下する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '疲はい期では、副腎皮質の機能が亢進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '疲はい期では、体温が上昇する。 33 39 午後の部 試 験 問 題試 験 時 間 98～20013 時 40 分～16 時 20 分 ◉ 指示があるまで開かないこと。 ≪注意事項≫ 1．問題の数 試験問題は 98～200 までの 103 問である。 2 ．受験地、受験番号、氏名の記入方法 注意事項を読み終わったら、まず受験地、受験番号、氏名を文字と数字で記入 する。次に答案用紙右側の受験地、受験番号の該当する をマークする（塗りつ ぶす）。なお、記入に当たっては次の例を参考のこと。 （例） 受験地・東京都、受験番号・90123、氏名・栄養花子の場合 午後 受験地受験番号受験地 北海道宮城県埼玉県東京都愛知県大阪府岡山県福岡県沖縄県 氏名受験番号 万 千 百 拾 壱 3．答案の作成', false, 5);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ＨＢの鉛筆を使用し濃くマークすること、の外にはみ出さないように注 意すること。 良い解答の例...... （濃くマークすること。） 悪い解答の例...... （解答にならない。）', false, 6);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '答えを修正した場合は、必ず「消しゴム」であとが残らないように完全に消す こと。鉛筆の色が残ったり のような消し方などをしたりした場合は、修正 したことにはならないので注意すること。', false, 7);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '答案用紙は折り曲げたりメモ等で汚したりしないよう特に注意すること。 4．解答方法 解答方法は次のとおりである。', false, 8);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '（例 1－1 ）の問題では(1)から(5)までの5つの選択肢があるので、そのうち質 問に対する答えを1つ選び、答案用紙にマークすること。なお、この質問に 2つ以上マークした場合は誤りとする。 （ 例 1－1 ） か。1つ選べ。', false, 9);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士国家試験の合格発表日', false, 10);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士国家試験の合格証書受領日', false, 11);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士免許の申請日', false, 12);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士名簿の登録日', false, 13);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士免許証の受領日 正解は「(4)」であるから答案用紙の問題番号 201 の をマークする。 201 ↓ 201 また、（例1－2 ）のような設問文の場合も、(1)から(5)までの5つの選択肢から 答えを1つ選び、答案用紙にマークすること。なお、これらの質問に2つ以上 マークした場合は誤りとする。 （ 例 1－2 ） ・・・。誤っているのはどれか。1つ選べ。', false, 14);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '（例 2 ）の問題では(1)から(4)までの4つの選択肢があるので、そのうち質問に 対する答えとして最も適切なものを1つ選び、答案用紙にマークすること。な お、（例 2 ）の質問に2つ以上マークした場合は誤りとする。 （例2） 切なのはどれか。1つ選べ。', false, 15);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '自らの幸福を追求する。', false, 16);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '人々の生活の質の向上を目指す。', false, 17);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特定の関係者との協働を重視する。', false, 18);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '管理栄養士免許取得時の知識を維持する。 正解は「(2)」であるから答案用紙の問題番号202 の をマークする。 202 ↓ 202', false, 19);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('女性の健康週間に、アルコールに起因する健康問題とその予防に関する情報を、 一般成人向けのウェブサイトで発信することになった。発信する情報と、関連する ヘルスビリーフモデルの「認知」の組合せである。最も適当なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 98)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性よりも少ない飲酒量で健康問題が生じる事実罹患性の認知', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '飲酒以外のストレス発散方法重大性の認知', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'おいしいノンアルコール飲料の種類利益の認知', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '節酒で体調が改善した女性の体験談障害の認知', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生活習慣病のリスクを高める飲酒量を超えた場合 の健康問題 自己効力感の認知', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('「趣味のスイーツ食べ歩きと SNS 発信は、フォロワーのためにもやめられない。」 と話す、高度肥満の女性タレントである。体重が増え続けていることを気にして、 栄養カウンセリングを受けることにした。計画的行動理論における、主観的規範を 高める声かけとして、最も適切なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 99)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スイーツの食べ歩きをやめよう、と思ったことはありませんか。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'やめてしまうのではなく、食べ歩きの回数を減らしてみませんか。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'あなたの健康状態を心配する、フォロワーからのコメントはありませんか。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘルシーなスイーツをたくさん紹介して、新たなフォロワー獲得につなげま せんか。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('K 中学校に勤務する栄養教諭である。養護教諭より、オンラインゲームを始めて から急に体重が増えた生徒への個別相談を依頼された。行動変容の準備性を確認す るための、生徒への質問として、最も適切なのはどれか。1つ選べ。', '269bf20c-94cd-499f-ae93-db36bbfd2aa6', 2, 39, 100)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体重が増えたことについて、ご家族から何か言われていますか。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'これまでの体重のグラフを見て、どのように思いますか。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ゲーム中に、どのようなものを飲食することが多いですか。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '時間を決めてゲームをするようにしてはどうですか。 1', false, 4);
END $$;



