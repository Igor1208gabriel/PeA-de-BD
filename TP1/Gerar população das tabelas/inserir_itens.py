import random
from faker import Faker

import random 
f = open("gerado_itens.txt", 'w')

f.write(f"INSERT INTO sistema.itens (nome, descricao, preco, estoque) VALUES\n")
fake = Faker()

for i in range(50):
    f.write(f"('{fake.word().capitalize()}', '{fake.sentence()}', {random.randint(5, 500)}, {random.randint(1, 1000)}),\n")
f.write(f"('{fake.word().capitalize()}', '{fake.sentence()}', {random.randint(5, 500)}, {random.randint(1, 1000)});")

