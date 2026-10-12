"""Executa consultas e exporta resultados sem depender da pasta do terminal."""
import sqlite3
from pathlib import Path
import pandas as pd
ROOT = Path(__file__).resolve().parents[1]
def analisar():
    db = ROOT / 'ecommerce.sqlite3'
    if not db.exists():
        raise FileNotFoundError('Execute primeiro: python ecommerce.db/python/01_importar_dados.py')
    output = ROOT.parent / 'outputs'
    output.mkdir(exist_ok=True)
    queries = (ROOT / 'consultas_sql/analises_vendas.sql').read_text(encoding='utf-8')
    queries = '\n'.join(line.split('--', 1)[0] for line in queries.splitlines())
    with sqlite3.connect(db) as conn:
        for number, query in enumerate(queries.split(';'), start=1):
            if not query.strip():
                continue
            result = pd.read_sql_query(query, conn)
            print(f'\nConsulta {number}\n{result.to_string(index=False)}')
            result.to_csv(output / f'consulta_{number:02d}.csv', index=False)
if __name__ == '__main__':
    analisar()
