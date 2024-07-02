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
