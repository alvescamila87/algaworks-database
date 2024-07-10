/* consultas avancadas */
use pedido_venda;

select * from pedido;

/* funcao SUM: coluna numérica (inteiros ou reais) */
select sum(valor_frete) as total_frete,  sum(valor_venda) as total_vendas from pedido; 

/* funcao GROUP-BY */
select status, sum(valor_frete), sum(valor_venda) from pedido
group by status;

/* agrupar por data desconsiderando a hora */
/* vem sempre depois de where */
select date(data_pedido), status, sum(valor_frete), sum(valor_venda) from pedido
where status = 'EMITIDO'
group by date(data_pedido);

/* funcao AVG */

select avg(valor_frete) as media_frete, avg(valor_venda) as media_venda from pedido;

select status, avg(valor_frete), avg(valor_venda) from pedido
group by status;

/* ordenando com order by */
/* vem sempre depois de where */

select * from cliente
order by nome;

select * from cliente
order by data_nascimento;

/* filtrando com like */

select * from cliente
where nome like '%M%';

select * from cliente
where nome like 'Z%';

select * from cliente
where nome like '%o';

/* resultados únicos com distinct */
/* eliminar resultados repetidos */

select distinct data_entrega from pedido
order by data_entrega;

/* filtrar com in */
/* filtrar num range de valores */

select * from produto
where id_produto in (2,3);

select * from pedido
where valor_frete in (19.90, 30.25);

/* consultas dentro de consultas: subselect */
/* ajuda em consultas mais complicadas */

select nome, email 
from cliente
where id in (select cliente_id from pedido where status = 'EMITIDO');




