/* deletando dados */

select * from pedido
where cliente_id is null;

/* tem que dar o grant para o usuário */
delete from pedido
where cliente_id is null;

/* realizar grant usuário poder deletar */
grant delete on pedido_venda.* to 'algaworks'@'localhost';
flush privileges;

show grants;