create database SomativaRodrigo;
use SomativaRodrigo;

alter table usuarios add column telefone varchar(14) not null;
alter table usuarios add column fotoPerfil varchar(500) not null;

create table statusTarefas (
	idStatus bigint not null auto_increment,
    status varchar(250) not null,
    primary key (idStatus)
);



insert into statusTarefas (status) values
('Aberta'), ('Em Andamento'), ('Concluída'), ('Encerrada');

create table tarefas (
	idTarefa bigint not null auto_increment,
    titulo varchar(250) not null,
	descricao varchar(500) not null,
    dataAbertura datetime not null default(now()),
    prazo date not null,
    solicitanteFK bigint not null,
    lugarFK bigint not null,
    primary key (idTarefa),
    foreign key (solicitanteFK) references usuarios (id),
    foreign key (lugarFK) references locais (id)
);

insert into tarefas (titulo, descricao, prazo, solicitanteFK, lugarFK) values
('Trocas Mouses', 'Trocar Mouses com fio por Wireless', '2023-06-08', 2, 5),
('Instalar caixas de Som', 'Fazer instalação das novas caixas de som', '2023-06-20', 4, 2),
('Colocar novas Morsas', 'Trocar as Morsas antigas pelas novas nas bancadas', '2023-06-15', 3, 4),
('Arrumar Multímeltros', 'Trocar os fusíveis dos Multímetros Queimados', '2023-06-10', 5, 1);

create table responsaveis (
	idResponsavel bigint not null auto_increment,
    responsavelFK bigint not null,
    tarefaFK bigint not null,
    primary key (idResponsavel),
    foreign key (responsavelFK) references usuarios (id),
    foreign key (tarefaFK) references tarefas (idTarefa)
);

insert into responsaveis (responsavelFK, tarefaFK) values
(1,1), (4,1), (5,2), (6,3), (2,4);

create table progresso (
	idProgresso bigint not null auto_increment,
    statusFK bigint not null,
    tarefaFK bigint not null,
    comentario varchar(1000) not null,
    data datetime not null default(now()),
    primary key (idProgresso),
    foreign key (statusFK) references statusTarefas (idStatus)
);

insert into progresso (statusFK, tarefaFK, comentario) values
(2, 1, 'mouse'), (1, 2, 'som'), (3, 3, 'morsa'), (2, 4, 'fusível');

create table imagens (
	idImagem bigint not null auto_increment,
    imagem varchar(1000) not null,
    progressoFK bigint not null,
    primary key (idImagem),
    foreign key (progressoFK) references progresso (idProgresso)
);

insert into imagens (imagem, progressoFK) values
('link.com', 1), ('link2.com', 1), ('link3.com', 2), ('link4.com', 3), ('link5.com', 4);

#Consultas:

#1
select * from tarefas t
join progresso p on p.idProgresso = t.idTarefa
join responsaveis r on r.tarefaFK = t.idTarefa
where p.statusFK = 1;


#2
select l.*, count(*) from locais l 
join tarefas t on l.id = t.lugarFK group by t.lugarFK;

#3
select u.*,count(*) from tarefas t 
join responsaveis r on t.idTarefa = r.responsavelFK
join usuarios u on r.responsavelFK = u.id group by u.id having count(u.id) = 0;

#4
select e.*,t.* from tarefas t 
join locais l on t.lugarFK = l.id
join eventos e on l.id = e.localFk 
join progresso p on t.idTarefa = p.tarefaFK
where e.inicio > now() and p.statusFK != '4' group by e.id,t.idTarefa;

#5
select l.*, count(*) from locais l 
join tarefas t on l.id = t.lugarFK group by l.id;

#7
select u.*,count(*) from usuarios u 
join responsaveis r on u.id = r.responsavelFK group by u.id;

#8
select u.*,count(*) from usuarios u 
join responsaveis r on u.id = r.responsavelFK 
join tarefas t on r.responsavelFK = t.idTarefa
join progresso p on t.idTarefa = p.tarefaFK
where p.statusFK < '3' group by u.id;

#9
select *, AVG(x.qnt) from locais l 
join (select lugarFK, month(prazo)as mes,count(*) as qnt from tarefas 
group by mes,lugarFK) x on l.id = x.lugarFK group by x.mes,l.id;