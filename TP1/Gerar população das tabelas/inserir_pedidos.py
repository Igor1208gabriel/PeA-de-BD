import random
from faker import Faker

import random 
f = open("gerado_pedidos.txt", 'w')

f.write(f"INSERT INTO sistema.pedidos (cliente_id, vendedor_id, endereco_entrega_id, forma_pagamento_id, data_pedido, status) VALUES\n")
status_opcoes = ['Pendente', 'Aprovado', 'Enviado', 'Entregue', 'Cancelado']
fake = Faker()

for i in range(50):
    f.write(f"('{random.randint(1,99)}', '{random.randint(1,99)}', '{random.randint(1,99)}', '{random.randint(1,9)}', '{fake.date_this_year()}', '{random.choice(status_opcoes)}'),\n")
f.write(f"('{random.randint(1,99)}', '{random.randint(1,99)}', '{random.randint(1,99)}', '{random.randint(1,9)}', '{fake.date_this_year()}', '{random.choice(status_opcoes)}');\n")
