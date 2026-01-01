const fs = require('fs');
const path = require('path');

const inputFile = path.resolve(__dirname, '../docs/past_exam_feature/extracted_text/kokushi39.txt');
const outputFile = path.resolve(__dirname, '../docs/past_exam_feature/import_39.sql');

const categoryMap = [
    { min: 1, max: 16, id: "f8c8d2ad-31c1-453e-8b00-a3c300bbea26" },
    { min: 17, max: 42, id: "09bec7da-f775-4c39-af84-db223f99e8d9" },
    { min: 43, max: 67, id: "e421604c-b58f-4a5b-a8cc-5c1d81d878d4" },
    { min: 68, max: 81, id: "0f2a5d89-8bf9-4084-a143-d19bd5ed5a42" },
    { min: 82, max: 97, id: "36a6b088-bd68-4ced-81ba-c7e26915021e" },
    { min: 98, max: 110, id: "269bf20c-94cd-499f-ae93-db36bbfd2aa6" },
    { min: 111, max: 136, id: "6474ce53-0e9c-4dea-a9fd-f5f7caeeb3ea" },
    { min: 137, max: 152, id: "f4ca171f-01a2-4e89-b873-3f888857f082" },
    { min: 153, max: 170, id: "2a4257c6-2021-4dea-84e4-490609c4751c" },
    { min: 171, max: 200, id: "0d3d707c-079c-4b81-aee7-0da4fffe5507" }
];

function getCategoryId(qNum) {
    const cat = categoryMap.find(c => qNum >= c.min && qNum <= c.max);
    return cat ? cat.id : null;
}

function escapeSql(str) {
    if (!str) return '';
    return str.replace(/'/g, "''");
}

function parse() {
    if (!fs.existsSync(inputFile)) {
        console.error("Input file not found!");
        return;
    }

    const text = fs.readFileSync(inputFile, 'utf-8');
    const lines = text.split('\n');

    let currentQ = null;
    let questions = [];
    let lastQNum = 0;

    // Regex
    // Line starting with number + space (Question start)
    // Exclude lines with "．" or "." immediately after number (Instructions)
    // Valid questions: " 1    text", "100    text"
    const qStartRegex = /^\s*(\d+)\s+(?![．.])([^(].*)/;
    const optStartRegex = /^\s*\(\d+\)\s+(.*)/;

    for (let i = 0; i < lines.length; i++) {
        let line = lines[i].trim();
        if (!line) continue;

        const qMatch = line.match(qStartRegex);
        const optMatch = line.match(optStartRegex);

        if (optMatch) {
            if (currentQ) {
                currentQ.options.push({
                    text: optMatch[1]
                });
            }
        } else if (qMatch) {
            const qNum = parseInt(qMatch[1]);

            // Sequential Check
            // We expect qNum to be largely sequential.
            // Allow start at 1.
            // Allow jump of up to 5 (in case of parsing error skipping a question).
            // Reject if <= lastQNum (duplicates/page nums) OR > lastQNum + 5 (noise like year 2025 or table values)

            let isValid = false;

            if (lastQNum === 0) {
                if (qNum === 1) isValid = true;
            } else {
                if (qNum > lastQNum && qNum <= lastQNum + 5) isValid = true;
            }

            // Special Case: "20 1" -> 201? No, scanned text "20 1" is 201 usually.
            // But here we are looking for 1..200.

            if (isValid) {
                if (currentQ) questions.push(currentQ);

                currentQ = {
                    number: qNum,
                    text: qMatch[2],
                    options: [],
                    exam_year: 39
                };
                lastQNum = qNum;
                console.log(`Found Q${qNum}`);
            } else {
                if (currentQ) {
                    currentQ.text += "\n" + line;
                }
            }
        } else {
            if (currentQ) {
                if (currentQ.options.length > 0) {
                    currentQ.options[currentQ.options.length - 1].text += " " + line;
                } else {
                    currentQ.text += "\n" + line;
                }
            }
        }
    }
    // Push last
    if (currentQ) questions.push(currentQ);

    console.log(`Parsed ${questions.length} questions.`);

    // Generate SQL
    let sql = "";

    // We need to handle IDs. Supabase can generate UUIDs if we omit ID, BUT we need ID to insert options.
    // So we should generate UUIDs in the script or use a CTE/Function.
    // Easiest is to use a PL/pgSQL block or just generate UUIDs here (if I had uuid lib).
    // Without uuid lib, I can use `gen_random_uuid()` in SQL.
    // Method:
    // DO $$
    // DECLARE q_id uuid;
    // BEGIN
    //   INSERT INTO questions (...) VALUES (...) RETURNING id INTO q_id;
    //   INSERT INTO options (question_id, ...) VALUES (q_id, ...);
    // END $$;

    const answersMap = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../docs/past_exam_feature/answers_39.json'), 'utf-8'));

    questions.forEach(q => {
        const catId = getCategoryId(q.number);
        if (!catId) return; // Skip if no category (should not happen for 1-200)

        // Cleaning text
        const cleanText = escapeSql(q.text.replace(/\s+/g, ' ').trim());
        const correctAnswer = answersMap[String(q.number)]; // 1-based index (1,2,3,4,5)

        let block = `
DO $$
DECLARE q_id uuid;
BEGIN
    INSERT INTO questions (content, category_id, difficulty, exam_year, question_number)
    VALUES ('${cleanText}', '${catId}', 2, 39, ${q.number})
    RETURNING id INTO q_id;

`;
        q.options.forEach((opt, idx) => {
            const cleanOpt = escapeSql(opt.text.replace(/\s+/g, ' ').trim());
            const isCorrect = (idx + 1) === correctAnswer;
            block += `    INSERT INTO options (question_id, content, is_correct, "order") VALUES (q_id, '${cleanOpt}', ${isCorrect}, ${idx + 1});\n`;
        });

        block += `END $$;\n\n`;
        sql += block;
    });

    fs.writeFileSync(outputFile, sql);
    console.log(`SQL written to ${outputFile}`);
}

parse();
