Análise de Dados de E-commerce com SQL

Este repositório contém uma série de consultas SQL desenvolvidas para extrair insights e indicadores-chave de desempenho (KPIs) de um banco de dados relacional voltado para o retalho/e-commerce.

## 🎯 Objetivo do Projeto
Realizar análises exploratórias, auditar a base de dados e calcular métricas de negócio fundamentais, como faturamento total, ticket médio, perfil demográfico de clientes e distribuição geográfica das vendas.

## 🗄️ Estrutura do Banco de Dados
As consultas foram construídas para interagir com as seguintes tabelas relacionais do sistema:
* clientes: Informações demográficas e de localização.
* produtos: Catálogo de produtos e preços.
* pedidos: Registos de transações e status da compra.
* itens_pedido: Detalhes granulares de cada item vendido.

## 🔍 Consultas e Indicadores Desenvolvidos
O script estruturado realiza as seguintes extrações de inteligência de dados:
1. *Auditoria de Cadastros:* Contagem total da base de clientes e do catálogo de produtos disponíveis.
2. *Perfil Demográfico:* Cálculo da média de idade dos clientes ativos.
3. *Distribuição Geográfica:* Mapeamento e ranking dos estados com maior volume de clientes (ordem decrescente).
4. *Análise de Preços:* Identificação do produto de menor valor e do produto de maior valor (Mínimo e Máximo).
5. *Faturamento Bruto:* Soma do valor financeiro total gerado nos itens de pedido.
6. *Ticket Médio de Vendas:* Cálculo avançado cruzando as tabelas de itens e pedidos (via INNER JOIN), excluindo especificamente os pedidos com status 'Cancelado', para apurar o valor médio real gasto por transação.

## 🛠️ Tecnologias e Técnicas Utilizadas
* *Linguagem:* SQL
* *Técnicas Aplicadas:* 
  * Funções de Agregação (SUM, COUNT, AVG, MIN, MAX)
  * Agrupamentos (GROUP BY)
  * Ordenação Condicional (ORDER BY DESC)
  * Cruzamento de Tabelas (INNER JOIN)
  * Filtros Lógicos (WHERE <>)
