create table grupo(
	id serial primary key,
	grupo varchar(80)
)
--
create table pais(
	id serial primary key,
	pais varchar (80)
)
--
create table descoberta(
	id serial primary key,
	nome_descobridor varchar(120),
	ano_descoberta integer
)
--
create table periodo(
	id serial primary key,
	era varchar(30),
	inicio date,
	fim date
)
--
create table dinossauro(
	id serial primary key,
	nome_dinossauro varchar(80),
	toneladas real,
	
	fk_descoberta integer,
	fk_grupo integer,
	fk_pais integer,
	fk_periodo integer,
	foreign key(fk_descoberta) references descoberta(id),
	foreign key(fk_grupo) references grupo(id),
	foreign key(fk_pais) references pais(id),
	foreign key(fk_periodo) references periodo(id)
)