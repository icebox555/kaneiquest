DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('図1は、男児の出生時からの身長と体重の変化を、母親が母子健康手帳の乳児身 体発育曲線の図に記録したものである。図から読み取った結果を踏まえた、母親へ の管理栄養士の発言として、最も適切なのはどれか。1つ選べ。 204 537 8610 11 129', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 171)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '身長、体重ともに成長に心配があります。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '身長の伸びに心配があります。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '身長に対して、体重が少ないようです。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '身長、体重ともに順調に成長しています。 （出生時） 首すわり 寝返り はいはい つかまり立ち ：できた 図1 男児の発育の記録 体重 身長 ひとりすわり （kg） （cm） （か月） 月齢→ 1 1 2 3 4 5 6 7 8 9 10 11 12 40 45 50 55 60 65 70 75 80 ↑身長 ↑体重 34', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('図2は、男児の授乳と離乳の状況を聞き取った内容である。この内容を踏まえ た、母親への管理栄養士の助言として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 172)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '離乳食の全卵は、もう少し月齢が進んでからにしましょう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '授乳の回数が少ないので、回数を増やしましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不足しがちな栄養素を補うため、フォローアップミルクを与えましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '月齢や成長・発達の段階に応じた与え方ができています。 〇授乳と離乳について 図２ 男児の授乳と離乳の状況 起床 6:009:0012:0015:0018:0021:0024:003:00 授乳授乳 授乳 就寝離乳食 +授乳 おおよそ5回。母乳は、子どもが欲しがるときに、あげている。 母乳中心。寝る前だけミルクを180 mL。 離乳食 +授乳 授乳と食事の時間 水分補給の内容 ... 白湯・麦茶・ジュース・果汁・乳酸菌飲料・イオン飲料・その他 ( ) 離乳食の食べ方は口をもぐもぐしてから、ごっくんしているか ............... はい ・ いいえ 現在の授乳内容......母乳・ミルク・混合・フォローアップミルク・牛乳・その他（ ） 回数と量............... 離乳食を始めた月齢 （ 5 ） か月 主に与えている食品 （ おかゆ、うどん、小松菜、白身魚、全卵、鶏ささみ、豆腐、バナナ ）', true, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('今後に向けた、母親への管理栄養士の助言である。 最も適切なのはどれか。1つ選べ。 43 mg/dL、血糖 98 mg/dL、HbA1c 5. 5％。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 173)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'お子さんの成長を確認するため、身長と体重を毎日計測してはいかがでしょ うか。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不安なことがあれば、インターネットで検索してみてはいかがでしょうか。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保健センターで行う離乳後期向けの教室で、仲間づくりをしませんか。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'お母さんが心配しすぎるのは、お子さんにとってもあまり良くないですよ。 35 次の文を読み「174」、「175」に答えよ。 K 社健康保険組合の管理栄養士である。 対象者は、40 歳、男性。喫煙習慣なし。一人暮らし。昔からお酒が好きだが、体 重が増えてきたので、外食のビール1杯と家ではチューハイ1缶で我慢している。 小学生の頃に、サッカーを始め、大学まで打ち込んできた。就職してからもサッ カーを趣味として続けていたが、忙しくなり 30 歳からやめている。30 歳台から体 重が増加していたが、あまり気にしてこなかった。40 歳時の健診で、特定保健指導 の動機付け支援の対象となった。身長 178 cm、体重 90 kg、BMI 28. 4 kg/m 2 、腹囲 98. 5 cm。20 歳時の体重 72 kg。 血圧 128/82 mmHg。空腹時の血液検査値は、総コレステロール 190 mg/dL、ト リグリセリド 185 mg/dL、LDL コレステロール 110 mg/dL、HDL コレステロール 平日の食事内容は、表のとおりである。 表 対象者の平日の食事内容 朝食（コンビニで購入）間食昼食（社員食堂）夕食（外食）夜食（帰宅後） おにぎり （ツナマヨと鮭を各1個） あんパン（1個） 野菜スムージー（1パック） カフェラテ （加糖 360 mL） 唐揚げ定食 ご飯（300 g） 唐揚げ（大4個） ミックスサラダ（1皿） わかめの味噌汁（1杯） とんこつラーメン（並盛1杯） 餃子（６個） ビール（中ジョッキ1杯） チューハイ（500 mL） 冷奴（150 g） 枝豆（100 g） 36', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('初回面接で、対象者は「食事のことはよく分からないので、運動で体重を減らし たいです。サッカーを再開するために、ジョギングを始めたいと思います。」と話 した。3か月間で3kg 減らす目標を設定した。体重のセルフモニタリングに加え て、運動と食事に関するプランを提案する。ジョギングの身体活動の強度は７メッ ツである。このプランに関する助言として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 174)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ジョギングを毎日 30 分して、食事はそのままで良いですよ。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ジョギングを週4日、30 分ずつして、食事はできそうなことからやってみ ましょう。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ジョギングを週2時間して、カフェラテは無糖にしましょう。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ジョギングを週3時間して、お酒をやめましょう。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('3か月後の評価で、目標体重を達成していた。対象者は3か月間を振り返り、「体 重を測ることが大事だと分かりました。体重を測れば、増えた理由を自分で考える し、食事のことも気にするようになりました。」と話した。今後に向けた助言とし て、最も適切なのはどれか。1つ選べ。 198 mg/dL、LDL コ レ ス テ ロール 116 mg/dL、HDL コ レ ス テ ロール 48 mg/dL、', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 175)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体重管理に必要なスキルが身についたのは、すばらしいですね。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '今後、体重を測ることを、周囲の人にも勧めてくださいね。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食事にも関心を持たれるようになったので、食事内容の改善にも取り組んで みませんか。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '20 歳時の体重を目標に、さらに体重を減らせるように頑張りましょう。 37 次の文を読み「176」、「177」に答えよ。 K クリニックに勤務する管理栄養士である。 患者は、55 歳、閉経後の女性。事務職。5年前に2型糖尿病を発症し、経口血糖 降下薬を処方されている。糖尿病の合併症はない。 身長 155 cm、体重 56 kg、BMI 23. 3 kg/m 2 。標準体重 53 kg。血圧 128/85 mmHg。 空 腹 時 の 血 液 検 査 値 は、 血 糖 140 mg/dL、HbA1c7.2％、総コレステロール トリグリセリド 185 mg/dL、尿酸 5. 8 mg/dL、AST 15 U/L、ALT 16 U/L、γ GT 19 U/L、 クレアチニン 0. 59 mg/dL。 医師から、エネルギー 1,600 kcal/日を指示されている。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('薬物療法により患者の病態は安定しているが、食事に不安があるとのことで、3か 月ぶりに栄養食事指導を行うこととなった。患者から普段の食事内容を聞き取った（表 1）。患者の優先すべき栄養上の問題として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 176)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が少ない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪の摂取量が多い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '炭水化物の摂取量が多い。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩の摂取量が多い。 表1 患者の普段の食事内容 朝食昼食間食夕食 ハニーバタートースト 食パン６枚切2枚 はちみつ 15 g バター 15 g ゆでブロッコリー（50 g） カフェオレ （無糖・牛乳 60 mL） キウイフルーツ（1個） 和風たらこパスタ（1人前） トマトサラダ （トマト 50 g、たまねぎ 40 g） バナナヨーグルト バナナ1/2 本 加糖ヨーグルト 60 g ぶどうパン（2個） ミルクティー （無糖・牛乳 60 mL） ご飯（200 g） 焼き鮭（1切れ） ポテトサラダ じゃがいも 50 g きゅうり 10 g にんじん 10 g 具だくさんの味噌汁 豆腐 30 g、だいこん 30 g しめじ 20 g （ （ （ （ （ （ （ （ 38', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('さらに3か月後に栄養食事指導を行った。体重 57 kg。空腹時の血液検査値は、 血糖 138 mg/dL、HbA1c 7. 4％、LDL コレステロール 109 mg/dL、HDL コレス テロール 40 mg/dL、トリグリセリド 225 mg/dL、尿酸 6. 5 mg/dL。表2は、本 人が持参した食事メモである。患者への助言として、最も適切なのはどれか。1つ 選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 177)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '今の食事を続けましょう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主食は、今の半分量にしましょう。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果物は、1日1回にしましょう。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳・乳製品は、1日1回にしましょう。 表2 食事メモ 朝食昼食間食夕食 トースト（８枚切2枚） バター ツナサラダ ツナ、レタス、トマト ノンオイルドレッシング カフェオレ （無糖・牛乳 60 mL） バナナ（1本） わかめうどん（1人前） ほうれん草の白和え 無糖ヨーグルト（60 g） ミルクティー （無糖・牛乳 60 mL） みかん（2個） ご飯（150 g） 豚カツ、キャベツ、トマト なすときのこの炒め物 きゅうりの酢の物 りんご（1/2個） （ （ 39 次の文を読み「178」、「179」、「180」に答えよ。 K リハビリテーション病院に勤務する管理栄養士である。 患者は、67 歳、女性。夫は他界しており、娘家族と同居。健診で、高血圧症を指 摘されていた。 アテローム血栓性脳梗塞の発症後、急性期病院での治療を経て、右片麻痺に対する 運動機能リハビリテーションのために当院へ転院してきた。軽度嚥下障害があるが、 軟菜食と液体にはとろみを付けることで対応できている。 脳梗塞の発症前は、身長 156 cm、体重 63 kg、BMI 25. 9 kg/m 2 。食事は、娘が準 備しており、間食に自分で買ってきたみたらし団子をよく食べていた。 転院時は、体重 55 kg、BMI 22. 6 kg/m 2 。血圧 120/62 mmHg。血清アルブミン 値 3. 2 g/dL、eGFR 92 mL/分/1. 73 m 2 。安静時エネルギー消費量 1,100 kcal/日。', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養管理計画の作成に当たり、医師等と連携して、この患者の1日当たりの栄養 補給量を検討した。その組合せとして、最も適切なのはどれか。1つ選べ。 エネルギー （kcal/日） たんぱく質 （g/日） (1) 1,20060 (2) 1,200 80 (3) 1,700 60 (4) 1,700 80 40', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 178)
    RETURNING id INTO q_id;

END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('リハビリを開始して1週間が経過すると、運動はできているが食欲が低下し、約 700 kcal/日しか摂取できなくなった。リハビリは継続する予定であるが、食欲回 復には2週間以上要することを想定して、新たに栄養管理計画を作成することにし た。不足分を補うための栄養投与法として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 179)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '経口栄養補助食品', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '経鼻胃管栄養法', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養法', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養法', false, 4);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('その後、食欲は徐々に回復し、リハビリも順調に進んだ。1か月後、外来通院で きることが確認できたため退院となり、退院後の食事内容について栄養食事指導を 行うことになった。入院中は、日本摂食嚥下リハビリテーション学会の嚥下調整食 分類 2021 のコード4（嚥下調整食4）の基準に合わせて、食事を提供していた。患 者と家族に示す献立（料理）例として、最も適切なのはどれか。1つ選べ。', '0d3d707c-079c-4b81-aee7-0da4fffe5507', 2, 39, 180)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全粥ペーストのゼリー、湯豆腐、かぼちゃの煮物、かぶの味噌汁（とろみ付 き）、プリン', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全粥、かれい煮魚、鶏団子と里芋・人参の煮物、ふろふき大根の銀あんかけ、 バナナ', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フレンチトースト、ひき肉入りオムレツ、コーンとキャベツのマヨネーズサ ラダ、みかん入りヨーグルト', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '軟飯、蒸し鶏の甘酢あんかけ、きゅうりと春雨の酢の物、豆腐とわかめの味 噌汁、みたらし団子 41 次の文を読み「181」、「182」、「183」に答えよ。 K 透析クリニックに勤務する管理栄養士である。 患者は、68 歳、男性。15 年前から高血圧症と CKD で通院加療し、食事療法を続 けてきたが、病態が悪化してきたため当クリニックに転院し、週3回の血液透析に移 行した。 身長 165 cm、ドライウェイト 65 kg、標準体重 60 kg。尿量 300 mL/日。血圧 170/95 mmHg。透析開始前の血液検査値は、総たんぱく質 6. 8 g/dL、アルブミン 3. 3 g/dL、尿素窒素 86 mg/dL、クレアチニン 8. 6 mg/dL、ナトリウム 140 mEq/L、 カリウム 5. 2 mEq/L、リン 4. 8 mg/dL、HbA1c 5. 5％。', false, 4);
END $$;



