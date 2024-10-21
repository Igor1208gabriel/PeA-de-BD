f = open("gerado_clientes.txt", 'w')
nomes = str(open('biblioteca_nomes.txt', 'r').read()).split()


import random 

f.write(
    f"INSERT INTO sistema.clientes (nome, email, telefone) VALUES\n"
)
for i in range(100):
    nome = random.choice(nomes)
    f.write(f"('{nome}', '{nome}{i}@email.com', '{random.randint(900000000, 999999999)}'),\n")

nome = random.choice(nomes)
f.write(f"('{nome}', '{nome}@email.com', '{random.randint(900000000, 999999999)}');\n")