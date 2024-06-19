CREATE TABLE atores(
	cod_ator serial primary key,
	nome varchar(60)
);


CREATE TABLE enderecos(
	cod_end serial primary key,
	logradouro varchar(40) not null,
	tipo_log varchar(40) not null,
	complemento varchar(20),
	cidade varchar(60) not null,
	uf varchar(8) not null,
	cep varchar(8),
	numero varchar(10),
	bairro varchar(60) not null
);


CREATE TABLE profissoes(
	cod_prof serial primary key,
	nome varchar(60) not null
);


CREATE TABLE generos(
	cod_gen serial primary key,
	nome varchar(60) not null
);


CREATE TABLE categorias(
	cod_cat serial primary key,
	nome varchar(60) not null,
	valor money not null
);

CREATE TABLE clientes(
	cod_cli serial primary key,
	cpf varchar(11) not null,
	nome varchar(60) not null,
	telefone varchar(10) not null,
	fk_prof integer not null,

	FOREIGN KEY (fk_prof) REFERENCES profissoes(cod_prof)
);

CREATE TABLE locacoes(
	cod_loc serial primary key,
	data_loc date not null,
	desconto money,
	multa money,
	sub_total money not null,
	fk_cli integer not null,

	FOREIGN KEY (fk_cli) REFERENCES clientes(cod_cli)
);

CREATE TABLE filmes(
	cod_filme serial primary key,
	titulo_original varchar(100) not null,
	titulo varchar (100) not null,
	quantidade integer,
	fk_cat integer not null,
	fk_gen integer not null,

	FOREIGN KEY (fk_cat) REFERENCES categorias(cod_cat),
	FOREIGN KEY (fk_gen) REFERENCES generos(cod_gen)
);

CREATE TABLE dependentes(
	fk_cli integer not null,
	fk_dep integer not null,
	parentesco varchar(20),

	FOREIGN KEY (fk_cli) REFERENCES clientes(cod_cli),
	FOREIGN KEY (fk_dep) REFERENCES clientes(cod_cli)
);

CREATE TABLE locacoes_filmes(
	fk_loc integer not null,
	fk_filme integer not null,
	valor money,
	num_dias integer,
	data_devol date,

	FOREIGN KEY(fk_loc) REFERENCES locacoes(cod_loc),
	FOREIGN KEY(fk_filme) REFERENCES filmes(cod_filme)
);

CREATE TABLE filmes_atores(
	fk_ator integer not null,
	fk_filme integer not null,
	ator varchar(2),
	diretor varchar(2),

	FOREIGN KEY(fk_ator) REFERENCES atores(cod_ator),
	FOREIGN KEY(fk_filme) REFERENCES filmes(cod_filme)
);

CREATE TABLE cli_enderecos(
	cod_cli_end serial primary key,
	fk_end integer not null,
	fk_cli integer not null,

	FOREIGN KEY(fk_end) REFERENCES enderecos(cod_end),
	FOREIGN KEY(fk_cli) REFERENCES clientes(cod_cli)
);

drop table enderecos

INSERT INTO atores(nome) VALUES('Bob Nômade');
INSERT INTO atores(nome) VALUES('Robert Gilmak');
INSERT INTO atores(nome) VALUES('Gabriel Drummond');
INSERT INTO atores(nome) VALUES('Rita Janefford');
INSERT INTO atores(nome) VALUES('Tina Turner');


INSERT INTO enderecos(logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES('Alamandas', 'Rua', 'Casa', 'Jataizinho', 'PR', '86000100', '2', 'Gingado');
INSERT INTO enderecos(logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES('Lago Verde', 'lagoa', 'Casa', 'Jangada', 'AM', '81990100', 'n/t', 'Colorido');
INSERT INTO enderecos(logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES('Lago Verde', 'lagoa', 'Casa', 'Jangada', 'AM', '81990100', 'n/t', 'Colorido');
INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES ('Avenida Paulista', 'Avenida', 'Apto 1001', 'São Paulo', 'SP', '01310000', '1001', 'Bela Vista');
INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES ('Rua das Flores', 'Rua', 'Casa 15', 'Curitiba', 'PR', '80020090', '15', 'Centro');
INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES ('Avenida Rio Branco', 'Avenida', 'Sala 200', 'Rio de Janeiro', 'RJ', '20090003', '200', 'Centro');
INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES ('Travessa dos Artistas', 'Travessa', 'Lote 10', 'Belo Horizonte', 'MG', '3014001', '10', 'Savassi');
INSERT INTO enderecos (logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro)
VALUES ('Rua das Palmeiras', 'Rua', 'Apartamento 301', 'Fortaleza', 'CE', '60175210', '301', 'Meireles');


INSERT INTO profissoes(nome) VALUES('caminhoneiro');
INSERT INTO profissoes (nome) VALUES ('engenheiro');
INSERT INTO profissoes (nome) VALUES ('médico');
INSERT INTO profissoes (nome) VALUES ('professor');
INSERT INTO profissoes (nome) VALUES ('advogado');
INSERT INTO profissoes (nome) VALUES ('programador');

INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('12345678925', 'Manoel Gomes', '999982525', 1);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('98765432100', 'Maria Silva', '987654321', 2);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('11122233344', 'João Oliveira', '998877665', 4);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('55544433322', 'Carla Souza', '987654321', 4);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('88877766655', 'Pedro Santos', '999888777', 5);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('33322211100', 'Ana Lima', '998877665', 3);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('99988877766', 'Fernanda Pereira', '987654321', 1);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('77788899911', 'Rafael Oliveira', '999888777', 2);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('22233344455', 'Lucas Costa', '998877665', 3);
INSERT INTO clientes (cpf, nome, telefone, fk_prof) VALUES ('44455566688', 'Patrícia Santos', '987654321', 6);

INSERT INTO categorias (nome, valor) VALUES ('Infantil', 15.99);
INSERT INTO categorias (nome, valor) VALUES ('Esportes', 29.99);
INSERT INTO categorias (nome, valor) VALUES ('Ficção Científica', 24.50);
INSERT INTO categorias (nome, valor) VALUES ('Romance', 19.95);
INSERT INTO categorias (nome, valor) VALUES ('Fantasia', 22.75);

INSERT INTO generos (nome) VALUES ('Ação');
INSERT INTO generos (nome) VALUES ('Comédia');
INSERT INTO generos (nome) VALUES ('Drama');
INSERT INTO generos (nome) VALUES ('Suspense');
INSERT INTO generos (nome) VALUES ('Animação');

INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Wolf', 'O Lobo', 2, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Inception', 'A Origem', 3, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Matrix', 'Matrix', 5, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Pulp Fiction', 'Pulp Fiction', 4, 2, 3);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Jurassic Park', 'Parque dos Dinossauros', 2, 3, 4);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Shawshank Redemption', 'Um Sonho de Liberdade', 3, 2, 3);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Dark Knight', 'O Cavaleiro das Trevas', 4, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Avatar', 'Avatar', 5, 3, 5);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Titanic', 'Titanic', 3, 3, 1);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Frozen', 'Frozen', 4, 4, 4);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Lord of the Rings', 'O Senhor dos Anéis', 2, 2, 5);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Gladiator', 'Gladiador', 3, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Finding Nemo', 'Procurando Nemo', 4, 4, 5);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('The Avengers', 'Os Vingadores', 5, 1, 2);
INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cat, fk_gen) VALUES ('Harry Potter and the Philosopher''s Stone', 'Harry Potter e a Pedra Filosofal', 3, 2, 5);

INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-21', 0.0, 2.3, 53.60, 8);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-22', 1.0, 0.0, 45.00, 9);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-23', 0.0, 3.5, 62.80, 10);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-24', 0.0, 0.0, 50.00, 11);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-25', 2.0, 0.0, 40.00, 12);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-26', 0.0, 1.2, 55.20, 13);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-27', 0.0, 0.0, 48.75, 14);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-28', 0.0, 0.0, 60.00, 15);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-29', 1.5, 0.0, 51.20, 16);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-30', 0.0, 2.8, 42.50, 17);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-08-31', 0.0, 0.0, 38.40, 16);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-01', 0.0, 4.0, 65.00, 8);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-02', 0.0, 0.0, 53.75, 9);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-03', 0.0, 1.5, 47.20, 10);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-04', 0.0, 0.0, 59.90, 11);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-06', 0.0, 0.0, 57.60, 13);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-05', 0.0, 3.2, 44.50, 12);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-07', 0.0, 0.0, 46.75, 14);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-08', 0.0, 2.0, 63.40, 15);
INSERT INTO locacoes (data_loc, desconto, multa, sub_total, fk_cli) VALUES ('2021-09-09', 0.0, 0.0, 49.25, 16 ;

INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (3, 19, 20.00, 2, '2021-08-23');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (15, 20, 30.00, 3, '2021-08-24');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (16, 21, 50.00, 5, '2021-08-25');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (17, 22, 40.00, 4, '2021-08-26');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (18, 23, 25.00, 2, '2021-08-27');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (19, 24, 30.00, 3, '2021-08-28');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (20, 25, 40.00, 4, '2021-08-29');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (21, 26, 50.00, 5, '2021-08-30');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (22, 27, 30.00, 3, '2021-08-31');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (23, 28, 20.00, 2, '2021-09-01');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (24, 29, 40.00, 4, '2021-09-02');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (25, 30, 30.00, 3, '2021-09-03');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (26, 31, 40.00, 4, '2021-09-04');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (27, 32, 50.00, 5, '2021-09-05');
INSERT INTO locacoes_filmes (fk_loc, fk_filme, valor, num_dias, data_devol) VALUES (28, 33, 30.00, 3, '2021-09-06');

INSERT INTO dependentes (fk_cli, fk_dep, parentesco) VALUES (8, 9, 'Filho');
INSERT INTO dependentes (fk_cli, fk_dep, parentesco) VALUES (10, 11, 'Filha');
INSERT INTO dependentes (fk_cli, fk_dep, parentesco) VALUES (13, 14, 'Cônjuge');
INSERT INTO dependentes (fk_cli, fk_dep, parentesco) VALUES (16, 17, 'Pai');

INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (12, 8);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (13, 9);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (13, 10);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (14, 11);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (15, 12);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (16, 13);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (17, 14);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (18, 15);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (13, 16);
INSERT INTO cli_enderecos (fk_end, fk_cli) VALUES (14, 17);

INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (1, 19, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (3, 20, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (4, 21, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (5, 22, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (1, 23, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (3, 24, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (4, 25, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (5, 26, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (1, 27, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (2, 28, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (3, 29, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (4, 30, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (5, 31, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (1, 32, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (2, 33, 'N');

select * from atores
select * from enderecos
select * from profissoes
select * from generos
select * from categorias
select * from clientes
select * from locacoes
select * from filmes
select * from dependentes
select * from filmes_atores
select * from cli_enderecos
select * from locacoes_filmes


