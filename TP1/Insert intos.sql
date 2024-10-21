BEGIN;  -- Iniciando uma transação

-- Inserindo dados na tabela clientes
INSERT INTO sistema.clientes (nome, email, telefone) VALUES
('João Silva', 'joao.silva@example.com', '123456789'),
('Maria Oliveira', 'maria.oliveira@example.com', '987654321'),
('Carlos Souza', 'carlos.souza@example.com', '456789123'),
('Ana Lima', 'ana.lima@example.com', '789123456'),
('Pedro Santos', 'pedro.santos@example.com', '321654987'),
('Paula Costa', 'paula.costa@example.com', '654987321'),
('Lucas Almeida', 'lucas.almeida@example.com', '159753486'),
('Fernanda Ribeiro', 'fernanda.ribeiro@example.com', '753159486'),
('Rafael Martins', 'rafael.martins@example.com', '951753486'),
('Juliana Ferreira', 'juliana.ferreira@example.com', '357951486');

-- Inserindo dados na tabela enderecos
INSERT INTO sistema.enderecos (cliente_id, rua, cidade, estado, cep) VALUES
(1, 'Rua A', 'Cidade A', 'Estado A', '12345-678'),
(2, 'Rua B', 'Cidade B', 'Estado B', '23456-789'),
(3, 'Rua C', 'Cidade C', 'Estado C', '34567-890'),
(4, 'Rua D', 'Cidade D', 'Estado D', '45678-901'),
(5, 'Rua E', 'Cidade E', 'Estado E', '56789-012'),
(6, 'Rua F', 'Cidade F', 'Estado F', '67890-123'),
(7, 'Rua G', 'Cidade G', 'Estado G', '78901-234'),
(8, 'Rua H', 'Cidade H', 'Estado H', '89012-345'),
(9, 'Rua I', 'Cidade I', 'Estado I', '90123-456'),
(10, 'Rua J', 'Cidade J', 'Estado J', '01234-567');

-- Inserindo dados na tabela vendedores
INSERT INTO sistema.vendedores (nome, email, telefone) VALUES
('Vendedor 1', 'vendedor1@example.com', '123123123'),
('Vendedor 2', 'vendedor2@example.com', '456456456'),
('Vendedor 3', 'vendedor3@example.com', '789789789'),
('Vendedor 4', 'vendedor4@example.com', '101010101'),
('Vendedor 5', 'vendedor5@example.com', '202020202'),
('Vendedor 6', 'vendedor6@example.com', '303030303'),
('Vendedor 7', 'vendedor7@example.com', '404040404'),
('Vendedor 8', 'vendedor8@example.com', '505050505'),
('Vendedor 9', 'vendedor9@example.com', '606060606'),
('Vendedor 10', 'vendedor10@example.com', '707070707');

-- Inserindo dados na tabela formas_pagamento
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

-- Inserindo dados na tabela pedidos
INSERT INTO sistema.pedidos (cliente_id, vendedor_id, endereco_entrega_id, forma_pagamento_id, status) VALUES
(1, 1, 1, 1, 'Pendente'),
(2, 2, 2, 2, 'Pendente'),
(3, 3, 3, 3, 'Pendente'),
(4, 4, 4, 4, 'Pendente'),
(5, 5, 5, 5, 'Pendente'),
(6, 6, 6, 6, 'Pendente'),
(7, 7, 7, 7, 'Pendente'),
(8, 8, 8, 8, 'Pendente'),
(9, 9, 9, 9, 'Pendente'),
(10, 10, 10, 10, 'Pendente');

-- Inserindo dados na tabela itens
INSERT INTO sistema.itens (nome, descricao, preco, estoque) VALUES
('Item 1', 'Descrição do Item 1', 10.00, 100),
('Item 2', 'Descrição do Item 2', 20.00, 200),
('Item 3', 'Descrição do Item 3', 30.00, 300),
('Item 4', 'Descrição do Item 4', 40.00, 400),
('Item 5', 'Descrição do Item 5', 50.00, 500),
('Item 6', 'Descrição do Item 6', 60.00, 600),
('Item 7', 'Descrição do Item 7', 70.00, 700),
('Item 8', 'Descrição do Item 8', 80.00, 800),
('Item 9', 'Descrição do Item 9', 90.00, 900),
('Item 10', 'Descrição do Item 10', 100.00, 1000);

-- Inserindo dados na tabela itens_pedido
INSERT INTO sistema.itens_pedido (pedido_id, item_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 10.00),
(2, 2, 2, 20.00),
(3, 3, 3, 30.00),
(4, 4, 4, 40.00),
(5, 5, 5, 50.00),
(6, 6, 6, 60.00),
(7, 7, 7, 70.00),
(8, 8, 8, 80.00),
(9, 9, 9, 90.00),
(10, 10, 10, 100.00);

COMMIT;  -- Finalizando a transação
