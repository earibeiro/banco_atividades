DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE estado( 				-- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S' -- O ENUM RESTRINGE AS OPÇÕES DE ESCOLHA
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) 
VALUES (DEFAULT,'PARANÁ','PR','S','2022-09-03');

INSERT INTO estado (id,nome,sigla,ativo,data_cadastro)
VALUES (DEFAULT,'SÃO PAULO','SP',DEFAULT, DEFAULT);

INSERT INTO estado (nome,sigla) 
VALUES ('MATO GROSSO','MT');

INSERT INTO estado 
VALUES (DEFAULT,'PARAÍBA','PB','S','2022-09-03');

INSERT INTO estado (nome,sigla) 
VALUES('MARANHÃO','MA');

-- INSERT INTO estado (nome,sigla) 
-- VALUES('MARANHÃO','MA');

-- INSERT INTO estado
-- VALUES ('ALAGOAS','AL','S','2022-09-03'); -- ESSE AQUI DÁ ERRO POIS FALTA O ID!

SELECT * FROM estado;

INSERT INTO cidade (nome,estado_id) 
VALUES ('CURITIBA',1);

INSERT INTO cidade (nome,estado_id)
VALUES ('BAURU', 2);

INSERT INTO cidade (nome,estado_id)
VALUES ('LONDRINA',1);

INSERT INTO cidade (nome,estado_id)
VALUES ('CRUZEIRO DO OESTE',1), ('UMUARAMA',1), ('LOVAT',1);

-- INSERT INTO cidade (nome,estado_id)
-- VALUES ('CASCAVEL',22); -- Erro, pois o ID informado é inexistente!

-- INSERT INTO estado (sigla) VALUES ('CE'); -- DARÁ ERRO, POIS O NOME É 'NOT NULL', ENTÃO É NECESSÁRIO PREENCHER

SELECT * FROM cidade;

/*
INSERT -Lista Exercício 
Caso queira fazer na prática, execute o script do link: https://github.com/heliokamakawa/curso_bd/blob/master/05a-SELECT%20-%20script%20aula.sql
*/

-- 1) Escreva o comando para inserir um registro da tabela estado com todas as colunas. 
INSERT INTO estado VALUES (NULL,'ACRE','AC','S','2021-05-01'); 
/* 
Como id é um campo com auto incremento, definimos NULL no comando.
Como estamos inserindo todas as colunas não precisamos informar a descrição das colunas. 
Porém, devemos informar os dados na sequência correta 
**/ 

-- 2) Escreva o comando para inserir um registro da tabela estado, definindo todos os dados, exceto a  chave primária que é auto incremento.  
INSERT INTO estado (nome,sigla,ativo,data_cadastro) 
VALUES ('ALAGOAS','AL','S','2021-05-02'); 
-- Como não estamos informando todos os dados, é necessário especificar de quais colunas são 

-- 3) Escreva o comando para inserir um registro da tabela estado, definindo somente os dados  necessários.  
INSERT INTO estado (nome,sigla) VALUES ('AMAPÁ','AP'); 
/** 
id → não precisa informar porque é auto incremento  
ativo e data_cadastro → não precisa informar porque possui o valor padrão  
**/ 

-- 4) Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
-- O registro de uma cidade requer a referência do estado (cidade é dependente  do estado). Assim, é necessário, primeiro, fazer a inserção dos estados. 
INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'ACRELANDIA',1,'S','2021-04-28'); 
INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('ASSIS  BRASIL',1,'S','2021-03-14'); 
INSERT INTO cidade (nome,estado_id) VALUES ('BRASILEIA',1);

-- AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole,  digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica  importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente  consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos. 
-- 5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
INSERT INTO estado (id,nome, sigla, ativo, data_cadastro)
VALUES (DEFAULT,'RIO GRANDE DO SUL', 'RS', DEFAULT, DEFAULT)
,(DEFAULT,'SANTA CATARINA','SC', DEFAULT, DEFAULT)
,(DEFAULT,'MINAS GERAIS','MG', DEFAULT, DEFAULT);

-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
INSERT INTO estado (nome, sigla, ativo, data_cadastro)
VALUES ('MATO GROSSO DO SUL','MS','S','2022-09-03')
,('RIO GRANDE DO NORTE','RN','S','2022-09-03');

-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
INSERT INTO estado (nome, sigla)
VALUES ('AMAZONAS','AM'), ('PARÁ','PA'); -- Todos os outros campos são DEFAULT, então não tem problema não adicioná-los aqui.  

-- 8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
INSERT INTO cidade (id,nome,estado_id,data_cadastro)
VALUES (10,'JOÃO PESSOA',4,'2022-09-03');
INSERT INTO cidade (nome,estado_id,data_cadastro)
VALUES ('CAMPINA GRANDE',4,'2022-09-03');
INSERT INTO cidade (nome,estado_id)
VALUES ('AREIA',4);

-- 9. Faça a inserção de 2 registros de cliente.  
INSERT INTO cliente (id, nome, cpf, telefone)
VALUES (1, 'Naruto Uzumaki','00100100101','55999887766')
,(2,'Ichigo Kurosaki','00200200202','55988776655');

-- 10. DESAFIO!!! Tente fazer todas as inserções necessárias para que se tenha um item de caixa. Na medida  que esteja digitando o código, tente associar os dados inseridos com o contexto real.

SELECT * FROM cidade;
SELECT * FROM estado;



