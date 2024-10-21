import random
from faker import Faker

import random 
f = open("gerado_itens_pedido.txt", 'w')

f.write(f"INSERT INTO sistema.itens_pedido (pedido_id, item_id, quantidade, preco_unitario) VALUES\n")
fake = Faker()

for i in range(50):
    f.write(f"({random.randint(1,49)}, {random.randint(1,49)}, {random.randint(1,1000)}, {random.randint(1,500)}),\n")
f.write(f"({random.randint(1,49)}, {random.randint(1,49)}, {random.randint(1,1000)}, {random.randint(1,500)});")


