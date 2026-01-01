
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


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('地球温暖化に伴い、流行地域の拡大が懸念されている感染症として、最も適当な のはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 11)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '麻疹', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '風疹', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポリオ（急性灰白髄炎）', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マラリア', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'B 型肝炎 5', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('難病の患者に対する医療等に関する法律（難病法）における、難病の定義に関する 記述である。誤っているのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 12)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発病の機構が明らかでない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '治療方法が確立していない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '希少な疾病である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '致命率が高い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '長期にわたり療養を必要とする。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('わが国の社会保障制度を構成するもののうち、生活保護が該当するものとして、 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 13)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '社会保険', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '恩給', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '公的扶助', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保健医療・公衆衛生', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '社会福祉', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('市町村保健センターに関する記述である。最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 14)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '市町村は、設置しなければならない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'センター長は、原則として医師でなければならない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品衛生の監視を行う。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '住民の健康相談を担う。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域における健康危機管理の拠点となる。 6', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定健康診査・特定保健指導に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 15)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '根拠法は、健康増進法である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '75 歳以上の被保険者は、対象とならない。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '保険者は、降圧薬を服薬中の者を、特定保健指導の対象としなければならな い。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '採血は、空腹時に限定されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹囲が 90 cm で喫煙習慣がある 50 歳男性の場合、1つの追加リスクがある と動機付け支援の対象となる。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('高齢者の介護に関する記述である。最も適当なのはどれか。1つ選べ。', 'f8c8d2ad-31c1-453e-8b00-a3c300bbea26', 2, 39, 16)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '直近の国民生活基礎調査（大規模調査年）によると、要介護者となった原因と して最も多いのは、年齢にかかわらず脳卒中である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護保険制度における保険給付の財源は、全額が被保険者から徴収した保険 料である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護保険制度における予防給付サービスは、要介護者が対象である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介護老人保健施設では、医学的管理は行われない。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '地域包括支援センターの業務には、権利擁護に関する業務が含まれている。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('人体を構成する細胞に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 17)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血小板には、核が存在する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞外のナトリウムイオン濃度は、細胞内より低い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '全ての細胞は、1つの受精卵から発生する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞周期の S 期では、染色体が形成される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マクロファージは、リンパ球から分化する。 7', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('アミノ酸・たんぱく質・糖質に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 18)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アミノ酸は、両性化合物である。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の二次構造は、ジスルフィド結合により形成される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、プロテアソームにより折りたたまれる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フルクトースは、アルデヒド基をもつ。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'でんぷんは、β ─ 1,4 グリコシド結合をもつ。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('生体エネルギー源と代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 19)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'AMP は、分子内に高エネルギー結合をもつ。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ホスホエノールピルビン酸は、高エネルギー化合物である。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電子伝達系は、ミトコンドリアの外膜にある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '電子伝達系の電子受容体は、窒素分子である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脱共役たんぱく質（UCP）による熱産生は、ATP の合成を伴う。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('アミノ酸・糖質・脂質の代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 20)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 は、アミノ基転移反応の補酵素である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿素回路は、腎臓に存在する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セロトニンは、トリプトファンから合成される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖新生は、小胞体で行われる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪酸の合成は、ミトコンドリアで行われる。 8', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('酸塩基平衡に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 21)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '過換気症候群では、呼吸性アシドーシスになる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COPD では、呼吸性アルカローシスになる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大量の嘔吐では、代謝性アシドーシスになる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '原発性アルドステロン症では、代謝性アシドーシスになる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腎不全では、代謝性アシドーシスになる。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('加齢・疾患に伴う変化に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 22)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'テロメアは、細胞分裂を繰り返すと長くなる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肉芽組織は、線維芽細胞に富んでいる。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '良性腫瘍は、悪性腫瘍に比べて細胞の分化度が低い。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '上皮性の悪性腫瘍は、肉腫と呼ばれる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳死では、自発呼吸がみられる。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('臨床検査に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 23)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '動脈血ガス分析検査では、pH が測定される。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビリルビンは、血清たんぱく質である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心電図の QRS 波は、心房の興奮を反映している。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スパイロメトリは、経皮的酸素飽和度を調べる検査である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'CT（コンピューター断層撮影）は、磁気を利用する検査である。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('治療に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 24)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発熱の患者に対する解熱鎮痛薬の投与は、原因療法である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細菌性肺炎に対する抗菌薬の投与は、対症療法である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リハビリテーションは、根治療法である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '輸血療法は、血液浄化療法である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'iPS 細胞（人工多能性幹細胞）の使用は、再生医療である。 9', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('脂質代謝に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 25)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリンは、リポたんぱく質リパーゼ活性を低下させる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リポたんぱく質リパーゼの異常では、高キロミクロン血症をきたす。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '家族性高コレステロール血症は、グルコース ─ 6 ─ ホスファターゼの欠損に よって起こる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ネフローゼ症候群の診断基準では、脂質異常症が必須条件である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '著明な高コレステロール血症では、急性膵炎を起こす。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('消化器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 26)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '嚥下時には、軟口蓋が気管を塞ぐ。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '内因子は、主細胞から分泌される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胆汁は、総胆管を経て胆嚢に運ばれる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'オッディ（Oddi）括約筋が弛緩すると、胆汁が十二指腸に排出される。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大腸粘膜には、輪状ヒダがある。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('肝疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 27)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A 型肝炎は、血液感染が最も多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'B 型肝炎ウイルスは、RNA ウイルスである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝硬変では、プロトロンビン時間が短縮する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝硬変では、血中コリンエステラーゼ値が上昇する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'NASH では、肝の線維化がみられる。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('循環器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 28)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心臓血管中枢は、中脳にある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺動脈は、肺と左心房をつなぐ。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心室の収縮期では、僧帽弁は閉鎖する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '動脈は、内膜と外膜の2層からなる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副交感神経の興奮により、心拍数は増加する。 10', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('循環器疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 29)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心室細動では、心拍出量が増加する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '深部静脈血栓症では、急性肺塞栓を起こす。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '右心不全では、肺うっ血がみられる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '心不全では、血中 BNP（脳性ナトリウム利尿ペプチド）値が低下する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '重度の貧血では、低心拍出性心不全がみられる。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('腎・尿路系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 30)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '1個の腎臓には、約1万個のネフロンがある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘンレ係蹄は、遠位尿細管と集合管との間に存在する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '近位尿細管では、グルコースが再吸収される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健常成人の1日当たりの糸球体濾過量は、約 1. 5 L である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '健常成人の尿比重は、1. 100 以上に調節されている。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('A 群β溶血性連鎖球菌感染を契機とする急性糸球体腎炎に関する記述である。 最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 31)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高齢者に多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '感染後1～３日で発症する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧を引き起こす。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血清中の補体価は上昇する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '半数以上は慢性化する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('甲状腺・副甲状腺の疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 32)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バセドウ病では、血中 LDL コレステロール値が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バセドウ病では、血中甲状腺刺激ホルモン（TSH）値が上昇する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '橋本病では、基礎代謝が亢進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副甲状腺機能亢進症では、腎臓におけるカルシウム再吸収が抑制される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副甲状腺機能低下症では、テタニーが起こる。 11', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('パーキンソン病に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 33)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主な責任病巣は側頭葉である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳内のドーパミンが増加している。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'まだら認知症がみられる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '四肢の筋肉は弛緩する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '便秘をきたす。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('呼吸器系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 34)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '呼吸中枢は、大脳皮質に存在する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '気管支平滑筋は、副交感神経の興奮で弛緩する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '横隔膜は、吸気時に収縮する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '内呼吸は、肺胞で行われるガス交換である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺活量は、1回換気量と残気量の和である。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('呼吸器疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 35)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COPD に対する治療には、在宅酸素療法がある。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '気管支喘息では、発作時に気道が拡張する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肺結核に対する予防接種には、ツベルクリン反応がある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マイコプラズマ肺炎は、ウイルス性肺炎である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クリプトコッカス肺炎は、細菌性肺炎である。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('平滑筋に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 36)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '細胞は円柱形である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '横紋が観察される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '介在板が観察される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨に付着する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不随意筋である。 12', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('骨粗鬆症に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 37)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性に多い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '類骨が増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脆弱性骨折がない時の診断基準は、骨密度が若年成人平均値（YAM）の 60％ 未満である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小児に発症した骨粗鬆症をくる病という。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖質コルチコイド過剰により発症する。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('妊娠糖尿病に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 38)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '50 g 経口ブドウ糖負荷試験で診断する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '空腹時血糖値 150 mg/dL で HbA1c 6. 5％ の場合、妊娠糖尿病と診断でき る。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '妊娠 20 週以降には、耐糖能は改善する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '将来の2型糖尿病発症リスクである。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '経口血糖降下薬を使用する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液系の構造と機能に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 39)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヒトのヘモグロビンは、2本のグロビンからなる二量体である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘモグロビンと酸素の親和性は、ヘモグロビンと一酸化炭素の親和性よりも 高い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '還元ヘモグロビン濃度が上昇すると、チアノーゼが出現する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エリスロポエチンは、白血球の成熟を促す。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'プラスミンは、凝固因子である。 13', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('血液疾患に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 40)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄欠乏性貧血では、血清フェリチン値が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '再生不良性貧血では、骨髄の過形成がみられる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '溶血性貧血では、血中の網赤血球が減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血友病 A は、第IX因子の異常である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '特発性血小板減少性紫斑病（ITP）では、抗血小板抗体が認められる。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('関節リウマチに関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 41)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発症のピーク年齢は、60 歳以上である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性に多い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '滑膜の炎症が生じる。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '関節炎症状は、片側の関節に好発する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '自己抗体は、陰性である。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('感染症に関する記述である。最も適当なのはどれか。1つ選べ。', '09bec7da-f775-4c39-af84-db223f99e8d9', 2, 39, 42)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '日和見感染とは、感染しても症状が現れない場合をいう。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブドウ球菌は、グラム陰性菌である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '帯状疱疹の病原体は、単純ヘルペスウイルスである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '劇症型溶連菌感染症は、再興感染症である。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発疹チフスの病原体は、クラミジアである。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('野菜類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 43)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'なす果皮のナスニンは、カロテノイド色素である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'とうがらしの辛み成分は、イソチオシアネートである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ほうれんそうのあく成分は、ホモゲンチジン酸である。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ブロッコリー（花序・ゆで）の可食部 100 g 当たりのビタミン C 含量は、だ いこん（根・皮なし・生）より多い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'にんじん（根・皮なし・生）の可食部 100 g 当たりのカルシウム含量は、こま つな（葉・生）より多い。 14', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('きのこ類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 44)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '干ししいたけの香りの主成分は、ヌートカトンである。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'まつたけの香りの主成分は、ノナジエノールである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'きくらげは、7 ─ デヒドロコレステロールを含む。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '傘が7割程度開いた肉厚の干ししいたけを、どんこ（冬菇）という。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリュフは、コナラなどの原木で栽培される。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('肉類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 45)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'と畜後、グリコーゲンが嫌気的に分解されることで、pH が上昇する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鶏肉の0～4°C における最大死後硬直期までの時間は、牛肉より長い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'と畜後、アクトミオシンが形成されると、肉質は軟化する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '熟成中に ATP が増加することで、うま味が増す。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'メトミオグロビンにおけるヘム中の鉄イオンは、３価である。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('油脂類に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 46)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'サフラワー油は、ヒマワリの種子を原料として製造される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バターのリノール酸含量は、とうもろこし油より多い。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'えごま油のα ─ リノレン酸含量は、ごま油より多い。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カカオ脂のヨウ素価は、オリーブ油より大きい。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '米ぬか油のけん化価は、パーム油より大きい。 15', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('精白米の第一制限アミノ酸は、塩基性であり、アミノカルボニル反応が生じやす い。このアミノ酸の構造式として、最も適当なのはどれか。1つ選べ。 (1) (2) (3) (4) O O HO O OH OH OH O H ２ N OH H ２ N NH ２ NH ２ O (5) HO OH OO H ３ C 16', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 47)
    RETURNING id INTO q_id;

END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の機能性成分には、消化管内で作用する機能（消化管内）と、吸収後に標的組 織で作用する機能（標的組織）とがある。食品成分の三次機能と作用する場所の組合 せとして、最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 48)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'サーデンペプチドによる血圧の降下消化管内', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大豆イソフラボンによる骨の健康維持消化管内', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '難消化性デキストリンによる血糖値上昇の抑制標的組織', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'EPA による血中中性脂肪の減少標的組織', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'CPP（カゼインホスホペプチド）によるカルシウムの吸収促進 標的組織', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('特定保健用食品の関与成分による三次機能と作用機序の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 49)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'キシリトールの低う蝕作用再石灰化の促進', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '難消化性オリゴ糖の整腸作用 プロバイオティクスとしての作用', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中鎖脂肪酸の体脂肪低蓄積性 脂肪組織でのβ酸化関連酵素の活性化', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'キトサンの血中コレステロー ル低下作用 胆汁酸の再吸収抑制', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'γ ─ アミノ酪酸（GABA）の降 圧作用 アンジオテンシン変換酵素の阻害', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の変質に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 50)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食品中の生菌数が 10 ３ 個/g を超えると、初期腐敗と判定される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリメチルアミンは、肉類における初期腐敗の指標である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ヘテロサイクリックアミンは、非酵素的褐変により生成する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '油脂の自動酸化は、不飽和脂肪酸から水素原子が脱離することで開始する。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'K 値は、ATP 関連化合物の酵素的分解が進むと低下する。 17', false, 5);
END $$;


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


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('牛乳および牛乳加工品に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 61)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳製造におけるホモジナイズとは、カゼインミセルの大きさを均質化する ことである。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'バター製造におけるチャーニングとは、牛乳やクリームから分離した脂肪を 練り上げることである。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'チーズ製造におけるカードとは、原料乳にレンネットを加えた際に生じる凝 固物のことをいう。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アイスクリーム類の1つであるラクトアイスは、乳固形成分が 15. 0％ 以上 と規定されている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発酵乳であるヨーグルトは、主にβ ─ ラクトグロブリンが等電点沈殿したも のである。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品とその製造に利用される酵素の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 62)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水あめインベルターゼ', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カップリングシュガーカタラーゼ', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果糖ぶどう糖液糖グルコースイソメラーゼ', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食用油脂トランスグルタミナーゼ', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成型肉ペクチナーゼ', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品の保存に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 63)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '質量パーセント濃度が同一であれば、ショ糖より食塩の方が浸透圧を高める 効果が大きい。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レトルト食品の殺菌は、65°C で 30 分以上行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分活性 0. 9 以上において、ほとんどの微生物の増殖は抑制される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '無機酸の微生物増殖抑制効果は、有機酸より優れている。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'チルドとは、食品を半凍結状態で貯蔵することである。 21', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('植物性食品の加熱調理とその目的の組合せである。 最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 64)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '山菜を重曹水でゆでる。軟化の抑制', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'れんこんを酢水でゆでる。軟化の促進', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '黒豆を鉄なべで煮る。色の安定化', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'さつまいもをミョウバン入りの水でゆでる。軟化の促進', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリフラワーを酢水でゆでる。あく抜き', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('揚げ物の調理に関する記述である。最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 65)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '揚げ物に用いる油の比熱は、水の約2倍である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '150°C 程度の揚げ油では、天ぷら衣はすぐに浮き広がる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '魚介の天ぷらの揚げ油の適温は、ドーナッツよりも高い。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フライドポテトの揚げ油の適温は、200°C 程度である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポテトチップスの吸油率は、かき揚げよりも高い。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('オレンジピーマン（果実・生）可食部 100 g 当たりのビタミン A 量を表に示した。 レチノール活性当量（μgRAE）として、最も適当なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 66)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '35', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '48', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '53', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '59', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '72 表 オレンジピーマン（果実・生）可食部100g当たりのビタミンA量（μg） レチノールα ─ カロテンβ ─ カロテンβ ─ クリプトキサンチン －150420290 日本食品標準成分表 2020 年版（八訂）からの抜粋 22', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('なす 200 g から先端とへたを取り除き（廃棄率 10％）、なす重量の5％ のなたね 油を用いて油いためを作った。表は、可食部 100 g 当たりのエネルギー値および調 理による重量変化率である。この油いためのエネルギー量（kcal）として、最も適当 なのはどれか。1つ選べ。', 'e421604c-b58f-4a5b-a8cc-5c1d81d878d4', 2, 39, 67)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '100', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '105', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '112', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '131', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '180 表 可食部100g当たりのエネルギー値および調理による重量変化率 エネルギー（kcal）重量変化率（％） なす 果実 生18－ なす 果実 油いため7376 なたね油887－ 日本食品標準成分表 2020 年版（八訂）からの抜粋', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食欲の調節に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 68)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '空腹感は、出生後の食経験によって形成される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪細胞におけるトリグリセリド分解が亢進すると、満腹感が生じる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '満腹中枢は、動脈と静脈の血中グルコース濃度の差が大きいと刺激される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レプチンは、主に胃から分泌される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グレリンは、食欲を抑制する。 23', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('管腔内消化の調節に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 69)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腸相は、胃に食物が入ることによって起こる応答である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '交感神経は、消化液の分泌を促進する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '副交感神経は、消化管の運動を抑制する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ガストリンは、胃酸分泌を抑制する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コレシストキニンは、胆嚢の収縮を促進する。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養素の吸収に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 70)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フルクトースは、Na + の濃度勾配を利用して吸収される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ラクトースを構成する単糖は、SGLT1により吸収される。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アミノ酸は、H + の濃度勾配を利用して吸収される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '短鎖脂肪酸は、主にミセルを形成して吸収される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コレステロールの吸収は、胆汁酸を必要としない。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('インスリンの作用に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 71)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲を促進する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'GLUT4の細胞膜への移行を促進する。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グリコーゲンの分解を促進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '糖新生を促進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体たんぱく質の分解を促進する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('空腹時と比べたときの食後の糖質代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 72)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨格筋への血中グルコースの取り込みが抑制される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '肝臓グリコーゲンの合成が抑制される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グルコースからの脂肪酸の合成が亢進する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳酸からのグルコースの合成が亢進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アラニンからのグルコースの合成が亢進する。 24', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('空腹時と比べたときの食後の脂質代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 73)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小腸上皮細胞でキロミクロンの合成が抑制される。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢血管でリポたんぱく質リパーゼの活性が抑制される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '骨格筋でβ酸化が亢進する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳でケトン体の利用が亢進する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血中への遊離脂肪酸の放出が抑制される。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('脂肪酸および脂肪酸由来の生理活性物質に関する記述である。 誤っているのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 74)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'オレイン酸は、一価不飽和脂肪酸である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'α ─ リノレン酸は、生体内で合成されない。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'EPA は、リノール酸から合成される。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アラキドン酸は、エイコサノイドの前駆体である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'プロスタグランジンは、エイコサノイドの一種である。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('たんぱく質・アミノ酸の体内代謝に関する記述である。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 75)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が不足すると、窒素出納が正になる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が不足すると、ビタミン B 6 の必要量が増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の摂取量が増加すると、尿中尿素量が減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質を過剰に摂取すると、アミノ酸の異化が抑制される。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギー摂取量が不足すると、たんぱく質の必要量が増加する。 25', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ビタミン D の栄養学的特徴と機能に関する記述である。 誤っているのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 76)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D 2 は、7 ─ デヒドロコレステロールから合成される。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D は、水酸化されることにより活性型となる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン D は、腎臓で活性型に至る。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '活性型ビタミン D は、核内受容体と結合する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '活性型ビタミン D は、カルシウム結合たんぱく質の合成を促進する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ビタミンB群とその補酵素型の組合せである。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 77)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 ピリドキサールリン酸（PLP）', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 2 フラビンアデニンジヌクレオチド（FAD）', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 6 チアミン二リン酸（TDP）', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビオチンコエンザイム A（CoA）', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '葉酸メチルコバラミン', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ミネラルとそれを構成成分とする酵素の組合せである。 最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 78)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄セルロプラスミン', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '亜鉛キサンチンオキシダーゼ', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '銅カタラーゼ', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セレン グルタチオンペルオキシダーゼ', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'モリブデンスーパーオキシドジスムターゼ（SOD）', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('鉄の吸収と体内利用に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 79)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄の吸収は、体内鉄貯蔵量の影響を受けない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '非ヘム鉄は、Fe ３+ として吸収される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トランスフェリンは、鉄の血中輸送を行う。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '貯蔵鉄は、主にヘモグロビンとして蓄えられる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '赤血球の破壊で遊離した鉄は、再利用されない。 26', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('水の出納に関する記述である。最も適当なのはどれか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 80)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養素1g 当たりの代謝水の量は、たんぱく質より脂質が多い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分摂取量が増加すると、不可避尿量は増加する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分摂取量が不足すると、バソプレシンの分泌は減少する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '発汗では、ナトリウムの損失がない。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '不感蒸泄量は、外気温の影響を受けない。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('35 歳、女性。身長 158 cm、体重 50 kg、BMI 20. 0 kg/m 2 。基礎代謝基準値 22. 0 kcal/kg 体重/日、安静時代謝量は基礎代謝量の 1. 1 倍。5. 0 メッツの活動を 2時間行った。その2時間の総エネルギー消費量（kcal）として、最も適当なのはど れか。1つ選べ。', '0f2a5d89-8bf9-4084-a143-d19bd5ed5a42', 2, 39, 81)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '242', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '417', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '458', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '504', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '726', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('栄養アセスメントに関する記述である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 82)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '上腕筋面積は、肩甲骨下部皮下脂肪厚と上腕周囲長から求める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体脂肪率は、水中体重秤量法により推定できる。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ウエスト周囲長は、息を吸った状態で測定する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿中クレアチニン排泄量は、測定前に摂取した食事たんぱく質の影響を受け る。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生体電気インピーダンス（BIA）法は、測定前に摂取した食事の影響を受けな い。 27', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）における基本的事項に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 83)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'DG の設定で対象とした生活習慣病の1つに、COPD がある。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'DG には、エビデンスレベルが付されている。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '単糖は、AI が設定されている。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '参照体位は、性・年齢区分別の望ましい体位である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '習慣的な摂取を把握するための期間は、３日間程度とされている。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）におけるエネルギーに関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 84)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成人の身体活動レベルの算出には、二重標識水法による総エネルギー消費量 測定値が用いられた。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小児におけるエネルギー摂取量の過不足の評価は、BMI で行う。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '目標とする BMI の範囲は、40 歳と 75 歳で同じである。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '成人の推定エネルギー必要量（EER）の算定式は、安静時代謝量（kcal/日）× 身体活動レベルである。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '推定エネルギー必要量（EER）は、高齢者施設の自立した入所者には適用で きない。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）におけるビタミン・ミネラルに関する記述で ある。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 85)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン A の UL は、成人と乳児とで回避対象としている健康障害が異な る。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン E の AI は、血中のγ ─ トコフェロール濃度から算定された。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 の EAR は、たんぱく質1g 当たりの必要量から算定された。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナトリウムの DG は、24 時間尿中ナトリウム排泄量から算定された。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄の妊娠後期のEAR付加量は、妊娠初期と同じ鉄吸収率を基に算定された。 28', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020 年版）において、生活習慣病の重症化予防を目的と した量を設定した栄養素である。最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 86)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '飽和脂肪酸', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トランス脂肪酸', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナトリウム', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウム', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('妊娠期の母体の生理的変化に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 87)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '循環血液量は、減少する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '基礎代謝は、低下する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質の同化は、抑制される。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '血清総コレステロール値は、低下する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリン感受性は、低下する。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('日本人の食事摂取基準（2020年版）における授乳婦の推定エネルギー必要量 （kcal/日）の求め方である。妊娠前の推定エネルギー必要量（kcal/日）を A 、母乳 のエネルギー量（kcal/日）を B 、体重減少分のエネルギー量（kcal/日）を C とした 算出式として、最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 88)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋C', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B＋C', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'A＋B－C 29', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('新生児期・乳児期の生理的特徴に関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 89)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳児の体重に対する細胞外液量の割合は、成人と比べて低い。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '生理的体重減少は、生後1か月頃に出現する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '唾液中のアミラーゼ活性は、離乳食の開始により低下する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '吸啜反応は、頬や口唇に触れた刺激に対して、その方向に顔を向け口を開く 反射である。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '新生児の最大尿濃縮能は、成人と比べて低い。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('新生児期・乳児期の栄養ケア・マネジメントに関する記述である。 最も適当なのはどれか。1つ選べ。', '36a6b088-bd68-4ced-81ba-c7e26915021e', 2, 39, 90)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '母乳性黄疸では、母乳を中止しなければならない。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鉄欠乏性貧血は、乳児期の後期（離乳期）に起こりやすい。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '乳糖不耐症のある乳児には、母乳を与える。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'はちみつは、生後9か月から与えても良い。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食物アレルギーの発症予防のためには、離乳期における特定の食物の摂取開 始を遅らせる。', false, 5);
END $$;


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


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('診療報酬における加算および指導料と、その算定の規定に関する組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 111)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '個別栄養食事管理加算 感染対策チームに管理栄養士が参画してい る。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養サポートチーム加算 栄養治療実施計画を作成する。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '入院栄養食事指導料 入院中3回まで算定できる。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '集団栄養食事指導料 1回の指導時間は 20 分とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '早期栄養介入管理加算 回復期リハビリテーション病棟に入院中の 患者を対象とする。 6', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('臨床栄養における行為とそれに対応する用語の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 112)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者が治療に積極的に参加する。クリニカルパス', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養食事指導前に患者の氏名を確認す る。 守秘義務', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者の低栄養の重症度を判定する。リスクマネジメント', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養介入の内容を患者に説明し、同意 を得る。 インフォームド・コンセント', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '患者が医師の指示に従い治療を受け る。 ノーマリゼーション', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('骨格筋量をアセスメントするための指標である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 113)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹囲', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '下腿周囲長', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フィッシャー比', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '尿中ナトリウム排泄量', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '呼吸商', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('傷病者のエネルギー必要量に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 114)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ハリス - ベネディクト（Harris-Benedict）の式で算出された値は、推定エネ ルギー必要量である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ハリス - ベネディクト（Harris-Benedict）の式には、体表面積を用いる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脳梗塞により意識障害をきたした患者のエネルギー必要量は、基礎代謝量の 1. 5 倍とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '安静時エネルギー消費量は、間接熱量計で測定できる。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '重症熱傷患者では、NPC/N を健常時より高くする。 7', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('静脈栄養法に関する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 115)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養では、2,500 kcal/日の投与ができる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '末梢静脈栄養では、浸透圧比（血漿浸透圧との比）を5とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪は、1. 5 g/kg/時の速度で投与する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養では、糖質濃度 20％ の維持液の使用が可能である。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '中心静脈栄養は、経腸栄養に比べてバクテリアルトランスロケーションを起 こしにくい。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('77 歳、男性。身長 160 cm、体重 45 kg、BMI 17. 6 kg/m 2 。ここ1か月ほど、 ほとんど食事を摂れていなかった。3か月前の体重 55 kg。血液検査結果は、尿 素窒素 10 mg/dL、クレアチニン 0. 8 mg/dL。この患者が近医に入院し、1日当 たりエネルギー 1,500 kcal、アミノ酸 45 g、脂肪 20 g の静脈栄養が、入院初日か ら開始された。投与2日後、意識障害に陥り、K 病院に転院した。転院時の血液検 査結果として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 116)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウム値の上昇', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'マグネシウム値の上昇', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1 値の上昇', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'リン値の低下', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'インスリン値の低下', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食品が医薬品に及ぼす影響に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 117)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳は、ビスホスホネート薬の効果を減弱する。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'グレープフルーツジュースは、カルシウム拮抗薬の効果を減弱する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クロレラは、ワルファリンの効果を増強する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'セント・ジョーンズ・ワートは、テオフィリンの効果を増強する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '納豆は、スタチンの効果を増強する。 8', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('大規模災害の被災地で、数か月にわたり在宅避難している高齢者の栄養アセスメ ントを行った。その中に皮下出血や歯茎からの出血がみられる者がいた。この症状 から欠乏が疑われるビタミンとして、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 118)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン A', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 1', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン B 2', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ナイアシン', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビタミン C', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('糖尿病治療薬とその主作用に関する記述である。 誤っているのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 119)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'α-グルコシダーゼ阻害薬は、二糖類の分解を抑制する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'SGLT2阻害薬は、尿細管での糖再吸収を抑制する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ビグアナイド薬は、肝臓での糖新生を抑制する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'GLP-1受容体作動薬は、インクレチン分解を抑制する。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スルホニル尿素（SU）薬は、インスリン分泌を促進する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('高キロミクロン血症の栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 120)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '炭水化物の摂取エネルギー比率を 65％Ｅ以上とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪の摂取エネルギー比率を 15％Ｅ以下とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'n-3系多価不飽和脂肪酸の摂取を制限する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '果汁飲料の摂取を増やす。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'アルコールの摂取量の上限を 40 g/日とする。 9', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('55 歳、男性。会社員。運動習慣なし。電車通勤片道1時間。健康診断で高尿 酸血症を指摘され医療機関を受診した。医師より薬物治療を勧められたが、本人 の希望で服薬せずに食事療法を開始することになり、栄養食事指導を行った。身長 170 cm、体重 65 kg、BMI 22. 5 kg/m 2 。空腹時の血液検査値は、血糖 95 mg/dL、 HbA1c 5. 3％、尿酸 8. 2 mg/dL、LDL コレステロール 125 mg/dL、HDL コレス テロール 65 mg/dL、トリグリセリド 115 mg/dL。表は、患者から聞き取った普 段の食事内容である。優先すべき栄養食事指導の内容として、最も適切なのはどれ か。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 121)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主菜（魚、肉、卵、大豆）の量を少なくする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '卵は1日に1個までにする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜料理を追加する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '禁酒を勧める。 表 普段の食事内容 朝食昼食（弁当）夕食 ご飯（150 g）ご飯（200 g）ご飯（150 g） 納豆（40 g）卵焼き（3切れ）刺身（100 g） 鶏卵（1個）鶏唐揚げ（60 g）冷奴（200 g） 味噌汁（1杯）ウインナー（40 g）肉野菜炒め（1皿） 温野菜（80 g）焼酎（25 度）（360 mL） マヨネーズ（10 g） 10', true, 4);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('膵炎の栄養管理に関する記述である。最も適当なのはどれか。1つ選べ。 20 kcal/kg 標準体重に制限する。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 122)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性膵炎で激しい上腹部痛がある場合、成分栄養剤を用いて経腸栄養を行 う。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性膵炎患者の食事開始時は、脂質 10 g/日以下とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期では、たんぱく質を 0. 8 g/kg 標準体重/日に制限する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期では、脂溶性ビタミンの摂取を制限する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '慢性膵炎非代償期で二次性糖尿病がみられる場合、エネルギー量は', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('消化器疾患と摂取を制限すべき栄養素等の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 123)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '逆流性食道炎 炭水化物', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '胆石症 カルシウム', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質漏出性胃腸症 たんぱく質', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '潰瘍性大腸炎寛解期 水分', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'クローン病活動期 脂 肪 11', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('57歳、男性。高校教諭。狭心症の外来患者。身長176cm、体重70kg、 BMI 22. 6 kg/m 2 。血圧145/85mmHg。空腹時の血液検査値は、LDLコレステ ロール 150 mg/dL、HDL コレステロール 52 mg/dL、トリグリセリド 136 mg/dL。 この患者の1日当たりの目標栄養量を、コレステロール200mg/日未満、食塩 6. 0 g/日未満とした。これと併せて設定した、他の目標栄養量の組合せとして、最 も適当なのはどれか。1つ選べ。 エネルギー （kcal/日） 脂肪 （g/日） 飽和脂肪酸 （g/日未満） (1) 1,6004015 (2) 1,600 5520 (3) 2,000 4515 (4) 2,000 4520 (5) 2,000 6020', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 124)
    RETURNING id INTO q_id;

END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('75 歳、女性。心不全。軽度の身体活動で呼吸苦があり、状態が悪化して入院と なった。浮腫も認められ、利尿薬の投与が開始された。身長 150 cm、体重 45 kg、 BMI 20. 0 kg/m 2 。空腹時の血液検査値は、ナトリウム135mEq/L、カリウム 4. 0 mEq/L、クレアチニン 0. 6 mg/dL。かろうじて経口摂取ができている。この 患者の1日当たりの目標栄養量として、最も適切なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 125)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギーは、1,600 kcal とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、60 g とする。', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩は、3g とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '水分は、2,000 mL とする。 12', false, 4);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('45 歳、女性。会社員。CKD。身長 153 cm、体重 50 kg、BMI 21. 4 kg/m 2 。血 圧 145/92 mmHg。食塩摂取量を推定するために 24 時間蓄尿を行ったところ、尿 量 1. 0 L、尿中ナトリウム濃度 255 mEq/L であった。この患者の尿中食塩排泄量 （g/日）として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 126)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '5', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '8', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '10', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '12', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '15', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('62 歳、男性。無職。糖尿病腎症。身長 165 cm、体重 63 kg、目標体重 60 kg。血 圧 148/92 mmHg。空腹時の血液検査値は、血糖 151 mg/dL、HbA1c 8. 4％、尿 素窒素 38 mg/dL、クレアチニン 1. 3 mg/dL、eGFR 45 mL/分/1. 73 m 2 、カリウ ム 5. 7 mEq/L。尿アルブミン /クレアチニン比 350 mg/gCr。この患者の1日当た りの目標栄養量として、最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 127)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エネルギーは、2,200 kcal とする。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'たんぱく質は、30 g とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '脂肪は、20 g とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食塩は、7. 5 g とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カリウムは、1,800 mg とする。 13', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('腎疾患の病態および栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 128)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '一次性ネフローゼ症候群では、LDL コレステロール値が低下する。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性腎障害（AKI）では、血清クレアチニン値が低下する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '微小変化型ネフローゼ症候群では、たんぱく質摂取量を 0. 8 g/kg 標準体重/ 日とする。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '急性糸球体腎炎の乏尿期では、食塩を5g/日とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '腹膜透析では、食事のエネルギー量は、目標エネルギー量から、腹膜吸収ブ ドウ糖のエネルギー分を差し引いて求める。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('ステロイド薬を服用している患者に対して栄養食事指導を行うことになった。こ の患者に認められる所見である。誤っているのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 129)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '免疫力の低下', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高血圧', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲の亢進', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '高カリウム血症', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '耐糖能異常', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('神経疾患の病態、診断および栄養管理に関する記述である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 130)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食行動異常は、認知症の中核症状である。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '認知症のスクリーニングには、DESIGN-R®が用いられる。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'パーキンソン病では、嚥下障害がみられる。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'パーキンソン病では、エネルギー目標量を安静時エネルギー消費量の2倍と する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'レボドパ（L-ドーパ）は、薬の効果を高めるために、高たんぱく質食と一緒 に内服する。 14', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('14 歳、女性。神経性やせ症。BMI 16. 5 kg/m 2 。母親に伴われ外来受診した。初 回の栄養食事指導に関する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 131)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '1か月後の体重増加目標量を決める。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '体重を毎日測定するように指示する。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '過食症状の有無を確認する。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '食欲が増すように運動を推奨する。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '栄養バランスを整えるように食事内容を指導する。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('80 歳、男性。ADL 自立。身長 155 cm、体重 47 kg、BMI 19. 6 kg/m 2 。標準 体重 53 kg。握力 20 kg。サルコペニアと診断された。血液検査値は、アルブミン 3. 2 g/dL、クレアチニン 0. 6 mg/dL、尿素窒素 12 mg/dL。たんぱく尿（－）。こ の患者の1日当たりの目標栄養量の組合せとして、最も適切なのはどれか。1つ選 べ。 エネルギー （kcal/日） たんぱく質 （g/日） (1) 1,000 40 (2) 1,600 40 (3) 1,600 65 (4) 2,000 100', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 132)
    RETURNING id INTO q_id;

END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食物アレルギーと除去対象となる食品・原材料の組合せである。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 133)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '牛乳アレルギー 牛肉', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '鶏卵アレルギー 卵殻カルシウム', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '大豆アレルギー 緑豆もやし', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'カシューナッツアレルギー ピスタチオ', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '小麦アレルギー 麦芽糖 15', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('イレウスにより空腸の一部、回腸全体および回盲弁を切除し、空腸と結腸を吻合 した。残存小腸は約 100 cm であった。この患者の病態の経過および栄養管理に関 する記述である。最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 134)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第I期（術直後期）には、腸蠕動運動の亢進後に腸管麻痺が起こる。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第I期（術直後期）には、経腸栄養法とする。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第II期（回復適応期）には、下痢の回数が増加する。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第II期（回復適応期）には、経口摂取を禁忌とする。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '第III期（安定期）には、ビタミン B 12 を注射により補給する。', true, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('重度嚥下障害患者の直接訓練で用いる食品である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 135)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '麦茶', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'とろみ茶', true, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'おもゆ', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'よく潰したバナナ', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '絹ごし豆腐', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('メープルシロップ尿症の治療用ミルクで除去されているアミノ酸である。 最も適当なのはどれか。1つ選べ。', '6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea', 2, 39, 136)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'フェニルアラニン', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'トリプトファン', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'メチオニン', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ロイシン', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'スレオニン 16', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('公衆栄養活動に関する記述である。最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 137)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '傷病者の治療を目的として行う。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ソーシャルキャピタルは、公衆栄養活動のための財源である。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'コミュニティオーガニゼーションは、住民参加を通して、地域に存在する諸 問題を解決に導く過程である。', true, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'ポピュレーションアプローチでは、特定健康診査においてリスクありと判定 された個人に対して、働きかけを行う。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'エンパワメントのための公衆栄養活動は、自治体が中心となって行う。', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('平成 22（2010）年～令和元（2019）年の国民健康・栄養調査における 20 歳以上の身 体および栄養・食生活の状況に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 138)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '男性における肥満者（BMI 25 kg/m 2 以上）の割合は、減少している。', false, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '女性におけるやせの者（BMI 18. 5 kg/m 2 未満）の割合は、減少している。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '65 歳以上の高齢者における低栄養傾向の者（BMI 20 kg/m 2 以下）の割合は、 増加している。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '令和元（2019）年の食塩摂取量の平均値は、男女ともに 40～50 歳台よりも 60 歳以上で多い。', true, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '野菜摂取量の平均値は、増加している。 17', false, 5);
END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('食料需給表から算出された、わが国の食料自給率のうち、米、野菜、果実、鶏卵 の品目別自給率（重量ベース）の年次推移である（図）。鶏卵については、飼料自給率 を考慮した値である。図のａ～ｄに該当する食品の組合せとして、最も適当なのは どれか。1つ選べ。 abcd (1) 鶏卵米果実野菜 (2) 鶏卵 米野菜果実 (3) 米 鶏卵野菜果実 (4) 米 果実野菜鶏卵 (5) 米 野菜果実鶏卵 a 120 100 80 60 40 196519701975198019851990199520002005201020152020 （年） 品目別自給率（％） 20 0 b c d 図 品目別自給率（重量ベース）の推移 鶏卵の値は、飼料自給率を考慮している。 18', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 139)
    RETURNING id INTO q_id;

END $$;


DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('世界の健康・栄養問題の現状と課題に関する記述である。 最も適当なのはどれか。1つ選べ。', 'f4ca171f-01a2-4e89-b873-3f888857f082', 2, 39, 140)
    RETURNING id INTO q_id;

    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '死亡者数は、NCDs によるものが最も多い。', true, 1);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, 'COVID-19 は、NCDs に分類される。', false, 2);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '2000 年以降、低中所得国の NCDs による死亡者数は、減少傾向にある。', false, 3);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '主要先進国（G７）においては、過去 20 年で成人の肥満者の割合が減少して いる。', false, 4);
    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '日本におけるナトリウム摂取量は、北アメリカに比べて少ない。', false, 5);
END $$;


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

