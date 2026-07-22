-- CONSULTA  QUANTOS CLIENTES EXISTEM 
SELECT COUNT (*) FROM clientes
-- QUANTOS PRODUTOS EXISTEM 
SELECT COUNT(*) FROM produtos
--CONSULTA DA MEDIA DOS CLIENTES 
SELECT AVG (IDADE) FROM clientes
-- CONSULTA QUAL ESTADO TEM MAIS CLIENTES ONDEM DESCRESENTE 
SELECT estado, COUNT(*) As maior_estado 
FROM clientes
GROUP BY estado 
ORDER BY maior_estado DESC;
--CONSULTA VALOR MINIMO E VALOR MAXIMO 
SELECT MIN(preco)as vamor_minimo, MAX (preco) as vamor_maximo  from produtos
--CONSULTA FATURAMENTO GERAL BRUTO 
SELECT  SUM(valor_unitario)FROM itens_pedido 
--CONSULTA TICKET MEDIO
SELECT
SUM(itens_pedido.valor_unitario) AS total_vendas,
COUNT(DISTINCT pedidos.id_pedido) AS total_pedidos,
SUM(itens_pedido.valor_unitario)
/ COUNT(DISTINCT pedidos.id_pedido) AS ticket_medio
FROM itens_pedido
INNER JOIN pedidos
ON itens_pedido.id_pedido = pedidos.id_pedido
WHERE pedidos.status <> 'Cancelado';
