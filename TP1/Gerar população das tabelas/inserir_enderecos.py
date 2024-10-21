f = open("gerado_enderecos.txt", 'w')
ruas = str(open('biblioteca_nomes_ruas.txt', 'r').read()).split("\n")
cidades = str(open('biblioteca_nomes_cidades.txt').read()).split('\n')

import random 

f.write(
    f"INSERT INTO sistema.enderecos (cliente_id, rua, cidade, estado, cep) VALUES\n"
)
for i in range(100):
    rua = random.choice(ruas)
    cidade = random.choice(cidades)

    f.write(f"({random.randint(1,99)}, '{rua}', '{cidade} '{random.randint(10000, 99999)}'),\n")

rua = random.choice(ruas)
cidade = random.choice(cidades)

f.write(f"({random.randint(1,99)}, '{rua}', '{cidade} '{random.randint(10000, 99999)}');\n")

