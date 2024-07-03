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

