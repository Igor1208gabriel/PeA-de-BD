DROP SCHEMA sistema CASCADE;

CREATE SCHEMA sistema;

CREATE TABLE sistema.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE sistema.enderecos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY(cliente_id) REFERENCES sistema.clientes(id)
);

CREATE TABLE sistema.vendedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE sistema.formas_pagamento (
    id SERIAL PRIMARY KEY, 
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE sistema.pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    data_pedido DATE NOT NULL DEFAULT CURRENT_DATE,
    endereco_entrega_id INT NOT NULL,
    forma_pagamento_id INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES sistema.clientes(id),
    FOREIGN KEY (vendedor_id) REFERENCES sistema.vendedores(id),
    FOREIGN KEY (endereco_entrega_id) REFERENCES sistema.enderecos(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES sistema.formas_pagamento(id)
);

CREATE TABLE sistema.itens (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE sistema.itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    item_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES sistema.pedidos(id),
    FOREIGN KEY (item_id) REFERENCES sistema.itens(id)
);
INSERT INTO sistema.clientes (nome, email, telefone) VALUES
('Manuela', 'Manuela0@email.com', '943710984'),
('Samuel', 'Samuel1@email.com', '903749268'),
('Louise', 'Louise2@email.com', '900747965'),
('Ana', 'Ana3@email.com', '923062214'),
('Analu', 'Analu4@email.com', '990303022'),
('Heloise', 'Heloise5@email.com', '908687441'),
('Louise', 'Louise6@email.com', '933667375'),
('Arthur', 'Arthur7@email.com', '994029011'),
('Louise', 'Louise8@email.com', '978790878'),
('Miguel', 'Miguel9@email.com', '989035317'),
('Bernardo', 'Bernardo10@email.com', '975969932'),
('Pedro', 'Pedro11@email.com', '912610199'),
('Luiza', 'Luiza12@email.com', '940227998'),
('Bella', 'Bella13@email.com', '937792519'),
('Rafael', 'Rafael14@email.com', '924519755'),
('Helena', 'Helena15@email.com', '989167920'),
('Melissa', 'Melissa16@email.com', '920482191'),
('Sophia', 'Sophia17@email.com', '927455756'),
('Oliver', 'Oliver18@email.com', '904696299'),
('Vicente', 'Vicente19@email.com', '909048419'),
('Ana', 'Ana20@email.com', '917729638'),
('Maria', 'Maria21@email.com', '965077015'),
('Henrique', 'Henrique22@email.com', '963617006'),
('Maria', 'Maria23@email.com', '976681986'),
('Maria', 'Maria24@email.com', '947137038'),
('Eduarda', 'Eduarda25@email.com', '948736939'),
('Bella', 'Bella26@email.com', '923502936'),
('Helena', 'Helena27@email.com', '968454818'),
('Pedro', 'Pedro28@email.com', '906587279'),
('Breno', 'Breno29@email.com', '930408434'),
('Mirella', 'Mirella30@email.com', '901192740'),
('Miguel', 'Miguel31@email.com', '978104384'),
('Luiza', 'Luiza32@email.com', '970606362'),
('Nicolas', 'Nicolas33@email.com', '965235365'),
('Luiza', 'Luiza34@email.com', '996178688'),
('Isabella', 'Isabella35@email.com', '926146265'),
('Maitê', 'Maitê36@email.com', '938586934'),
('Cecília', 'Cecília37@email.com', '986844499'),
('Luiz', 'Luiz38@email.com', '996296871'),
('Lucas', 'Lucas39@email.com', '951510901'),
('Maria', 'Maria40@email.com', '929667948'),
('Maria', 'Maria41@email.com', '926584109'),
('Enzo', 'Enzo42@email.com', '990435669'),
('Clarice', 'Clarice43@email.com', '915687751'),
('Laura', 'Laura44@email.com', '976050172'),
('Laura', 'Laura45@email.com', '904542805'),
('Laura', 'Laura46@email.com', '986205543'),
('Flor', 'Flor47@email.com', '929312804'),
('Maria', 'Maria48@email.com', '925642998'),
('Lavínia', 'Lavínia49@email.com', '909275511'),
('Yago', 'Yago50@email.com', '995806641'),
('Ana', 'Ana51@email.com', '973599328'),
('Lorenzo', 'Lorenzo52@email.com', '995120715'),
('Vicente', 'Vicente53@email.com', '933661711'),
('Alice', 'Alice54@email.com', '937230029'),
('Vicente', 'Vicente55@email.com', '994686564'),
('Allana', 'Allana56@email.com', '974851050'),
('Maria', 'Maria57@email.com', '918415406'),
('João', 'João58@email.com', '983284306'),
('Mathias', 'Mathias59@email.com', '972170861'),
('Vicente', 'Vicente60@email.com', '948894800'),
('Ana', 'Ana61@email.com', '980114742'),
('Beatriz', 'Beatriz62@email.com', '960413828'),
('Lucas', 'Lucas63@email.com', '996626958'),
('Maria', 'Maria64@email.com', '919976719'),
('Heitor', 'Heitor65@email.com', '972292232'),
('Arthur', 'Arthur66@email.com', '927506095'),
('Malu', 'Malu67@email.com', '986155017'),
('Pedro', 'Pedro68@email.com', '958494885'),
('Leonardo', 'Leonardo69@email.com', '924637047'),
('Lucas', 'Lucas70@email.com', '947151304'),
('Isabel', 'Isabel71@email.com', '979794951'),
('Ana', 'Ana72@email.com', '998391548'),
('Nicole', 'Nicole73@email.com', '901461786'),
('Davi', 'Davi74@email.com', '995456875'),
('Yuri', 'Yuri75@email.com', '902134226'),
('Vitor', 'Vitor76@email.com', '978503237'),
('João', 'João77@email.com', '920282604'),
('Maria', 'Maria78@email.com', '910778213'),
('Maria', 'Maria79@email.com', '900795473'),
('Helena', 'Helena80@email.com', '960391790'),
('Amanda', 'Amanda81@email.com', '947417847'),
('Bento', 'Bento82@email.com', '969380406'),
('Isabel', 'Isabel83@email.com', '957892515'),
('Lucas', 'Lucas84@email.com', '989763378'),
('Melinda', 'Melinda85@email.com', '926120797'),
('João', 'João86@email.com', '942073582'),
('Ana', 'Ana87@email.com', '968672119'),
('Nicolas', 'Nicolas88@email.com', '908965553'),
('Isaac', 'Isaac89@email.com', '913360774'),
('Ana', 'Ana90@email.com', '948969595'),
('João', 'João91@email.com', '933069878'),
('Bella', 'Bella92@email.com', '954448584'),
('José', 'José93@email.com', '914836770'),
('Miguel', 'Miguel94@email.com', '923029601'),
('Giovanna', 'Giovanna95@email.com', '939639726'),
('Augusto', 'Augusto96@email.com', '914823608'),
('Matheus', 'Matheus97@email.com', '927973209'),
('Valentina', 'Valentina98@email.com', '906614842'),
('Analu', 'Analu99@email.com', '952849149'),
('Davi', 'Davi@email.com', '902254402');

INSERT INTO sistema.enderecos (cliente_id, rua, cidade, estado, cep) VALUES
(89, 'Avenida Almirante Barroso', 'Lagoinha do Piauí', 'PI', '80559'),
(34, 'Avenida Consolação', 'Xanxerê', 'SC', '72089'),
(11, 'Avenida Oscar Niemeyer', 'Lajeado', 'TO', '50633'),
(2, 'Avenida Atlântica', 'Wall Ferraz', 'PI', '15461'),
(2, 'Avenida Juscelino Kubitschek', 'Harmonia', 'RS', '53842'),
(81, 'Avenida República do Chile', 'Fortaleza', 'CE', '93892'),
(45, 'Avenida Atlântica', 'Horizonte', 'CE', '50623'),
(63, 'Rua Ceará', 'Imperatriz', 'MA', '54104'),
(18, 'Avenida Rui Barbosa', 'Salvador', 'BA', '52304'),
(20, 'Rua Rio Grande do Norte', 'Monte Alegre do Sul', 'SP', '63375'),
(8, 'Avenida Rui Barbosa', 'Teixeira de Freitas', 'BA', '16077'),
(14, 'Avenida Presidente Castelo Branco', 'Jardim de Piranhas', 'RN', '80624'),
(24, 'Avenida Rio Branco', 'Pedra Bonita', 'MG', '83996'),
(77, 'Avenida Oscar Niemeyer', 'Novo Triunfo', 'BA', '86440'),
(8, 'Avenida Atlântica', 'Brumado', 'BA', '98747'),
(22, 'Rua Pará', 'Rochedo de Minas', 'MG', '35378'),
(90, 'Rua Pernambuco', 'Verdejante', 'PE', '80568'),
(60, 'Rua Rio Grande do Norte', 'Entre Rios', 'BA', '17453'),
(41, 'Rua Ceará', 'Mossoró', 'RN', '80770'),
(18, 'Avenida Rui Barbosa', 'Oliveira dos Brejinhos', 'BA', '20798'),
(59, 'Rua Rio Grande do Norte', 'Gramado', 'RS', '39284'),
(80, 'Rua Sergipe', 'Xambrê', 'PR', '94846'),
(15, 'Rua Mato Grosso', 'Umburanas', 'BA', '79754'),
(59, 'Avenida Rio Branco', 'Joinville', 'SC', '65288'),
(2, 'Avenida Brasil', 'Urutaí', 'GO', '45464'),
(87, 'Avenida Nossa Senhora de Fátima', 'Ouro Preto do Oeste', 'RO', '19804'),
(90, 'Avenida 7 de Setembro', 'Espírito Santo', 'RN', '97656'),
(45, 'Rua Rio Grande do Sul', 'Conceição do Coité', 'BA', '98429'),
(61, 'Avenida Barão de Itapura', 'Wanderley', 'BA', '56016'),
(1, 'Rua Pará', 'Olímpia', 'SP', '59655'),
(14, 'Rua Goiás', 'Lajeado', 'TO', '16057'),
(48, 'Rua Paraíba', 'Conceição do Coité', 'BA', '20232'),
(11, 'Avenida Atlântica', 'Salvador', 'BA', '16864'),
(22, 'Avenida Presidente Vargas', 'Olímpia', 'SP', '11417'),
(46, 'Avenida Consolação', 'Campina Grande', 'PB', '70969'),
(53, 'Rua Paraíba', 'Rochedo de Minas', 'MG', '89199'),
(95, 'Avenida Juscelino Kubitschek', 'Montenegro', 'RS', '33702'),
(38, 'Avenida Oscar Niemeyer', 'Tabaporã', 'MT', '59275'),
(67, 'Rua Rio Grande do Sul', 'Entre Rios', 'BA', '47601'),
(82, 'Avenida Consolação', 'Teresópolis', 'RJ', '36477'),
(94, 'Rua 25 de Março', 'Balneário Camboriú', 'SC', '23038'),
(93, 'Rua Mato Grosso', 'São Paulo', 'SP', '53433'),
(6, 'Avenida Juscelino Kubitschek', 'Xangri-lá', 'RS', '19414'),
(73, 'Avenida Oscar Niemeyer', 'Kaloré', 'PR', '74388'),
(71, 'Avenida Rui Barbosa', 'Pedra Bonita', 'MG', '49704'),
(84, 'Avenida Rui Barbosa', 'Goiana', 'PE', '92181'),
(66, 'Rua Pará', 'Quatro Pontes', 'PR', '34457'),
(25, 'Rua Rio Grande do Norte', 'Ouro Preto do Oeste', 'RO', '46224'),
(6, 'Avenida Barão de Itapura', 'Kaloré', 'PR', '23503'),
(51, 'Avenida Oscar Niemeyer', 'Teresópolis', 'RJ', '91958'),
(92, 'Avenida Nossa Senhora de Fátima', 'Farroupilha', 'RS', '87397'),
(45, 'Avenida Presidente Vargas', 'Oliveira dos Brejinhos', 'BA', '33839'),
(42, 'Avenida Rui Barbosa', 'Dourados', 'MS', '77307'),
(12, 'Avenida Presidente Castelo Branco', 'Juazeiro', 'BA', '50699'),
(72, 'Avenida República do Chile', 'Espírito Santo', 'RN', '52782'),
(34, 'Rua Rio Grande do Norte', 'Vale do Paraíso', 'RO', '24374'),
(35, 'Avenida Juscelino Kubitschek', 'Iraí de Minas', 'MG', '72278'),
(15, 'Rua Pará', 'Alagoinha', 'PB', '63536'),
(84, 'Rua Rio Grande do Norte', 'Rio das Pedras', 'SP', '43469'),
(2, 'Avenida Dom Pedro II', 'Ipanema', 'MG', '50027'),
(41, 'Avenida Juscelino Kubitschek', 'Xexéu', 'PE', '87635'),
(72, 'Rua Pará', 'Nazaré', 'TO', '87210'),
(52, 'Rua Mato Grosso', 'Xambioá', 'TO', '91054'),
(66, 'Avenida Consolação', 'Angra dos Reis', 'RJ', '35171'),
(16, 'Rua Sergipe', 'Zortéa', 'SC', '61069'),
(63, 'Avenida Barão de Itapura', 'Exu', 'PE', '18940'),
(83, 'Rua Goiás', 'Gameleira', 'PE', '52580'),
(29, 'Rua Paraíba', 'Farroupilha', 'RS', '86590'),
(56, 'Avenida Atlântica', 'Vila Pavão', 'ES', '47112'),
(99, 'Rua Paraíba', 'Ponta Porã', 'MS', '37055'),
(97, 'Rua Rio Grande do Sul', 'Gramado', 'RS', '57425'),
(17, 'Avenida Atlântica', ' Divisópolis', 'MG', '68752'),
(84, 'Rua Sergipe', 'Juazeiro', 'BA', '28019'),
(89, 'Avenida Oscar Niemeyer', 'Quixeramobim', 'CE', '30659'),
(41, 'Avenida República do Chile', 'Olímpia', 'SP', '11822'),
(49, 'Rua Sergipe', 'Wall Ferraz', 'PI', '43654'),
(65, 'Avenida Atlântica', 'Salesópolis', 'SP', '40022'),
(78, 'Avenida Rui Barbosa', 'Tabaporã', 'MT', '20554'),
(41, 'Avenida Almirante Barroso', 'Frei Paulo', 'SE', '37320'),
(9, 'Avenida Consolação', 'União da Vitória', 'PR', '99104'),
(21, 'Avenida Rui Barbosa', 'Bonito', 'MS', '37527'),
(52, 'Avenida Marechal Floriano', 'Quinta do Sol', 'PR', '33113'),
(91, 'Rua Sergipe', 'Nossa Senhora de Lourdes', 'SE', '97201'),
(95, 'Rua Rio de Janeiro', 'Novo Oriente de Minas', 'MG', '10730'),
(24, 'Avenida Brigadeiro Faria Lima', 'Remanso', 'BA', '13815'),
(22, 'Rua Goiás', 'Queluz', 'SP', '56387'),
(40, 'Avenida Presidente Castelo Branco', 'Xambioá', 'TO', '96847'),
(61, 'Rua Pará', 'Pedra Bonita', 'MG', '21543'),
(17, 'Avenida Barão de Itapura', 'Nossa Senhora de Lourdes', 'SE', '92821'),
(13, 'Rua Amazonas', 'Montenegro', 'RS', '97331'),
(3, 'Rua Rio Grande do Sul', 'Xangri-lá', 'RS', '98862'),
(64, 'Rua Sergipe', 'Wenceslau Braz', 'MG', '89844'),
(21, 'Avenida Presidente Vargas', 'Nazaré', 'TO', '12541'),
(93, 'Avenida Barão de Itapura', 'Mossoró', 'RN', '12890'),
(15, 'Avenida Getúlio Vargas', 'Salesópolis', 'SP', '97676'),
(36, 'Avenida Consolação', 'Xexéu', 'PE', '32042'),
(2, 'Avenida Consolação', 'Rio das Pedras', 'SP', '33775'),
(27, 'Avenida Presidente Castelo Branco', 'Fortaleza', 'CE', '72194'),
(15, 'Rua Sergipe', 'Uruguaiana', 'RS', '59202'),
(24, 'Rua Ceará', 'Vila Pavão', 'ES', '78095'),
(88, 'Avenida Oscar Niemeyer', 'Xanxerê', 'SC', '52923');

INSERT INTO sistema.vendedores (nome, email, telefone) VALUES
('Ayla', 'Ayla0@email.com', '980489495'),
('Laura', 'Laura1@email.com', '938456419'),
('Catarina', 'Catarina2@email.com', '940250437'),
('Gabrielly', 'Gabrielly3@email.com', '926418468'),
('Matheus', 'Matheus4@email.com', '920101706'),
('Nicole', 'Nicole5@email.com', '989358400'),
('Ana', 'Ana6@email.com', '900139899'),
('Maria', 'Maria7@email.com', '955036695'),
('Breno', 'Breno8@email.com', '969590399'),
('Sophia', 'Sophia9@email.com', '978806210'),
('Beatriz', 'Beatriz10@email.com', '951961121'),
('Joaquim', 'Joaquim11@email.com', '940446211'),
('Analu', 'Analu12@email.com', '913631940'),
('Esther', 'Esther13@email.com', '901720282'),
('Hugo', 'Hugo14@email.com', '935227930'),
('Martin', 'Martin15@email.com', '907418035'),
('Yan', 'Yan16@email.com', '933803861'),
('Emanuel', 'Emanuel17@email.com', '946412401'),
('Maria', 'Maria18@email.com', '999102949'),
('Levi', 'Levi19@email.com', '998223604'),
('Gabriel', 'Gabriel20@email.com', '997916315'),
('Guilherme', 'Guilherme21@email.com', '922621186'),
('Leonardo', 'Leonardo22@email.com', '952525596'),
('Bianca', 'Bianca23@email.com', '983868329'),
('Bianca', 'Bianca24@email.com', '979750303'),
('Vitória', 'Vitória25@email.com', '900166372'),
('Maria', 'Maria26@email.com', '913368144'),
('Ryan', 'Ryan27@email.com', '966962232'),
('Ana', 'Ana28@email.com', '999933882'),
('Ana', 'Ana29@email.com', '953418621'),
('Lucas', 'Lucas30@email.com', '929100229'),
('Larissa', 'Larissa31@email.com', '948382969'),
('Helena', 'Helena32@email.com', '930995008'),
('Júlia', 'Júlia33@email.com', '987632338'),
('Maria', 'Maria34@email.com', '920691130'),
('João', 'João35@email.com', '929782747'),
('Yago', 'Yago36@email.com', '915305718'),
('Theodoro', 'Theodoro37@email.com', '955265880'),
('Rafael', 'Rafael38@email.com', '945948427'),
('Henrique', 'Henrique39@email.com', '917125436'),
('Maria', 'Maria40@email.com', '947156342'),
('Yuri', 'Yuri41@email.com', '970977364'),
('Heloísa', 'Heloísa42@email.com', '938016790'),
('Lara', 'Lara43@email.com', '958005136'),
('Valentina', 'Valentina44@email.com', '993992773'),
('Noah', 'Noah45@email.com', '909566634'),
('Ana', 'Ana46@email.com', '907995802'),
('Lorenzo', 'Lorenzo47@email.com', '924659229'),
('Aurora', 'Aurora48@email.com', '917723405'),
('Lucas', 'Lucas49@email.com', '934216688'),
('Kauê', 'Kauê50@email.com', '923269428'),
('Emanuel', 'Emanuel51@email.com', '933307084'),
('Alice', 'Alice52@email.com', '926711318'),
('Cecília', 'Cecília53@email.com', '905370197'),
('Yan', 'Yan54@email.com', '911705073'),
('Henrique', 'Henrique55@email.com', '987850280'),
('João', 'João56@email.com', '901133309'),
('João', 'João57@email.com', '953766797'),
('Maria', 'Maria58@email.com', '938451580'),
('Vitória', 'Vitória59@email.com', '930464554'),
('Lucca', 'Lucca60@email.com', '922930167'),
('Gabriel', 'Gabriel61@email.com', '943971359'),
('Gustavo', 'Gustavo62@email.com', '957168821'),
('João', 'João63@email.com', '989780790'),
('Ryan', 'Ryan64@email.com', '955371680'),
('Micael', 'Micael65@email.com', '939912145'),
('Maria', 'Maria66@email.com', '955581301'),
('Lorena', 'Lorena67@email.com', '913703354'),
('Emilly', 'Emilly68@email.com', '901390053'),
('Antonella', 'Antonella69@email.com', '911953507'),
('Miguel', 'Miguel70@email.com', '980352094'),
('Théo', 'Théo71@email.com', '935899050'),
('Júlia', 'Júlia72@email.com', '996949743'),
('Yan', 'Yan73@email.com', '902340365'),
('Rebeca', 'Rebeca74@email.com', '949919807'),
('Bento', 'Bento75@email.com', '951647140'),
('Flor', 'Flor76@email.com', '930583643'),
('Manuela', 'Manuela77@email.com', '952691817'),
('Maria', 'Maria78@email.com', '913367068'),
('Alice', 'Alice79@email.com', '903399093'),
('Anthony', 'Anthony80@email.com', '987040725'),
('Valentim', 'Valentim81@email.com', '918783960'),
('Enrico', 'Enrico82@email.com', '989914221'),
('Rebeca', 'Rebeca83@email.com', '943726464'),
('Ana', 'Ana84@email.com', '976640297'),
('Vitória', 'Vitória85@email.com', '933685804'),
('Luiz.', 'Luiz.86@email.com', '934545994'),
('Arthur', 'Arthur87@email.com', '936882948'),
('Pérola.', 'Pérola.88@email.com', '939566979'),
('Vitória', 'Vitória89@email.com', '939163872'),
('Henrique', 'Henrique90@email.com', '983375329'),
('Isis', 'Isis91@email.com', '924852076'),
('Ana', 'Ana92@email.com', '901360254'),
('Nicole', 'Nicole93@email.com', '932096051'),
('Luna', 'Luna94@email.com', '931836412'),
('Lívia', 'Lívia95@email.com', '908464964'),
('Gabriel', 'Gabriel96@email.com', '988033110'),
('Gael', 'Gael97@email.com', '980033466'),
('Derick', 'Derick98@email.com', '907575883'),
('Pérola.', 'Pérola.99@email.com', '932181677'),
('Cecília', 'Cecília@email.com', '921956428');

INSERT INTO sistema.formas_pagamento (descricao) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Boleto Bancário'),
('PayPal'),
('Pix'),
('Transferência Bancária'),
('Dinheiro'),
('Cheque'),
('Vale Refeição'),
('Vale Alimentação');
INSERT INTO sistema.pedidos (cliente_id, vendedor_id, endereco_entrega_id, forma_pagamento_id, data_pedido, status) VALUES
('97', '68', '42', '8', '2024-09-20', 'Cancelado'),
('54', '67', '58', '7', '2024-04-08', 'Enviado'),
('8', '93', '81', '7', '2024-03-02', 'Enviado'),
('8', '51', '52', '2', '2024-10-08', 'Enviado'),
('71', '6', '28', '2', '2024-07-09', 'Cancelado'),
('73', '55', '58', '9', '2024-10-03', 'Aprovado'),
('43', '93', '61', '8', '2024-02-09', 'Entregue'),
('37', '3', '1', '9', '2024-04-30', 'Cancelado'),
('12', '45', '52', '6', '2024-02-01', 'Enviado'),
('40', '87', '91', '3', '2024-09-05', 'Enviado'),
('16', '72', '95', '7', '2024-09-04', 'Aprovado'),
('47', '38', '73', '2', '2024-03-28', 'Cancelado'),
('75', '10', '17', '9', '2024-06-09', 'Cancelado'),
('29', '14', '32', '8', '2024-03-10', 'Pendente'),
('13', '55', '70', '5', '2024-05-12', 'Entregue'),
('13', '33', '25', '5', '2024-03-11', 'Aprovado'),
('16', '62', '66', '7', '2024-06-16', 'Cancelado'),
('32', '74', '33', '6', '2024-09-06', 'Aprovado'),
('44', '9', '90', '1', '2024-01-26', 'Cancelado'),
('50', '94', '52', '4', '2024-05-05', 'Enviado'),
('44', '2', '17', '6', '2024-09-22', 'Cancelado'),
('56', '76', '92', '9', '2024-05-02', 'Aprovado'),
('87', '35', '30', '5', '2024-10-10', 'Cancelado'),
('45', '52', '43', '6', '2024-03-30', 'Entregue'),
('95', '20', '81', '9', '2024-08-19', 'Aprovado'),
('22', '2', '3', '5', '2024-05-03', 'Pendente'),
('86', '18', '72', '7', '2024-10-12', 'Enviado'),
('14', '9', '59', '9', '2024-06-29', 'Entregue'),
('72', '44', '61', '4', '2024-03-19', 'Cancelado'),
('53', '13', '97', '6', '2024-06-29', 'Cancelado'),
('1', '11', '35', '4', '2024-07-17', 'Pendente'),
('31', '4', '85', '7', '2024-05-21', 'Pendente'),
('96', '44', '23', '1', '2024-07-15', 'Aprovado'),
('85', '18', '58', '8', '2024-05-30', 'Cancelado'),
('68', '2', '2', '5', '2024-07-13', 'Pendente'),
('94', '33', '39', '3', '2024-09-21', 'Entregue'),
('99', '39', '41', '7', '2024-08-24', 'Enviado'),
('54', '35', '59', '5', '2024-08-15', 'Aprovado'),
('69', '14', '53', '2', '2024-05-05', 'Entregue'),
('14', '76', '84', '5', '2024-09-12', 'Enviado'),
('86', '42', '74', '1', '2024-09-20', 'Cancelado'),
('48', '5', '71', '5', '2024-02-02', 'Cancelado'),
('19', '90', '62', '8', '2024-03-07', 'Aprovado'),
('55', '41', '47', '1', '2024-08-06', 'Cancelado'),
('66', '48', '92', '2', '2024-08-14', 'Aprovado'),
('67', '9', '52', '6', '2024-07-09', 'Pendente'),
('59', '97', '48', '6', '2024-08-24', 'Aprovado'),
('79', '77', '20', '3', '2024-01-25', 'Enviado'),
('98', '14', '54', '3', '2024-04-02', 'Cancelado'),
('42', '29', '39', '2', '2024-03-08', 'Enviado'),
('12', '89', '20', '3', '2024-04-16', 'Aprovado');

INSERT INTO sistema.itens (nome, descricao, preco, estoque) VALUES
('Occur', 'Perform ago morning soon board number any.', 86, 250),
('Less', 'Apply science lose she every bag without.', 63, 704),
('Once', 'Social over change off.', 61, 335),
('Poor', 'Life however make make of more.', 441, 734),
('Such', 'Chance upon find wide.', 258, 983),
('World', 'Bag water see development character.', 377, 905),
('Heavy', 'Member less decision within.', 59, 792),
('Unit', 'Consider girl card middle.', 218, 225),
('Until', 'Table chance amount arm.', 287, 82),
('Western', 'Near name if different.', 253, 877),
('Where', 'Personal increase so system source others.', 330, 311),
('Success', 'Child detail herself cut close audience.', 63, 505),
('Record', 'Pattern apply this walk wish medical oil.', 464, 116),
('Fight', 'Charge among small especially side lot pressure truth.', 492, 131),
('Inside', 'Power dream fine small pass.', 299, 270),
('Boy', 'Least green town operation.', 230, 6),
('Force', 'Or tell thousand.', 466, 790),
('Help', 'Hold green scientist wife rate.', 360, 584),
('Wish', 'Several save present condition.', 342, 793),
('Trouble', 'Shoulder group number behavior possible remember lot spend.', 200, 568),
('Card', 'Hour community indeed service blue thus.', 424, 669),
('Animal', 'Interesting particular position travel even.', 56, 246),
('Public', 'Paper fund trouble church.', 132, 836),
('Box', 'Let agent positive painting near.', 45, 543),
('Career', 'Miss like in manage stuff enough.', 221, 726),
('Dog', 'Treatment forget knowledge popular order.', 144, 284),
('Save', 'Piece hospital share simply lose home.', 75, 577),
('Stand', 'Fact father standard ahead.', 376, 575),
('She', 'Walk television practice issue pay.', 76, 385),
('Those', 'Painting mother position feel air relationship.', 86, 155),
('Continue', 'Maybe least account politics.', 184, 231),
('Letter', 'Seem other fast appear once collection support.', 473, 646),
('Good', 'Keep should account owner.', 189, 754),
('Tonight', 'Hospital become Democrat possible.', 456, 456),
('Behavior', 'When stop personal ever ago government.', 249, 525),
('Trade', 'Claim speak leave weight several.', 273, 956),
('Well', 'Television choose prevent something name employee hospital.', 232, 814),
('Hot', 'Particularly catch recognize.', 306, 378),
('Power', 'Team foreign hand herself.', 32, 818),
('Her', 'Gun start back result member site operation provide.', 443, 544),
('You', 'Gun if task know.', 70, 830),
('Order', 'For see not born road we.', 427, 898),
('Now', 'Price serve sound moment century could nation citizen.', 109, 367),
('Why', 'Through down while.', 484, 736),
('Raise', 'Effort kitchen sing firm mission base.', 342, 132),
('Design', 'Ahead open to beautiful group face.', 457, 405),
('Performance', 'Possible much son check.', 66, 10),
('Capital', 'Evidence to so art.', 264, 937),
('Wear', 'Friend send newspaper avoid purpose trouble animal.', 483, 400),
('Concern', 'Cultural most hot ask represent national specific.', 294, 513),
('Take', 'Color factor science artist form.', 197, 736);
INSERT INTO sistema.itens_pedido (pedido_id, item_id, quantidade, preco_unitario) VALUES
(1, 25, 302, 73),
(31, 48, 490, 357),
(5, 35, 900, 369),
(23, 16, 820, 107),
(17, 9, 45, 425),
(9, 46, 238, 271),
(16, 28, 158, 96),
(5, 10, 627, 78),
(21, 13, 709, 404),
(40, 7, 894, 192),
(28, 49, 523, 312),
(6, 43, 584, 484),
(5, 43, 510, 43),
(16, 15, 191, 145),
(11, 7, 851, 84),
(39, 38, 308, 146),
(47, 25, 630, 35),
(10, 26, 442, 336),
(20, 42, 473, 29),
(4, 46, 627, 491),
(8, 47, 332, 188),
(41, 47, 244, 173),
(23, 6, 465, 308),
(38, 31, 35, 34),
(19, 47, 371, 462),
(35, 43, 83, 208),
(7, 2, 566, 294),
(29, 1, 214, 202),
(46, 7, 528, 107),
(37, 33, 1, 162),
(24, 13, 17, 336),
(38, 30, 956, 90),
(24, 37, 170, 62),
(40, 18, 541, 339),
(31, 26, 517, 315),
(14, 13, 421, 352),
(28, 2, 794, 417),
(20, 9, 278, 65),
(2, 3, 422, 498),
(5, 6, 153, 124),
(44, 10, 619, 166),
(36, 1, 842, 493),
(41, 33, 4, 326),
(19, 49, 890, 393),
(45, 33, 299, 496),
(16, 22, 1000, 185),
(46, 35, 402, 23),
(41, 21, 955, 371),
(38, 30, 488, 308),
(22, 19, 355, 139),
(42, 46, 106, 362);
