/* checar usuário logado */
select current_user();

create database pedido_venda;

use pedido_venda;

/* criar tabelas */

create table cliente (
	id bigint primary key auto_increment,
    nome varchar(100),
    email varchar(50),
    data_nascimento date     
) engine=InnoDB;

create table pedido (
	id bigint primary key auto_increment,
	data_pedido datetime,
	observacao text,
	data_entrega date,
	valor_frete decimal(6,2),
	valor_venda decimal(10,2)
)engine=InnoDB;