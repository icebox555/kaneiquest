DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('疾病の自然史と予防手段の適用段階に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 1)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '一次予防は、発症前期において行われる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '一次予防の例に、がん患者への就労支援がある。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '二次予防は、感受性期において行われる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '二次予防の例に、予防接種がある。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '三次予防の例に、腎不全患者への人工透析がある。', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ある地域で採取した水道水の塩化物イオンの濃度は 7.090mg/L（塩素の原子 量 : 35. 45）であった。この水道水の塩化物イオン濃度（mmol/L）として、最も適当 なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 2)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '0. 010', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '0. 020', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '0. 050', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '0. 100', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '0. 200', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('わが国の国勢調査に関する記述である。最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 3)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '３年に1回実施されている。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調査対象は、層化無作為抽出法により選定する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調査対象は、日本国内に普段住んでいる外国人を含まない。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調査項目は、「医療機関への受診の状況」を含む。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '調査結果をもとに、将来人口推計を行う。 1', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('A 地域および B 地域の年齢階級別人口と、基準集団の年齢階級別死亡率を表に 示す。A 地域の死亡数は 12,000 人、B 地域の死亡数は 12,000 人であった。標準化 死亡比は、表中の基準集団を 100 とする。A 地域と B 地域の比較に関して、この 表から読み取れる内容の記述である。最も適当なのはどれか。1つ選べ。 65 歳以上300,000400,000300', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 4)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 地域の老年人口割合は、B 地域よりも高い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 地域の粗死亡率は、B 地域よりも高い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 地域の死亡数は、期待死亡数と同じである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 地域の期待死亡数は、B 地域の期待死亡数よりも多い。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 地域の標準化死亡比は、B 地域の標準化死亡比よりも高い。 表 A地域およびB地域の年齢階級別人口、基準集団の年齢階級別死亡率 年齢階級 A 地域 人口（人） B 地域 人口（人） 基準集団 死亡率（人口1万対） 0～14 歳240,00090,0002 15～64 歳900,000500,00020 合計1,440,000990,000 2', true, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('集団 A と集団 B のスクリーニング結果を比較した（表）。集団 B の方が高い指標 として、最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 5)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '敏感度', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特異度', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '偽陽性率', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '陽性反応的中度', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '陰性反応的中度 表 集団Aと集団Bのスクリーニング結果と疾病状況 スクリーニング試験 集団 A集団 B 疾病あり（人）疾病なし（人）疾病あり（人）疾病なし（人） 陽性255025050 陰性545050450', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ある食品会社は、食品成分 A に血糖値を下げる機能があるかを確認する研究を 大学に委託し、機能性表示食品として販売することを企画した。人を対象とした研 究を実施する上で、最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 6)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '研究計画書の研究倫理審査は、この食品会社の役員会議で行われる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '委託先の大学の研究者は、研究対象者に研究内容を説明し研究参加の同意を 得る。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '研究計画は、販売しようとする食品の利潤最大化を最優先に作成する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'この委託研究に従事しない食品会社の社員は、研究の利益相反を開示する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '委託先の大学の研究者は、売り上げ状況のモニタリング調査を行う。 3', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('生活習慣（ライフスタイル）の評価と対策に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 7)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康日本 21（第二次）の最終評価において、「運動習慣者の割合の増加」は「目 標値に達した」と評価された。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康日本 21（第二次）の最終評価において、「生活習慣病のリスクを高める量 を飲酒している者の割合の減少」は「目標値に達した」と評価された。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康日本 21（第三次）では、休養・睡眠に関する指標として、具体的な睡眠 時間は設定されていない。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健康づくりのための睡眠ガイド 2023 では、高齢者の床上時間は8時間以上 にならないことが目安とされている。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブリンクマン指数は、「1日の喫煙本数」に「喫煙開始年齢」を乗じた値であ る。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('「健康づくりのための身体活動・運動ガイド 2023」に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 8)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '対象者を 18 歳未満、18～64 歳、65 歳以上で区切って、推奨事項が示されて いる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「座位行動」という概念が取り入れられた。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「高齢者」の運動として、筋力トレーニングは推奨されていない。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「高齢者」の身体活動として、強度は問わず、1日 40 分以上行うことが推奨 されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '「身体を動かす時間が少ないこども」において推奨されている身体活動の強度 は、5メッツ以上である。 4', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('歯科口腔保健および学校保健に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 9)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フッ化物の歯面塗布の主な目的は、歯周病の予防である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'シーラントの主な目的は、歯周病の予防である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖尿病は、歯周病のリスク因子である。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '直近5年間の学校保健統計調査によると、小学生におけるむし歯（う歯）の被 患率は、増加傾向である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '直近5年間の学校保健統計調査によると、中学生における被患率が最も高い のは、むし歯（う歯）である。', false, 5);
END $$;



DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('健康増進法に基づき市町村が行う、対策型がん検診に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 10)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胃がん検診の対象年齢は、60 歳以上である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '子宮頸がん検診の対象年齢は、40 歳以上である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳がん検診の検査方法として、触診が推奨されている。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大腸がん検診の検査方法として、内視鏡検査が推奨されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺がん検診の受診間隔は、1年に1回が推奨されている。', true, 5);
END $$;



