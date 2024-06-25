select * from enderecos

DELETE FROM categorias WHERE cod_cat = 9;

ALTER TABLE categorias ALTER COLUMN valor TYPE MONEY USING valor::MONEY;
