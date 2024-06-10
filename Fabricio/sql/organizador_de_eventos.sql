create table compra
(
    id serial primary key,
    quantidade integer not null,

    fk_ingresso integer not null,
    fk_evento integer not null,
    foreign key (fk_evento) references eventos(id),
    foreign key (fk_ingresso) references ingressos(id)
)

create table eventos
(
    id serial primary key,
    nome varchar(50) not null,
    data_ini date not null,
    data_fim date not null,
    localizacao varchar(120) not null,
    fk_tipo integer not null,
    foreign key (fk_tipo) references tipo_evento(id)
)

create table ingressos
(
    id serial primary key,
    titulo varchar(150) not null,
    lugar varchar(120) not null,
    valor real not null,
    quantidade integer not null,
    fk_evento integer not null,
    foreign key (fk_evento) references eventos(id)
)

create table programacao
(
    id serial primary key,
    nome varchar(50) not null,
    descricao varchar(500) not null,
    date_ini date not null,
    date_fim date not null,
    lugar varchar(120) not null,
    responsavel varchar(120) not null,
    fk_evento integer not null,
    foreign key (fk_evento) references eventos(id)
)

create table pessoas
(
    cpf varchar(12) not null,
    nome varchar(120) not null,
    email varchar(50) not null,
    fone varchar(16) not null
)

create table tipo_evento
(
    id serial primary key,
    tipo varchar(50) not null
)