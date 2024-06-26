create table grupos(
                       id serial primary key,
                       nome varchar(80)
);
--
create table paises(
                       id serial primary key,
                       nome varchar (80)
);
--
create table descobertas(
                            id serial primary key,
                            descobridor varchar(120)

);
--
create table periodos(
                         id serial primary key,
                         era varchar(30),
                         inicio integer,
                         fim integer
);
--
create table dinossauros(
                            id serial primary key,
                            nome varchar(80),
                            toneladas integer,
                            inicio integer,
                            fim integer,
                            ano_descoberta integer,

                            fk_descoberta integer,
                            fk_grupo integer,
                            fk_pais integer,
                            fk_periodo integer,
                            foreign key(fk_descoberta) references descobertas(id),
                            foreign key(fk_grupo) references grupos(id),
                            foreign key(fk_pais) references paises(id),
                            foreign key(fk_periodo) references periodos(id)
)

-- FUNÇÃO / TRIGGER / INCLUSÃO

CREATE OR REPLACE FUNCTION verificar_era()
RETURNS trigger AS $BODY$
DECLARE
inicio_periodo INTEGER;
	fim_periodo INTEGER;
BEGIN
	-- Buscar o inicio e fim do periodo
SELECT inicio,fim INTO inicio_periodo, fim_periodo
FROM periodos
WHERE id = NEW.fk_periodo;




-- Verifica se o inicio do dinossauro é maior com o inicio da era
IF NEW.inicio > inicio_periodo OR NEW.fim < fim_periodo
			THEN
			RETURN NEW;
ELSE
			RAISE EXCEPTION 'Fora do período da era';
RETURN null;
END IF;

END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER trigger_era AFTER INSERT
    ON dinossauros
    for each row execute procedure verificar_era();

INSERT INTO grupos(nome) VALUES('Anquilossauros');
INSERT INTO grupos(nome) VALUES('Ceratopsídeos');
INSERT INTO grupos(nome) VALUES('Estegossauros');
INSERT INTO grupos(nome) VALUES('Terápodes')

    INSERT INTO paises(nome) VALUES('Mongólia');
INSERT INTO paises(nome) VALUES('Canadá');
INSERT INTO paises(nome) VALUES('Tanzânia');
INSERT INTO paises(nome) VALUES('China');
INSERT INTO paises(nome) VALUES('América do Norte');
INSERT INTO paises(nome) VALUES('USA')

    INSERT INTO descobertas(descobridor) VALUES('Maryanska');
INSERT INTO descobertas(descobridor) VALUES('John Bell Hatcher');
INSERT INTO descobertas(descobridor) VALUES('Cientistas Alemães');
INSERT INTO descobertas(descobridor) VALUES('Museu Americano de História Natural');
INSERT INTO descobertas(descobridor) VALUES('Othniel Charles Marsh');
INSERT INTO descobertas(descobridor) VALUES('Barnum Brown')

    INSERT INTO dinossauros(nome, toneladas, inicio, fim, ano_descoberta, fk_descoberta, fk_grupo, fk_pais, fk_periodo)
VALUES('Saichania', 4, 145, 66, 1997, 1, 1, 1, 1);
INSERT INTO dinossauros(nome, toneladas, inicio, fim, ano_descoberta, fk_descoberta, fk_grupo, fk_pais, fk_periodo)
VALUES('Anquilossauros', 8, 1, 2, 196, 6, 1, 5, 1);
INSERT INTO dinossauros(nome, toneladas, inicio, fim, ano_descoberta, fk_descoberta, fk_grupo, fk_pais, fk_periodo)
VALUES ('Tiranossauro Rex', 9, 9999, 0, 1900, 1, 1, 1, 1);

select * from periodos
SELECT * FROM dinossauros
SELECT * FROM grupos
SELECT * FROM descobertas
