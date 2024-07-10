/* consultas avancadas */
use pedido_venda;

select * from pedido;

/* funcao SUM: coluna numérica (inteiros ou reais) */
select sum(valor_frete) as total_frete,  sum(valor_venda) as total_vendas from pedido; 

/* funcao GROUP-BY */
select status, sum(valor_frete), sum(valor_venda) from pedido
group by status;

/* agrupar por data desconsiderando a hora */
select date(data_pedido), status, sum(valor_frete), sum(valor_venda) from pedido
where status = 'EMITIDO'
group by date(data_pedido);



