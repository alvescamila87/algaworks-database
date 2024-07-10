/* desafio escola de inglês */

create database db_escola_ingles;

use db_escola_ingles;

create table aluno (
id_aluno bigint primary key auto_increment,
nome varchar (50),
email varchar (50),
data_nascimento date
);

create table curso (
id_curso bigint primary key auto_increment,
descricao varchar(50)
);

create table professor (
id_professor bigint primary key auto_increment,
nome varchar(50),
disciplina varchar(50)
);

alter table professor 
drop column disciplina;
/* data */

select * from aluno;

insert into aluno (nome, email, data_nascimento) 
values 
('Zebedeu Gálatas', 'zebedeu@email.com', '1987-12-13'),
('Judite Rute', 'judite@email.com', '1987-10-13'),
('Vasti Queen', 'vasti@email.com', '1987-05-13');

insert into professor (nome) 
values 
('João Pedro'),
('Maria Isabel'),
('Helena Valente');

select * from professor;

insert into curso (descricao, professor_id)
values 
('Inglês I', 1),
('Inglês II', 2),
('Inglês III', 3),
('Inglês Teen', 2),
('Inglês Kids', 3);

/* foreign key */

alter table curso
add column professor_id bigint,
add constraint fk_professor_id
foreign key (professor_id)
references professor(id_professor);

select * from curso;
desc curso;

/* foreign key many to many */
use db_escola_ingles;

create table matricula (
aluno_id bigint,
curso_id bigint,
matricula varchar(50),
primary key (aluno_id, curso_id),
foreign key (aluno_id) references aluno (id_aluno),
foreign key (curso_id) references curso (id_curso)
)engine=InnoDB;

select * from curso;
select * from aluno;

insert into matricula (aluno_id, curso_id, matricula) 
values
(1, 3, 'UIFB9632'),
(2, 1, 'REYU7412'),
(3, 4, 'JHDT5214');

select * from matricula;
desc matricula;

/* Liste os nomes dos alunos que fizeram matrícula em Janeiro de 2024. */

select a.nome, m.matricula, m.data_matricula
from matricula m, aluno a
where m.aluno_id = a.id_aluno
and month(data_matricula) = 1;

/* Liste os nomes dos cursos de um determinado professor */

select a.nome as aluno, c.descricao as curso, p.nome as professor
from aluno a, professor p, curso c, matricula m
where c.professor_id = p.id_professor
and m.aluno_id = a.id_aluno
and m.curso_id = c.id_curso
and p.nome = 'Laura Stein';

/* Liste os nomes dos alunos de um determinado curso. */

select a.nome, c.descricao
from aluno a, curso c, matricula m
where a.id_aluno = m.aluno_id
and m.curso_id = c.id_curso
and c.descricao = 'Inglês I';

/* Desafio: Alterando suas tabelas. */

use db_escola_ingles;

select * from aluno;
select * from curso;
select * from matricula;
select * from professor;

alter table professor
add column cpf varchar(20)not null default '000.000.000-00';

alter table professor 
add column status varchar(20) not null;

update professor
set status = 'ATIVO'
where status is not null;

alter table professor
drop column cpf;

update professor
set cpf = '123.444.999-77'
where id_professor = 1;

explain select * from professor
where cpf = '123.444.999-77';

alter table professor
add index ix_cpf (cpf);

/* Desafio: consultas avancadas: group by, sum and avg dos alunos */

use db_escola_ingles;

select * from matricula;

alter table matricula add column valor_pago decimal(6,2);

update matricula set valor_pago = 490.90
where curso_id = 9;

/* total do valor pago curso */
select sum(valor_pago) as total_pago_matricula
from matricula;

/* media do valor pago curso */

select data_matricula, avg(valor_pago) as media_pago_matricula
from matricula
group by data_matricula;

/* desafio subselect */
/* Liste os nomes dos alunos que já fizeram pelo menos um curso */

select * from aluno;
select * from matricula;
select * from curso;

select nome
from aluno
where id_aluno in (select aluno_id from matricula where curso_id = 3);











