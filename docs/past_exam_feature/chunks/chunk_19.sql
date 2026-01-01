DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液透析導入後の食事について、栄養食事指導を行った。この患者における指示 たんぱく質量と指示カリウム量の組合せである。 最も適切なのはどれか。1つ選べ。 たんぱく質 （g/日） カリウム （mg/日） (1) 351,500 (2) 70 1,500 (3) 35 2,000 (4) 70 2,000 42', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 181)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液透析導入1か月後に、2回目の栄養食事指導を行った。患者は、食事メモを 持参した（表）。患者への助言として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 182)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '朝食に、牛乳を加えましょう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '昼食の天丼は、野菜のかき揚げ丼にしましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '夕食の揚げ出し豆腐は、湯豆腐にしましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '夕食のいも料理は、1品に減らしましょう。 表 食事メモ 朝食昼食夕食 ご飯（160 g） 卵焼き（卵1/2 個） 焼きなす（なす1本） 紅白なます（小鉢1杯） りんご（1/4個） 天丼 ご飯 200 g、きす2尾 えび3本、かぼちゃ1切 こまつなと油揚げの煮びたし （小鉢1杯） ご飯（200 g） つくねの甘だれ焼き（100 g） じゃがいもの煮物（小鉢1杯） 揚げ出し豆腐（100 g) 山芋のすりおろし（小鉢1杯）', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養食事指導の際、患者から「間食を摂りたい。」と相談があった。患者に適した 間食の例として、最も適切なのはどれか。1つ選べ。 167 cm、体重 62 kg、BMI 22. 2 kg/m', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 183)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '芋かりんとう 30 g', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マシュマロ 30 g', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヨーグルト 75 g', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'きんつば 50 g （ （ 43 次の文を読み「184」、「185」、「186」に答えよ。 K 総合病院の在宅診療部に勤務する管理栄養士である。 患者は、76 歳、独居男性。脳梗塞後遺症により要支援1。嚥下機能に問題はな い。高血圧症のため通院加療を続けていた。最終通院時、血圧 112/68 mmHg、身長 2 。 1週間前に、発熱、咽頭痛が生じ、近医を受診したところ、新型コロナウイルス感 染症と診断された。自宅での薬物療法により、発熱、咽頭痛は改善された。解熱鎮痛 薬服用６日目に、心窩部痛と食欲不振が出現した。翌日になっても症状が改善しない ため、近医から当院に連絡があり、担当医が男性宅を訪問し、診療した。 口渇を訴えているものの、心窩部痛があるため市販のゼリー飲料と経口補水液のみ を摂取していた。尿検査を行ったところ、濃縮尿であった。入院加療の必要性はない と担当医が判断し、在宅で加療することとなった。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('この時点での対症療法として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 184)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '経鼻胃管栄養法', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胃瘻栄養法', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養法', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養法 44', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('担当医の指示により、在宅で3日間の対症療法を行った。バイタルサインを確認 した後に、把握すべき所見として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 185)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '認知機能', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '下腿周囲長', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ツルゴール', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '眼球結膜の黄染', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('担当医の訪問から4日目になると食欲が出てきて、患者は訪問介護員に食材の購 入依頼を行い、おかゆを少しずつ食べ始めていた。数日後に訪問看護師から「心窩 部痛はあるものの、全身状態が改善している。おかゆの他に何か食べたそうにして いる。」と連絡があった。患者が希望する副食のうち、管理栄養士が勧めるものとし て、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 186)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '麻婆豆腐', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '筑前煮', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビーフシチュー', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'とりつくね煮 45 次の文を読み「187」、「188」、「189」に答えよ。 K 診療所に勤務している管理栄養士である。 患者は、80 歳、男性。妻（75 歳）と同居。中等度認知症。糖尿病でインスリン治療 を行っており、妻が管理している。月に1回、外来受診し、医師からエネルギー 1,600 kcal/日を指示されている。 車椅子での移動で、食事は自立している。妻が用意する3食の食事はきちんと食べ ている。甘い菓子が好きで、間食を楽しみにしている。 受診時、身長 158 cm、体重 62 kg、BMI 24. 8 kg/m 2 。血圧 120/70 mmHg。 空腹時の血液検査値は、アルブミン 3. 9 g/dL、血糖 280 mg/dL、HbA1c 10. 0％、 トリグリセリド 200 mg/dL、AST 18 U/L、ALT 22 U/L、尿素窒素 10. 2 mg/dL、クレ アチニン 0. 8 mg/dL。', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('この患者の血糖コントロール目標（HbA1c 値）として、最も適切なのはどれか。 1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 187)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '6. 5％ 未満', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '6. 5～7. 5％ 未満', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '7. 0～8. 0％ 未満', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '7. 5～8. 5％ 未満', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('医師は、インスリン投与量を増量した上で、管理栄養士による栄養食事指導を指 示した。患者の食事記録は表のとおりである。患者への指導として、最も適切なの はどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 188)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '昼食と夕食のご飯は、それぞれ2単位にしましょう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜の量を増やしましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '間食は、2回から1回に減らしましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コーヒーに砂糖を入れるのはやめましょう。 46 表 自宅での食事記録 時食事 6（起床） 7朝食ロールパン 2個（60 g） 野菜サラダ（キャベツ 30 g、トマト 20 g） 茹で卵 1個 牛乳 1本（200 mL) 10間食コーヒー 1杯（砂糖大さじ1杯） 大福 1個（50 g） 12昼食ご飯（150 g） 刺身（まぐろ 60 g） 味噌汁 1杯 肉じゃが オレンジ 1/4個 15間食コーヒー 1杯（砂糖大さじ1杯） カステラ 1切れ（50 g） 18夕食ご飯（150 g） 鶏肉の照り焼き（80 g） 切干大根の煮物 湯豆腐（100 g） 21（就寝）', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('設問 188 の栄養食事指導の内容は遵守され、3か月が経過した。空腹時血糖値 140 mg/dL、HbA1c 8. 4％。栄養食事指導の際に、妻から、「血糖値が気になりま す。間食はやめさせた方が良いですか。」と相談があった。管理栄養士の助言とし て、最も適切なのはどれか。1つ選べ。 16 時頃までに、30 人の新入社員が、腹痛、下痢、嘔吐の症状を訴えた。16 時 30 分', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 189)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血糖コントロールを良好にするために、間食はやめましょう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '間食は、1週間に1度食べる曜日を決めましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '間食は、果物にしましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '間食は、今のまま食べてもらって良いです。 47 次の文を読み「190」、「191」、「192」に答えよ。 Ｋ社の社員寮に勤務する管理栄養士である。毎年 120 人程度の新入社員が、1年 間、この寮を利用している。調理従事者は5人で、シフト勤務している。3月4日、 に、施設長の判断により、食中毒の可能性があると保健所に通報した。', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('通報後、17 時 30 分に保健所の職員が寮に到着した。新入社員への夕食の調理は 完了していた。この時点で5人の調理従事者の体調に問題はなかった。症状のない 新入社員に対する夕食の対応について、保健所の職員に相談した管理栄養士の発言 である。最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 190)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '予定どおり、夕食を提供しても良いですか。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品保管庫に備蓄している災害用の食品を、提供しても良いですか。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '提携している弁当屋に弁当を注文して、夕食を提供しても良いですか。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '新入社員の皆さんに、飲食店で夕食を摂ってもらっても良いですか。', false, 4);
END $$;



