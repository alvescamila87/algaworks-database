/* checar usuário logado */
select current_user();

/* alterar senha de usuário*/
alter user 'root'@'localhost' identified by '12345';

/* checar novo usuário */
create user 'algaworks'@'localhost' identified by 'algaworks';

/* realizar grant para novo usuário */
grant select, insert on pedido_venda.* to 'algaworks'@'localhost';
flush privileges;

/* ver grants */
show grants;

/* realizar grant usuário poder deletar */
grant delete on pedido_venda.* to 'algaworks'@'localhost';
flush privileges;