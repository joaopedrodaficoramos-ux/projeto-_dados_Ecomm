"""Audita duplicidades e valores ausentes, sem alterar as fontes."""
from pathlib import Path
import pandas as pd
ROOT = Path(__file__).resolve().parents[1]
def auditar():
    for table in ('clientes', 'produtos', 'pedidos', 'itens_pedido'):
        df = pd.read_csv(ROOT / 'dados_ecmme' / f'{table}.csv', encoding='utf-8-sig')
        print(f'{table}: {len(df)} registros; {df.duplicated().sum()} linhas duplicadas')
        print(df.isna().sum().to_string())
if __name__ == '__main__':
    auditar()
