/* foreign key */

use pedido_venda;

/* add fk many to one */
alter table pedido
add column cliente_id bigint, add constraint fk_cliente_id
foreign key (cliente_id)
references cliente (id);

describe pedido;
select * from pedido;

insert into pedido (data_pedido, observacao, data_entrega, valor_frete, valor_venda, cliente_id)
values ('2024-07-01 22:00:00', 'Pedido normal', '2024-07-02', 29.90, 190.99, 1);


/* add fk many to many - cria tabela de relacionamento */

create table produto (
id_produto bigint primary key auto_increment,
nome varchar(50),
valor_unitario decimal(10,2),
quantidade_estoque int
);

/* criar chave composta de primary key */

create table item_pedido (
pedido_id bigint,
produto_id bigint,
quantidade integer,
primary key (pedido_id, produto_id),
foreign key (pedido_id) references pedido (id),
foreign key (produto_id) references produto (id_produto)
) engine=InnoDB;

/* dados */

insert into produto (nome, valor_unitario, quantidade_estoque) 
values 
('Cola super', 20.50, 300),
('Borracha', 5.90, 150),
('Lápis', 15.90, 450);

insert into item_pedido (pedido_id, produto_id, quantidade)
values 
(3,1,2),
(2,2,4),
(1,3,5);

select * from produto;
select * from pedido;
select * from item_pedido;