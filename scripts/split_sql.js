const fs = require('fs');
const path = require('path');

const inputFile = path.resolve(__dirname, '../docs/past_exam_feature/import_39.sql');
const outputDir = path.resolve(__dirname, '../docs/past_exam_feature/chunks');

if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
}

const content = fs.readFileSync(inputFile, 'utf-8');
// Split by "DO $$"
// But regex split might consume the delimiter.
// We can split by "\nDO $$" or just read line by line.

const blocks = content.split(/DO \$\$/);
// The first element might be empty or headers.
const chunks = [];
let currentChunk = "";
let count = 0;
const BLOCK_SIZE = 10; // 10 questions per chunk

// Re-add "DO $$" prefix
const validBlocks = blocks.filter(b => b.trim().length > 0).map(b => "DO $$" + b);

for (let i = 0; i < validBlocks.length; i++) {
    currentChunk += validBlocks[i] + "\n";
    if ((i + 1) % BLOCK_SIZE === 0) {
        chunks.push(currentChunk);
        currentChunk = "";
    }
}
if (currentChunk.trim().length > 0) {
    chunks.push(currentChunk);
}

chunks.forEach((chunk, index) => {
    const filename = path.join(outputDir, `chunk_${index + 1}.sql`);
    fs.writeFileSync(filename, chunk);
    console.log(`Created ${filename} (${chunk.length} chars)`);
});
