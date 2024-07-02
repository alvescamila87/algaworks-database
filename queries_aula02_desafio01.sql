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