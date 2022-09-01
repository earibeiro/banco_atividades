/**
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco; -- criando a base de dados

USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE -- CONSTRAINT IN LINE -- Regra definida na mesma linha da definição da coluna
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CHECK (ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE -- Regra definida fora da linha de definição da coluna
-- regra sem nome
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE
-- regra com nome
);

-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro)
-- VALUE (1,'PARANÁ','PR','S','2020-12-15');

-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro)
-- VALUE (2,'PARANÁ','PR','S','2020-12-15');

-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro)
-- VALUE (3,'SÃO PAULO','PR','A','2020-12-15');

INSERT INTO estado (nome, sigla)
VALUE ('PARANÁ','PR');

INSERT INTO estado (nome, sigla)
VALUE ('SÃO PAULO','SP');

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;
