PRAGMA foreign_keys = ON;
CREATE TABLE clientes (
 id_cliente INTEGER PRIMARY KEY, nome TEXT NOT NULL, cidade TEXT NOT NULL,
 estado TEXT NOT NULL, idade INTEGER NOT NULL CHECK (idade >= 0)
);
CREATE TABLE produtos (
 id_produto INTEGER PRIMARY KEY, produto TEXT NOT NULL, categoria TEXT NOT NULL,
 preco REAL NOT NULL CHECK (preco >= 0)
);
CREATE TABLE pedidos (
 id_pedido INTEGER PRIMARY KEY, id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
 data_pedido TEXT NOT NULL, forma_pagamento TEXT NOT NULL, status TEXT NOT NULL
);
CREATE TABLE itens_pedido (
 id_item INTEGER PRIMARY KEY, id_pedido INTEGER NOT NULL REFERENCES pedidos(id_pedido),
 id_produto INTEGER NOT NULL REFERENCES produtos(id_produto),
 quantidade INTEGER NOT NULL CHECK (quantidade > 0),
 valor_unitario REAL NOT NULL CHECK (valor_unitario >= 0)
);
CREATE INDEX idx_pedidos_cliente ON pedidos(id_cliente);
CREATE INDEX idx_itens_pedido ON itens_pedido(id_pedido);
