f = open("gerado_formas_pagamento.txt", "w")
f.write("""INSERT INTO sistema.formas_pagamento (descricao) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Boleto Bancário'),
('PayPal'),
('Pix'),
('Transferência Bancária'),
('Dinheiro'),
('Cheque'),
('Vale Refeição'),
('Vale Alimentação');""")