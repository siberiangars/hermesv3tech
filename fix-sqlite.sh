#!/bin/bash
# Fix SQLite on network drives - enable WAL mode
DB=/root/.hermes/state.db
if [ -f "$DB" ]; then
    python3 -c "
import sqlite3
try:
    conn = sqlite3.connect('$DB')
    conn.execute('PRAGMA journal_mode=WAL')
    conn.execute('PRAGMA synchronous=NORMAL')
    conn.execute('PRAGMA busy_timeout=5000')
    conn.close()
    print('SQLite: WAL mode set')
except Exception as e:
    print(f'SQLite: {e}')
" 2>/dev/null || true
fi

# Start Hermes gateway
exec "$@"