/* popular dados */

-- yyyy-mm--dd
insert into cliente (nome, email, data_nascimento) 
values ('Zebedeu Abraão', 'zebedeu@email.com', '1987-12-13');

select * from cliente;


-- yyyy-mm--dd 00:00:00
insert into pedido (data_pedido, data_entrega, valor_frete, valor_venda)
values ('2024-06-30 20:23:00', '2024-07-01', 30.25, 352.50);

select * from pedido;