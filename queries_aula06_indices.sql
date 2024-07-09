/* trabalhando com índices: favorece performance do banco para a pesquisa ficar mais rápida (tipo a PK) */

select * from cliente;

/* verificar c columa TYPE */
explain select * from cliente;

explain select * from cliente 
where nome = 'Princesa Isabel';

/* adicionar índice ao nome: ele não cria uma tabela, ele apenas indexa o campo escolhido */
/* colocou ref em type quando executa o explain */
alter table cliente
add index ix_nome (nome);