DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('自然毒食中毒に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 51)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'テトロドトキシンは、煮沸処理により無毒化される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリカブトによる食中毒の原因物質は、リコリンである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'じゃがいもによる食中毒の原因物質は、リナマリンである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'イヌサフランによる食中毒の原因物質は、イルジン S である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'シガテラ中毒の主症状は、ドライアイスセンセーションである。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('細菌性食中毒及びウイルス性食中毒に関する記述である。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 52)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カンピロバクターによる食中毒の潜伏期間は、12 時間程度である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腸管出血性大腸菌は、芽胞を形成する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '黄色ブドウ球菌の毒素は、煮沸処理では無毒化されない。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リステリア属菌による食中毒の主症状は、神経麻痺である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ノロウイルスは、ヒトを介した二次感染はない。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('細菌性食中毒の原因菌の学名と主な原因食品の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 53)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Campylobacter jejuni 魚介類', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Clostridium perfringens カレーライス', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Salmonella enterica serovar Enteritidis二枚貝', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Staphylococcus aureusはちみつ', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'Vibrio parahaemolyticus鶏卵 18', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品中の有害物質に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 54)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アフラトキシン M1は、主に落花生から検出される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'パツリンは、主に米から検出される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ベンゾ［a］ピレンは、主に果物から検出される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '異常プリオンは、牛の扁桃に蓄積しやすい。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セシウム 137 は、主に骨に沈着する。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品添加物に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 55)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '無毒性量は、ヒトへの試験をもとに設定される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '亜硝酸ナトリウムは、着色料として使用される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ソルビン酸カリウムは、酸化防止剤として使用される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'オルトフェニルフェノールは、防かび剤として使用される。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '甘味料は、一括名での表示が可能である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養成分とその分析方法の組合せである。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 56)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質 カールフィッシャー法', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂質原子吸光光度法', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '炭水化物ジエチルエーテルによるソックスレー抽出法', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物繊維プロスキー法', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナトリウムケルダール法', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品表示基準に基づく一般用加工食品の表示に関する記述である。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 57)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂質は、補給ができる旨の表示に関する基準値がある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不飽和脂肪酸の量は、表示が推奨されている。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩を使用していない場合は、ナトリウムの含有量にかかわらず食塩相当量 を「0」と表示できる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「甘さひかえめ」は、糖類が低減された旨の表示ではない。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大豆を原材料に含む場合は、アレルゲンとしての表示が義務づけられている。 19', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養機能食品として表示が認められているビタミンと栄養機能表示の組合せであ る。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 58)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 腸管でのカルシウムの吸収を促進し、骨の形成を助け る栄養素です。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン C 抗酸化作用により、体内の脂質を酸化から守り、細胞 の健康維持を助ける栄養素です。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D 炭水化物からのエネルギー産生と皮膚や粘膜の健康維 持を助ける栄養素です。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン E 皮膚や粘膜の健康維持を助けるとともに、抗酸化作用 を持つ栄養素です。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン K 正常な血液凝固能を維持する栄養素です。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('機能性表示食品に関する記述である。誤っているのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 59)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '授乳婦用に開発された加工食品は、対象に含まれる。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'サプリメント形状の加工食品は、対象に含まれる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '安全性および機能性の根拠に関する情報は、消費者庁のウェブサイトで確認 することができる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体調に異変を感じた際は、速やかに摂取を中止し、医師に相談する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '容器包装に、「食生活は、主食、主菜、副菜を基本に、食事のバランスを。」 と表示しなくてはならない。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の加工法に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 60)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブランチングは、紅茶製造における茶葉の発酵に用いられる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電気透析は、食塩の製造に用いられる。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '噴霧乾燥は、するめの製造に用いられる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '逆浸透は、ビール製造における酵母の除去に用いられる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水素添加は、バターの製造に用いられる。 20', false, 5);
END $$;



