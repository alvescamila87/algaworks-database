use db_escola_ingles;

select * from aluno;

insert into aluno (nome, email, data_nascimento) values
("Princesa Isabel", "isabel@gmail.com", '2000-10-05'),
("Dom Manoel", "manoel@gmail.com", '2003-05-28'),
("Júlio César", "julio@gmail.com", '2010-07-15'),
("Maria Madalena", "maria@gmail.com", '2015-09-16'),
("Helena Maria", "helena@gmail.com", '1994-05-01');

select * from professor;

insert into professor (nome) values 
("César Rodrigues"),
("Antônio Amorim"),
("Alice Rosa"),
("Laura Stein");

select * from curso;

insert into curso (descricao, professor_id) values 
('Inglês Kids I', 4),
('Inglês Kids II', 5),
('Inglês Kids Teen II', 6),
('Inglês Kids Advanced', 7);

update curso set descricao = 'Inglês Teen II' 
where id_curso = 4;

select * from matricula;

alter table matricula add column data_matricula date;

insert into matricula (aluno_id, curso_id, matricula, data_matricula) values
(8, 9, 'QWER9632', '2024-01-15'),
(7, 8, 'ADCG7412', '2024-01-28'),
(6, 7, 'DDDD8888', '2024-02-28'),
(5, 6, 'ADCG7412', '2024-03-13');

update matricula 
set data_matricula = '2024-02-14'
where aluno_id = 3;