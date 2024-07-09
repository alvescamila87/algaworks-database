/* consulta: cláusula where */
use pedido_venda;

select * from cliente;
select * from pedido;
select * from item_pedido;
select * from produto;

insert into cliente (nome, email, data_nascimento) values
('Maria Madalena', 'maria@email.com', '1986-10-20'),
('João Pedro', 'joao@email.com', '1960-01-29'),
('Princesa Isabel', 'princesa@email.com', '1962-02-14');

select * from cliente
where data_nascimento >= '1970-01-01';

select * from pedido
where observacao is not null
and valor_venda > 200.00;

/* relacionamento entre tabelas */

select * 
	from pedido p;
    -- , cliente c;

select * 
	from pedido p
		, cliente c;    
    
select * from pedido p, cliente c
where p.cliente_id = c.id
and c.nome = 'João Pedro';

select * from
	pedido p
    , cliente c
    where p.cliente_id = c.id
    and c.nome = 'Zebedeu Abraão';
    
insert into pedido (data_pedido, data_entrega, valor_frete, valor_venda, cliente_id) values 
('2024-01-10 10:00:00', '2024-01-15', 29.90, 229.90, 4),
('2024-02-10 10:00:00', '2024-02-15', 19.90, 129.90, 3),
('2024-03-10 10:00:00', '2024-03-15', 9.90, 29.90, 2),
('2024-04-10 10:00:00', '2024-04-15', 39.90, 329.90, 2),
('2024-05-10 10:00:00', '2024-05-15', 59.90, 529.90, 3),
('2024-06-10 10:00:00', '2024-06-15', 69.90, 629.90, 4);

insert into item_pedido (pedido_id, produto_id, quantidade) values
(4, 1, 20), 
(5, 2, 30), 
(6, 3, 15), 
(7, 1, 10), 
(8, 2, 5), 
(9, 3, 2);
    
select pr.* 
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id_produto
and c.nome = 'João Pedro';

select c.nome as cliente, pr.nome as produto_comprado, i.quantidade
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id_produto
and c.nome = 'João Pedro';

select c.nome, pr.nome, i.quantidade
from cliente c, produto pr, pedido pe, item_pedido i
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id_produto
and c.nome = 'Princesa Isabel';

/* trabalhando com datas */

insert into pedido (data_pedido, data_entrega, valor_frete, valor_venda, cliente_id) values
(now(), '2024-07-05', 20.90, 179.90, 3);

select * from pedido;

select * from pedido
where day(data_pedido) = 2
and month(data_pedido) = 7
and year(data_pedido) = 2024;

select * from pedido
where data_pedido >= '2024-01-01 00:00:00'
and data_pedido <= '2024-01-01 23:59:59';
