import pandas as pd

clientes = pd.read_csv("dados_ecmme/clientes.csv")

print(clientes.head())
import pandas as pd

# Importando os arquivos
clientes = pd.read_csv("dados_ecmme/clientes.csv")
produtos = pd.read_csv("dados_ecmme/produtos.csv")
pedidos = pd.read_csv("dados_ecmme/pedidos.csv")
itens = pd.read_csv("dados_ecmme/itens_pedido.csv")

# Visualizar os primeiros registros
print("=== CLIENTES ===")
print(clientes.head())

print("\n=== PRODUTOS ===")
print(produtos.head())

print("\n=== PEDIDOS ===")
print(pedidos.head())

print("\n=== ITENS PEDIDO ===")

print(itens.head())
print(clientes.info())
print(produtos.info())
print(pedidos.info())
print(itens.info())