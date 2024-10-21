#!/bin/bash
echo "Iniciando os geradores"
python3 inserir_clientes.py
python3 inserir_enderecos.py
python3 inserir_formas_pagamento.py
python3 inserir_itens_pedido.py
python3 inserir_itens.py
python3 inserir_pedidos.py
python3 inserir_vendedores.py
echo "Juntando tudo"
python3 juntar_tudo.py
echo "Deletando arquivos desnecessários"
rm gerado_clientes.txt
rm gerado_enderecos.txt
rm gerado_formas_pagamento.txt
rm gerado_itens_pedido.txt
rm gerado_itens.txt
rm gerado_pedidos.txt
rm gerado_vendedores.txt