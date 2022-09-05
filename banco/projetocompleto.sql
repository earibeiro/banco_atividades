DROP DATABASE IF EXISTS projetobd;
CREATE DATABASE projetobd;
USE projetobd;

CREATE TABLE pais (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
);

ALTER TABLE pais ADD CONSTRAINT pais_unico UNIQUE (nome); 
DESC pais;

INSERT INTO pais (nome)
VALUES ('BRASIL');
INSERT INTO pais (nome)
VALUES ('ARGENTINA');
INSERT INTO pais (nome)
VALUES ('ALEMANHA');

SELECT id,nome FROM pais;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM ('S','N') NOT NULL DEFAULT 'S'
,pais_id INT NOT NULL
,FOREIGN KEY (pais_id) REFERENCES pais(id)
);

INSERT INTO estado (nome, sigla,pais_id,ativo) 
VALUES ('PARANÁ', 'PR', 1,'S');
INSERT INTO estado (nome, sigla,pais_id,ativo)
VALUES ('SÃO PAULO','SP', 1,'S');
INSERT INTO estado (nome, sigla,pais_id,ativo)
VALUES ('MATO GROSSO','MT', 1,'S');

SELECT nome, sigla FROM estado;
SELECT * FROM estado;

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,estado_id INT NOT NULL
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
,FOREIGN KEY (estado_id) REFERENCES estado (id)
);

INSERT INTO cidade (nome, estado_id)
VALUES ('PARANAVAÍ', 1);
INSERT INTO cidade (nome, estado_id)
VALUES ('MARINGÁ', 1);
INSERT INTO cidade (nome, estado_id)
VALUES ('SÃO PAULO', 2);
INSERT INTO cidade (nome, estado_id)
VALUES ('CUIABÁ', 3);

SELECT id,nome, estado_id, ativo FROM cidade;

CREATE TABLE endereco(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,rua VARCHAR(255) NOT NULL
,numero CHAR(10)
,bairro VARCHAR(255) NOT NULL
,complemento VARCHAR (255)
,cidade_id INT NOT NULL
,FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

INSERT INTO endereco (rua,numero,bairro,complemento,cidade_id)
VALUES ('rua das flores',1010,'floresta','',1);
INSERT INTO endereco (rua,numero,bairro,complemento,cidade_id)
VALUES ('rua das pedras',5011,'pedreira','',1);
INSERT INTO endereco (rua,numero,bairro,complemento,cidade_id)
VALUES ('rua dos ninjas',3078,'konoha','',2);

SELECT * FROM endereco;


CREATE TABLE advogado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,e_mail VARCHAR(255) NOT NULL
,ddd_telefone VARCHAR(255) 
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,endereco_id INT NOT NULL
,FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

INSERT INTO advogado(id,nome,e_mail,ddd_telefone,ativo,endereco_id)
VALUES(NULL, 'João da Silva', 'jsilva@gmail.com','44999887766','S',3);
INSERT INTO advogado(id,nome,e_mail,ddd_telefone,ativo,endereco_id)
VALUES(NULL, 'Luisa Grego Rocha', 'lgrocha@yahoo.com','44999332211','S',1);
INSERT INTO advogado(id,nome,e_mail,ddd_telefone,ativo,endereco_id)
VALUES(NULL,'Julia dos Santos', 'julisantos@gmail.com','4499922557788','S',2);

SELECT nome FROM advogado;

CREATE TABLE numero_da_oab(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,numero_da_oab VARCHAR(45)
,estado_id INT NOT NULL
,advogado_id INT NOT NULL
,FOREIGN KEY (estado_id) REFERENCES estado(id)
,FOREIGN KEY (advogado_id) REFERENCES advogado(id) 
);

INSERT INTO numero_da_oab(numero_da_oab,estado_id,advogado_id)
VALUES ('89512',2,1);
INSERT INTO numero_da_oab(numero_da_oab,estado_id,advogado_id)
VALUES ('4894',3,3);
INSERT INTO numero_da_oab(numero_da_oab,estado_id,advogado_id)
VALUES ('65133',1,2);

SELECT numero_da_oab,estado_id FROM numero_da_oab;

CREATE TABLE cliente(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(20) NOT NULL UNIQUE
,rg VARCHAR(15) NOT NULL
,e_mail VARCHAR(50)
,data_nascimento DATE NOT NULL
,estado_civil VARCHAR(20) NOT NULL
,documentos_da_acao VARCHAR(255)
,endereco_id INT NOT NULL
,FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

INSERT INTO cliente (nome, cpf, rg, e_mail, data_nascimento, estado_civil, documentos_da_acao, endereco_id)
VALUES ('Naruto Uzumaki', '00600600666','123456789','narutinho123@gmail.com',05/09/1997,'casado','petição inicial, procuração, holerite',3);

INSERT INTO cliente (nome, cpf, rg, e_mail, data_nascimento, estado_civil, documentos_da_acao, endereco_id)
VALUES ('Ash Ketchum', '10550178933','123456798','mestrepkmn@gmail.com',10/12/1980,'solteiro','procuração, comprovante de endereço',1);

INSERT INTO cliente (nome, cpf, rg, e_mail, data_nascimento, estado_civil, documentos_da_acao, endereco_id)
VALUES ('Almondega Feroz', '2345678918','654987123','carninha@gmail.com',29/03/2002,'solteiro','comprovante de endereço',2);

SELECT nome FROM cliente;
