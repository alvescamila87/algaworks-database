/* alterando tabelas */

use pedido_venda;

/* colocar not null exibe string vazia != de null */
select * from pedido;

alter table pedido 
add column forma_pagamento varchar(20) not null;

insert into pedido (data_pedido, data_entrega, valor_frete, valor_venda, cliente_id, forma_pagamento) 
values
(now(), '2024-07-09', 12.90, 490.90, 3, 'DINHEIRO');

/* colocar valor default para iniciar a coluna */
alter table pedido
add column status varchar(20) not null default 'ORCAMENTO';

insert into pedido (data_pedido, data_entrega, valor_frete, valor_venda, cliente_id, forma_pagamento, status) 
values
(now(), '2024-07-09', 12.90, 490.90, 3, 'DINHEIRO', 'CANCELADO');

/* apagar coluna */
alter table pedido
drop column status;

