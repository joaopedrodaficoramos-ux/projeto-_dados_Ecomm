"""Cria um SQLite local a partir dos CSVs, validando chaves e valores."""
import csv
import sqlite3
import tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
DATABASE = ROOT / 'ecommerce.sqlite3'
def importar():
    with tempfile.TemporaryDirectory(dir=ROOT) as tmp:
        target = Path(tmp) / 'ecommerce.db'
        with sqlite3.connect(target) as conn:
            conn.executescript((ROOT / 'consultas_sql/schema.sql').read_text(encoding='utf-8'))
            for table in ('clientes', 'produtos', 'pedidos', 'itens_pedido'):
                with (ROOT / 'dados_ecmme' / f'{table}.csv').open(encoding='utf-8-sig', newline='') as f:
                    reader = csv.DictReader(f)
                    columns = reader.fieldnames
                    expected = [row[1] for row in conn.execute(f'PRAGMA table_info({table})')]
                    if columns != expected:
                        raise ValueError(f'Colunas inesperadas em {table}: {columns}')
                    rows = [[row[col] for col in columns] for row in reader]
                placeholders = ','.join('?' for _ in columns)
                conn.executemany(f'INSERT INTO {table} VALUES ({placeholders})', rows)
                print(f'{table}: {len(rows)} registros importados')
            if conn.execute('PRAGMA foreign_key_check').fetchall():
                raise ValueError('Referências inválidas entre tabelas')
        target.replace(DATABASE)
    print(f'Banco criado: {DATABASE}')
if __name__ == '__main__':
    importar()
