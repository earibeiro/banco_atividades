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
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE
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

INSERT INTO cidade (nome,estado_id)
VALUES ('BAURU', 2);

-- COMO CONSULTAR A TABELA CIDADE
SELECT * FROM cidade;

/**
>>>>> ALTERAÇÕES EM TABELAS <<<<<<<
CASO AINDA ESTEJA EM PRODUÇÃO, REALIZE AS ALTERAÇÕES DIRETO NA TABELA

SE A BASE DE DADOS JÁ ESTÁ PRODUZIDA, NECESSITA-SE UTILIZAR O ALTER - PODE DAR PROBLEMAS
**/

ALTER TABLE estado ADD COLUMN regiao INT;

SELECT * FROM estado; -- seleciona tudo com informações que possam não ser relevantes

DESCRIBE estado; -- apresenta informações sobre a tabela
DESC estado; -- é o describe encurtado

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(10);

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100);

-- ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL; -- Este comando dará erro, pois já existem inserções cujo campo é NULL

ALTER TABLE estado DROP COLUMN regiao; -- quando não existem valores inseridos nas inserções, é melhor apagar a coluna e refazê-la

-- ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' FIRST; -- FIRST fará a regiao aparecer na primeira posição

ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' AFTER nome; -- AFTER fará a regiao aparecer após a tabela indicada

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL AFTER sigla;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP CONSTRAINT estado_ativo_deve_ser_S_ou_N;
ALTER TABLE estado MODIFY COLUMN ativo ENUM('S', 'N') NOT NULL;

-- INSERT INTO estado (nome, sigla, ativo) VALUES ('MATO GROSSO', 'MT', 'A');

/**
COMANDOS DDL
DDL - Date Definition Language - Linguagem de Definição de Dados
Comandos que definem a estrutura
-> CREATE/ALTER/DROP TABLE
-> ALTER TABLE ADD/DROP/MODIFY/CHANGE

DML - DATA MANIPULATION LANGUAGE - LINGUAGEM DE MANIPULAÇÃO DE DADOS
Comandos que manipulam os dados
-> INSERT/UPDATE/DELETE/SELECT
**/

-- EXERCÍCIOS PARA ENTREGA

/*
DELETE e UPDATE - Lista de Exercícios
script: https://github.com/heliokamakawa/curso_bd/blob/master/03a-DELETE%20e%20UPDATE-%20script%20%20e%20aula.sql
*/

-- inserindo estados
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5);
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('ITAJAÍ',4);


-- OBSERVAÇÃO IMPORTANTE: TODO COMANDO UPDATE E DELETE DEVE SER INICIADO COM WHERE PARA EVITAR ESQUECIMENTOS!!!!

-- 1) Na inserção do estado, o usuário cometeu um erro, esquecendo de colocar acento. Neste contexto, escreva o comando para alterar o registro colocando acento. Sabe-se que o “id” do registro é “57”.
-- EXERCÍCIO PARA ALTERAR UMA COLUNA DE UM REGISTRO PELO ID
UPDATE estado SET nome = 'PARANÁ' WHERE id = 57;

-- 2) Faça o mesmo exercício anterior, porém, considerando que você não saiba do “id”.
-- EXERCÍCIO PARA ALTERAR O DADO DE UMA COLUNA DE UM REGISTRO PELO NOME
UPDATE estado SET nome = 'PARANÁ' WHERE estado.nome = 'PARANA';

-- 3) Escreva o comando que torne todos os estados ativos.
-- EXERCÍCIO PARA ALTERAR O DADO DE COLUNA DE TODOS OS REGISTROS – CUIDADO!
UPDATE estado SET ativo = 'S';

-- 4) Devido à falha de funcionamento do teclado, o registro com “id” 97 da tabela “cidade” ficou totalmente errado. Neste contexto, altere o registro com os seguintes dados: cidade → MARINGÁ, estado → PARANÁ, não é ATIVO e foi registrado em 15/11/2020.
-- EXERCÍCIO PARA ALTERAR VÁRIAS COLUNAS DE UM REGISTRO

-- verificando o id do paraná
SELECT id FROM estado WHERE nome = 'PARANÁ'; 

-- comando para alterar
UPDATE cidade SET
nome = 'MARINGÁ'
, estado_id = 15
, ativo = 'N'
, data_cadastro = '2020-11-15'
WHERE id = 97;

SELECT * FROM cidade WHERE id = 97; -- conferindo se deu certo

-- 5) Escreva o comando para excluir o registro do estado com o nome “PARANÁ”. Sabe-se que o “id” do registro é “57”.
-- EXERCÍCIO PARA EXCLUIR UM REGISTRO PELO ID
DELETE FROM estado WHERE id = 57;

-- 6) Faça o mesmo exercício anterior, porém, considerando que você não saiba do “id”.
-- EXERCÍCIO PARA EXCLUIR UM REGISTRO PELO NOME – CUIDADO!
DELETE FROM estado WHERE nome = 'PARANÁ';

-- 7) Elimine todos os registros da tabela cliente.
-- EXERCÍCIO PARA EXCLUIR TODOS IS REGISTROS – CUIDADO!
DELETE FROM cliente;
 
-- 8) Escreva o comando para excluir o registro do estado com o id “23”. Sabe-se que, este estado possui VÁRIAS cidades cadastradas.
-- EXERCÍCIO PARA EXCLUIR UM REGISTRO QUE POSSUI RELACIONAMENTO

DELETE FROM estado WHERE id = 23; -- dá erro porque tem relacionamento
/*
>> Então como proceder?
Para excluir o estado com id 23, primeiro, será necessário excluir todas as cidades cadastradas que possui o relacionamento com este estado.
Então verifique se realmente se é para fazer isto!!! Se sim, segue os comandos...
*/

-- eliminando todas as cidade que possuem a FK/referência do estado com id 23
DELETE FROM cidade WHERE cidade_id = 23;

-- agora sim, eliminando o estado com id 23
DELETE FROM estado WHERE id = 23;

/**
AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole, digite os comandos e mentalize o que está fazendo na medida que digita cada comando. 
Uma dica importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos.
*/

-- 9.	Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela utilizando como filtro, o Primary Key.
UPDATE estado SET nome = 'PARAÍBA' WHERE id = 4;
DESC estado; -- não é esse
SELECT nome FROM estado;
SELECT id,nome FROM estado ORDER BY id; -- order by coloca em ordem numérica

-- 10.	Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
UPDATE estado SET nome = 'PARAÍBA', sigla = 'PB' WHERE nome = 'PARAÍBA';
SELECT id,nome,sigla FROM estado ORDER BY id;

-- 11.	Alter o valor de uma coluna de todos os registros.
SELECT * FROM estado;
UPDATE estado SET regiao_estado = 'TESTE';
SELECT * FROM estado;
UPDATE estado SET regiao_estado = 'VALOR NÃO INFORMADO';
SELECT * FROM estado;

-- 12.	Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM cidade WHERE nome = 'PARANAVAÍ';
SELECT * FROM cidade;

-- 13.	Escreva todos os comandos necessários para excluir o cliente com o id “38”.
-- Não há cliente nestas tabelas, porém a fim de apenas apresentar como ocorreria.
DELETE FROM cliente WHERE id = 38;

-- Como aqui neste caso estudamos cidade e estado, um exemplo de cidade
DELETE FROM cidade WHERE id = 38;
