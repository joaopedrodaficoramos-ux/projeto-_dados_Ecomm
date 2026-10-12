-- Auditoria das bases
SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT COUNT(*) AS total_produtos FROM produtos;
-- Perfil de todos os clientes cadastrados (não indica atividade)
SELECT ROUND(AVG(idade), 2) AS idade_media FROM clientes;
SELECT estado, COUNT(*) AS total_clientes
FROM clientes GROUP BY estado ORDER BY total_clientes DESC, estado;
SELECT MIN(preco) AS menor_preco, MAX(preco) AS maior_preco FROM produtos;
-- Valor bruto de todos os itens, incluindo pedidos cancelados
SELECT ROUND(SUM(quantidade * valor_unitario), 2) AS valor_bruto_itens FROM itens_pedido;
-- Carteira não cancelada; não equivale a receita recebida
SELECT ROUND(SUM(i.quantidade * i.valor_unitario), 2) AS valor_nao_cancelado,
 COUNT(DISTINCT p.id_pedido) AS total_pedidos,
 ROUND(SUM(i.quantidade * i.valor_unitario) * 1.0 /
 NULLIF(COUNT(DISTINCT p.id_pedido), 0), 2) AS ticket_medio
FROM itens_pedido i JOIN pedidos p ON p.id_pedido = i.id_pedido
WHERE p.status <> 'Cancelado';
-- Valor de pedidos entregues, separado de pedidos ainda em transporte
SELECT p.status, COUNT(DISTINCT p.id_pedido) AS total_pedidos,
 ROUND(SUM(i.quantidade * i.valor_unitario), 2) AS valor_itens
FROM pedidos p JOIN itens_pedido i ON i.id_pedido = p.id_pedido
GROUP BY p.status ORDER BY valor_itens DESC;
-- Categorias com maior valor em pedidos não cancelados
SELECT pr.categoria, ROUND(SUM(i.quantidade * i.valor_unitario), 2) AS valor_itens
FROM itens_pedido i JOIN produtos pr ON pr.id_produto = i.id_produto
JOIN pedidos p ON p.id_pedido = i.id_pedido
WHERE p.status <> 'Cancelado'
GROUP BY pr.categoria ORDER BY valor_itens DESC;
