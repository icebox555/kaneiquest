import { readFileSync, writeFileSync } from 'fs';

// 外部キー依存順に定義
const TABLE_ORDER = ['app_settings', 'categories', 'questions', 'options'];
const TABLES = new Set(TABLE_ORDER);

const backup = readFileSync(
  'C:/Users/notos/kaneiquest_v1/kaneiquest/supabase/migrations/backup.sql',
  'utf-8'
);

const lines = backup.split('\n');
let table = null;
let cols = null;
// テーブルごとにバッファを分ける
const buffers = {};
for (const t of TABLE_ORDER) buffers[t] = [];

for (const rawLine of lines) {
  const line = rawLine.trimEnd();

  // COPY header
  const m = line.match(/^COPY public\.(\w+) \(([^)]+)\) FROM stdin;$/);
  if (m) {
    if (TABLES.has(m[1])) {
      table = m[1];
      cols = m[2];
    }
    continue;
  }

  // End of COPY block
  if (line === '\\.') {
    table = null;
    cols = null;
    continue;
  }

  if (!table) continue;

  // Parse tab-delimited row
  const vals = line.split('\t').map(v => {
    if (v === '\\N') return 'NULL';
    const escaped = v
      .replace(/'/g, "''")
      .replace(/\\n/g, '\n')
      .replace(/\\t/g, '\t')
      .replace(/\\\\/g, '\\');
    return `'${escaped}'`;
  });

  buffers[table].push(
    `INSERT INTO public.${table} (${cols}) VALUES (${vals.join(', ')}) ON CONFLICT DO NOTHING;`
  );
}

// 依存順に結合
const output = TABLE_ORDER.flatMap(t => buffers[t]);

writeFileSync(
  'C:/Users/notos/kaneiquest_v1/kaneiquest/supabase/migrations/data_restore.sql',
  output.join('\n') + '\n',
  'utf-8'
);

console.log(`Generated ${output.length} INSERT statements`);
for (const t of TABLE_ORDER) console.log(`  ${t}: ${buffers[t].length}`);
