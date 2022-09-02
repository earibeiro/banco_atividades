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

INSERT INTO estado (nome, sigla)
VALUES ('PARANÁ','PR');

INSERT INTO estado (nome, sigla)
VALUES ('SÃO PAULO','SP');

SELECT * FROM estado; -- seleciona tudo da tabela estado

CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id) -- definição de regra
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id) -- chamando foreign key e referenciando de onde vem o id
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id) -- aqui torna a cidade única quando em um determinado estado, assim, não há possibilidade de termos duas 'Maringás' inseridas no mesmo estado.
);

-- ID NÃO PRECISA ADICIONAR POIS É AUTO INCREMENTO
-- NÃO PRECISO ADICIONAR O ATIVO PORQUE POR PADRÃO ELE É 'S' (SE FOSSE OUTRA COISA, PRECISARIA ESCREVER)
-- NÃO PRECISA ADICIONAR DATA_CADASTRO PORQUE POR PADRÃO ELE IRÁ ADICIONAR HORA E DIA DO SISTEMA

-- COMANDOS PARA CRIAR O REGISTRO DA CIDADE
INSERT INTO cidade (nome,estado_id)
VALUES ('CURITIBA', 1);

-- COMO CONSULTAR A TABELA CIDADE
SELECT * FROM cidade;
