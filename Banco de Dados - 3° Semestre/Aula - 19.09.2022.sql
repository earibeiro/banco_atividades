-- 19/09/2022
-- Equipe: Aline Yuka Noguti; Eduardo Albuquerque Ribeiro; e Vitor Matheus Ferreira.

/** 
ATIVIDADE JOIN - EXERCÍCIO 01
**/

/** 
O que é?
O comando JOIN é utilizado quando é necessário combinar dados de duas ou mais tabelas em um único 
conjunto. Ou seja, a informação de diferentes tabelas será selecionada e disponibilizada na mesma busca. 

Teoria
Para que o comando JOIN funcione, são necessários alguns passos. O principal deles, para seu funcionamento, é que as condições
sejam verdadeiras. Caso contrário, os dados não retornarão conforme o esperado.  

Prática
SELECT tabela.coluna, table.column FROM table JOIN tabela ON table.table_id = table.id;
Inicialmente, o comando "select" selecionará as tabelas e as respectivas colunas. O comando FROM especifica a primeira
tabela e o comando JOIN seleciona a tabela que se unirá à primeira. O comando ON é um comando padrão SQL 92, tem por função
filtrar a tabela.

Ex.:
SELECT advogado.nome, contrato_advogado.contrato_de_honorarios_id FROM contrato_advogado 
JOIN advogado ON contrato_advogado.advogado_id = advogado.id;
**/
