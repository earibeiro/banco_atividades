/**Crie uma base de dados;
Verifique se foi criado! Como?**/
CREATE DATABASE bd_projeto;
USE bd_projeto;

/**DROP bd_projeto; elimina a base de banco de dados
DROP IF EXISTS bd_projeto;**/
/** Com a base de dados criada, tente novamente criá-la **/

CREATE DATABASE bd_projeto;
/** Error Code: 1007. Can't create database "bd_projeto"; database exists**/

/** Elimine a base de dados criado; Verifique se foi criado!!! Como???**/
DROP DATABASE bd_projeto;
USE bd_projeto;

/** Com a base de dados eliminada, tente eliminar novamente! O que acontece? Explique **/
DROP DATABASE bd_projeto;
/** Error Code: 1008. Can't drop database "bd_projeto"; database doesn't exist **/

/** Elimine a base de dados utilizando IF EXISTS. O que acontece? Qual diferença? Que utilidade tem? **/
CREATE DATABASE nova_data;
USE nova_data;
DROP DATABASE IF EXISTS nova_data;
/** A base de dados somente será apagada se existir, caso não exista, o comando não realizará qualquer ação. **/
/** Serve para apagar uma database em específico, evitando o risco de apagar outra sem querer **/

CREATE DATABASE pizza_de_strogonofe;
USE pizza_de_strogonofe;
/**  **/


DROP DATABASE IF EXISTS cliente;
CREATE DATABASE cliente;
USE cliente;

CREATE TABLE cliente (
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(255) NOT NULL UNIQUE
,cpf VARCHAR(15) NOT NULL UNIQUE
);
