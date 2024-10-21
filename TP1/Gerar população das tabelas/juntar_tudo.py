create = open("createtables.txt", "r")
clientes = open("gerado_clientes.txt", "r")
enderecos = open("gerado_enderecos.txt", "r")
itens_pedido = open("gerado_itens_pedido.txt", "r")
itens = open("gerado_itens.txt", "r")
pedidos = open("gerado_pedidos.txt", "r")
vendedores = open("gerado_vendedores.txt", "r")
formas_pagamento = open("gerado_formas_pagamento.txt", "r")

tudo = [create, clientes, enderecos, vendedores, formas_pagamento, pedidos, itens, itens_pedido]

saida = open("gerado_tudo.sql", "w")

for i in tudo:
    saida.write(f"{str(i.read())}\n")