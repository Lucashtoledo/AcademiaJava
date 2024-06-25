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


-- INSERTS

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
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 19, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 19, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 20, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 20, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 22, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 22, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 23, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 23, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 24, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 24, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 25, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 25, 'S');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 26, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 26, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 27, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 27, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 28, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 28, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (6, 29, 'N');
INSERT INTO filmes_atores (fk_ator, fk_filme, ator) VALUES (7, 29, 'N');

-- SELECTS

-- 1 - Listar todos os filmes alugados por um cliente específico, incluindo a data de locação e a data de devolução.
SELECT locacoes_filmes.data_devol, locacoes.data_loc, clientes.nome FROM locacoes_filmes
INNER JOIN locacoes ON locacoes_filmes.fk_loc = locacoes.cod_loc
INNER JOIN clientes ON clientes.cod_cli = locacoes.fk_cli
WHERE locacoes.fk_cli = 8

-- 2  - Obter uma lista de clientes e seus dependentes.

SELECT clientes.nome, dependentes.parentesco FROM clientes
INNER JOIN dependentes ON clientes.cod_cli = dependentes.fk_dep or clientes.cod_cli = dependentes.fk_cli
WHERE clientes.cod_cli = 9

-- 3  - Listar todos os filmes de um determinado gênero.

SELECT filmes.titulo, generos.nome FROM filmes
INNER JOIN generos ON filmes.fk_gen = generos.cod_gen
WHERE generos.cod_gen = 3

-- 4  - Exibir todos os clientes que têm uma profissão específica.

SELECT clientes.nome, profissoes.nome FROM clientes
INNER JOIN profissoes ON clientes.fk_prof = profissoes.cod_prof
WHERE profissoes.cod_prof = 2

-- 5  - Encontrar todos os filmes em uma categoria específica com quantidade disponível maior que 5.

SELECT filmes.titulo, categorias.nome FROM filmes
INNER JOIN categorias ON filmes.fk_cat = categorias.cod_cat
WHERE categorias.cod_cat = 1 and filmes.quantidade > 4 -- Não incluí nenhum com mais de 5 --

-- 6  - Listar todos os atores que participaram de filmes com um determinado título.

SELECT atores.nome FROM filmes_atores
INNER JOIN atores ON atores.cod_ator = filmes_atores.fk_ator
INNER JOIN filmes ON filmes.cod_filme = filmes_atores.fk_filme
WHERE filmes.titulo = 'O Lobo';

-- 7  - Obter o endereço completo de um cliente específico.

SELECT enderecos.logradouro, enderecos.tipo_log, enderecos.complemento, enderecos.cidade, enderecos.uf, enderecos.cep, enderecos.numero, enderecos.bairro
FROM cli_enderecos
INNER JOIN clientes ON cli_enderecos.fk_cli = clientes.cod_cli
INNER JOIN enderecos ON cli_enderecos.fk_end = enderecos.cod_end
WHERE cli_enderecos.fk_cli = 10

-- 8 - Listar todos os filmes e seus respectivos gêneros e categorias.

SELECT filmes.titulo, generos.nome, categorias.nome FROM filmes
INNER JOIN generos ON filmes.fk_gen = generos.cod_gen
INNER JOIN categorias ON filmes.fk_cat = categorias.cod_cat

-- 9  - Mostrar todos os clientes que alugaram um filme específico e a data de locação.

SELECT clientes.nome, locacoes.data_loc FROM locacoes
INNER JOIN clientes ON locacoes.fk_cli = clientes.cod_cli
INNER JOIN locacoes_filmes ON locacoes.cod_loc = locacoes_filmes.fk_loc
INNER JOIN filmes ON locacoes_filmes.fk_filme = filmes.cod_filme
WHERE filmes.titulo = 'Matrix'

-- 10 - Exibir a lista de clientes com multas superiores a um valor específico.

SELECT clientes.nome FROM clientes
INNER JOIN locacoes ON locacoes.fk_cli = clientes.cod_cli
WHERE locacoes.multa > '0.0'

-- 11 - Listar todas as locações feitas em um período específico.

SELECT locacoes.cod_loc FROM locacoes
INNER JOIN locacoes_filmes ON locacoes.cod_loc = locacoes_filmes.fk_loc
WHERE locacoes.data_loc > '2021-08-23' and locacoes_filmes.data_devol < '2021-09-01'

-- 12 - Obter a quantidade total de filmes alugados por cada cliente. (DESAFIO)

SELECT clientes.nome, COUNT(locacoes.fk_cli) AS total_locacao FROM clientes
INNER JOIN locacoes ON locacoes.fk_cli = clientes.cod_cli GROUP BY clientes.nome;

-- 13 - Listar os clientes e os filmes que eles alugaram, ordenados por data de locação.
SELECT clientes.nome, filmes.titulo FROM clientes
INNER JOIN locacoes ON locacoes.fk_cli = clientes.cod_cli
INNER JOIN locacoes_filmes ON locacoes_filmes.fk_loc = locacoes.cod_loc
INNER JOIN filmes ON locacoes_filmes.fk_filme = filmes.cod_filme
ORDER BY locacoes.data_loc

-- 14 - Mostrar todos os clientes que moram em uma cidade específica e que alugaram filmes de uma categoria específica.
SELECT clientes.nome FROM clientes
INNER JOIN locacoes ON locacoes.fk_cli = clientes.cod_cli
INNER JOIN locacoes_filmes ON locacoes_filmes.fk_loc = locacoes.cod_loc
INNER JOIN filmes ON locacoes_filmes.fk_filme = filmes.cod_filme
INNER JOIN cli_enderecos ON cli_enderecos.fk_cli = clientes.cod_cli
INNER JOIN enderecos ON enderecos.cod_end = cli_enderecos.fk_end
WHERE enderecos.cidade = 'Rio de Janeiro' AND filmes.titulo = 'Avatar'

-- 15 - Encontrar todos os atores que participaram de pelo menos 5 filmes, listando o nome do ator e o número de filmes em que atuou.
SELECT atores.nome, COUNT(DISTINCT filmes_atores.fk_filme) AS filmes FROM atores
INNER JOIN filmes_atores ON filmes_atores.fk_ator = atores.cod_ator
GROUP BY atores.nome
HAVING COUNT(DISTINCT filmes_atores.fk_filme) > 5

-- 16 - Exibir a quantidade total de filmes alugados por categoria e gênero, incluindo apenas as categorias e gêneros que têm mais de 5 filmes alugados no total (DESAFIO)



SELECT * FROM locacoes
SELECT * FROM locacoes_filmes
SELECT * FROM clientes
SELECT * FROM dependentes
SELECT * FROM filmes
SELECT * FROM generos
SELECT * FROM profissoes
SELECT * FROM categorias
SELECT * FROM atores
SELECT * FROM filmes_atores
SELECT * FROM enderecos
SELECT * FROM cli_enderecos
