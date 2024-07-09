/* atualizando dados */

select * from pedido;

/* realizar grant usuário poder atualizar */
grant update on pedido_venda.* to 'algaworks'@'localhost';
flush privileges;

update pedido 
set status = 'EMITIDO'
where forma_pagamento != "";



update pedido 
set forma_pagamento = 'PIX'
where status = 'ORCAMENTO';