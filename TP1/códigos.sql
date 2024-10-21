--  Listar todos os pedidos feitos por um cliente específico

SELECT * 
FROM sistema.pedidos
WHERE cliente_id = 7;

--  Listar todos os itens de um pedido específico

SELECT 
    i.nome AS nome_item,
    i.descricao AS descricao_item,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS total_item
FROM sistema.itens_pedido ip
JOIN sistema.itens i ON ip.item_id = i.id
JOIN sistema.pedidos p ON ip.pedido_id = p.id
WHERE p.id = 1 ;


--  Listar todos os clientes que fizeram pedidos em um determinado intervalo de datas

SELECT DISTINCT sistema.clientes.*
FROM sistema.clientes
JOIN sistema.pedidos ON sistema.clientes.id = sistema.pedidos.cliente_id
WHERE sistema.pedidos.data_pedido BETWEEN '2024-01-01' AND '2024-07-07';

--  Listar todos os pedidos e os respectivos clientes

SELECT p.id AS pedido_id, c.nome AS nome_cliente
FROM sistema.clientes c
JOIN sistema.pedidos p ON c.id = p.cliente_id;


--  Listar todos os itens vendidos por um vendedor específico

SELECT 
    i.nome AS nome_item, 
    v.nome AS nome_vendedor,
    i.descricao AS item_descricao
FROM sistema.itens_pedido ip
JOIN sistema.itens i ON ip.item_id = i.id
JOIN sistema.pedidos p ON ip.pedido_id = p.id
JOIN sistema.vendedores v on p.vendedor_id = v.id
JOIN sistema.clientes c ON p.cliente_id = c.id
ORDER BY i.id;

--  Listar todos os pagamentos feitos em um determinado intervalo de datas

SELECT 
    p.id,
    p.data_pedido,
    fp.descricao AS forma_pagamento,
    c.nome AS nome_cliente
FROM sistema.pedidos p
JOIN sistema.formas_pagamento fp ON fp.id = p.forma_pagamento_id
JOIN sistema.clientes c ON p.cliente_id = c.id
WHERE data_pedido BETWEEN '2023-10-18' AND '2024-07-18';



--  Listar todos os pedidos que foram pagos com uma forma de pagamento específica

SELECT
    p.id,
    fp.descricao AS forma_pagamento,
    c.nome AS nome_cliente
FROM sistema.pedidos p 
JOIN sistema.formas_pagamento fp ON fp.id = p.forma_pagamento_id
JOIN sistema.clientes c ON p.cliente_id = c.id
WHERE fp.id = 3;

--  Listar todos os clientes e seus respectivos endereços

SELECT c.nome AS nome_cliente, e.rua AS nome_rua
FROM sistema.clientes c 
JOIN sistema.enderecos e ON e.cliente_id = c.id ;


--  Listar todos os vendedores que venderam itens em um determinado intervalo de datas

SELECT v.nome, p.data_pedido
FROM sistema.vendedores v 
JOIN sistema.pedidos p ON p.vendedor_id = v.id 
WHERE p.data_pedido BETWEEN '2023-10-18' AND '2024-07-18';

--  Listar todos os itens que estão fora de estoque

SELECT i.nome, i.descricao 
FROM sistema.itens i 
WHERE i.estoque = 0;

--  Listar todos os pedidos e os respectivos itens

SELECT p.id, i.nome AS item
FROM sistema.pedidos p 
JOIN sistema.itens_pedido ip ON ip.pedido_id = p.id
JOIN sistema.itens i ON ip.item_id = i.id;

--  Listar todos os clientes que não fizeram pedidos

SELECT c.nome
FROM sistema.clientes c
LEFT JOIN sistema.pedidos p ON c.id = p.cliente_id
WHERE p.id IS NULL;


--  Listar todos os pedidos e os respectivos pagamentos

SELECT p.id, p.status, fp.descricao
FROM sistema.pedidos p 
JOIN sistema.formas_pagamento fp ON p.forma_pagamento_id = fp.id;

--  Listar todos os itens vendidos em um determinado intervalo de preços

SELECT i.nome, i.descricao, p.data_pedido
FROM sistema.itens i 
JOIN sistema.itens_pedido ip ON ip.item_id = i.id
JOIN sistema.pedidos p ON ip.pedido_id = p.id
WHERE p.data_pedido BETWEEN '2023-10-18' AND '2024-07-18';

--  Listar todos os clientes e os respectivos pedidos

SELECT c.nome, p.id
FROM sistema.clientes c 
JOIN sistema.pedidos p ON c.id = p.cliente_id;


--  Listar todos os pedidos feitos por um cliente específico e os respectivos itens

SELECT c.nome AS nome_cliente, p.id AS id_pedido, i.nome AS nome_item 
FROM sistema.clientes c 
JOIN sistema.pedidos p ON p.cliente_id = c.id 
JOIN sistema.itens_pedido ip ON ip.pedido_id = p.id
JOIN sistema.itens i ON i.id = ip.item_id
WHERE c.id = 1;

--  Listar todos os clientes que fizeram pedidos e os respectivos vendedores

SELECT c.nome AS nome_cliente, v.nome AS nome_vendedor, p.id AS id_pedido 
FROM sistema.clientes c
JOIN sistema.pedidos p ON p.cliente_id = c.id
JOIN sistema.vendedores v ON p.vendedor_id = v.id;

--  Listar todos os pedidos feitos em um determinado intervalo de datas e os respectivos itens

SELECT p.id, i.nome, p.data_pedido
FROM sistema.pedidos p 
JOIN sistema.itens_pedido ip ON p.id = ip.pedido_id
JOIN sistema.itens i ON i.id = ip.pedido_id
WHERE p.data_pedido BETWEEN '2023-10-18' AND '2024-07-18';

--  Listar todos os clientes que fizeram pedidos e os respectivos endereços de entrega

SELECT c.nome, e.rua, e.cidade, p.id
FROM sistema.clientes c 
JOIN sistema.pedidos p ON p.cliente_id = c.id
JOIN sistema.enderecos e ON p.endereco_entrega_id = e.id;

--  Listar todos os pedidos feitos por um cliente específico e os respectivos pagamentos

SELECT c.nome, p.id, fp.descricao 
FROM sistema.clientes c 
JOIN sistema.pedidos p ON p.cliente_id = c.id 
JOIN sistema.formas_pagamento fp ON p.forma_pagamento_id = fp.id;