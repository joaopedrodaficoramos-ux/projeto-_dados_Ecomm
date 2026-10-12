# Análise de e-commerce com SQL e Python

Projeto de portfólio para explorar clientes, produtos e pedidos com consultas SQL reproduzíveis e exportação de indicadores. O objetivo é entender o perfil dos clientes e o valor das vendas por status e categoria.

## Tecnologias
Python 3.10+, SQLite e Pandas. Consultas com JOIN, SUM, COUNT, AVG, GROUP BY e filtros por status.

## Executar
Na raiz do repositório:
```bash
python -m pip install -r requirements.txt
python ecommerce.db/python/01_importar_dados.py
python ecommerce.db/python/03_analise_clientes.py
```
O importador cria `ecommerce.db/ecommerce.sqlite3` e valida chaves primárias, referências, quantidade positiva e preços não negativos. Reexecutá-lo recria o banco a partir dos mesmos CSVs, sem acumular registros. As análises são exportadas para `outputs/`.

## Estrutura
- `ecommerce.db/dados_ecmme/`: quatro CSVs de entrada, preservados.
- `ecommerce.db/consultas_sql/schema.sql`: tabelas, chaves e restrições.
- `ecommerce.db/consultas_sql/analises_vendas.sql`: consultas comentadas.
- `ecommerce.db/python/01_importar_dados.py`: criação e carga do banco.
- `ecommerce.db/python/03_analise_clientes.py`: execução e exportação das análises.

## Indicadores e regras
- Valor de cada item = quantidade × valor unitário.
- Valor bruto dos itens inclui todos os status; não representa receita recebida.
- Valor não cancelado exclui apenas `Cancelado` e inclui `Em Transporte` e `Entregue`.
- Ticket médio = valor não cancelado / número de pedidos distintos não cancelados com itens.
- A idade média e o ranking de estados consideram todos os clientes cadastrados.
- A distribuição por status e o ranking de categorias ajudam a separar carteira e pedidos entregues.

## Limitações
A origem externa dos CSVs não está documentada. Esta é uma base de estudo; não há comprovação de recebimento financeiro, custos ou margem. Os resultados não devem ser apresentados como desempenho de uma empresa real. Valores monetários usam ponto flutuante no SQLite; sistemas financeiros exigem tratamento específico de precisão.

## Resultados reproduzidos na base de estudo
- 500 clientes, 100 produtos, 2.000 pedidos e 5.070 itens.
- 1.346 pedidos não cancelados somam R$ 10.418.979,40; ticket médio de R$ 7.740,70.
- Esportes lidera o valor não cancelado por categoria, com R$ 2.642.036,53.
- 654 pedidos estão cancelados (32,7% dos pedidos); investigar os motivos de cancelamento seria uma próxima análise, pois a base não os informa.
Esses resultados descrevem a base fornecida e não representam receita recebida nem desempenho comprovado de uma empresa real.

Auditoria de duplicidades e ausentes: `python ecommerce.db/python/02_limpeza_dados.py`. As fontes CSV permanecem na pasta original; o nome `ecommerce.db` designa uma pasta, não o arquivo SQLite.
