/**
DESAFIO BANCO DE DADOS

Grupo: Aline Yuka Noguti, Eduardo Albuquerque Ribeiro, Vitor Mateus Ferreira
 
Sintaxe
1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado.
 SELECT cidade.nome, estado.sigla 
 FROM cidade, estado 
 WHERE cidade.estado_id = estado.id

2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. 
SELECT cidade.nome, estado.sigla 
FROM cidade, estado 
WHERE cidade.ativo = 'S' 
AND cidade.estado_id = estado.id;

3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. 
SELECT cliente.nome, cidade.nome 
FROM cliente, cidade
WHERE cliente.cidade_id = cidade.id;

4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.
SELECT cliente.nome, cidade.nome 
FROM cliente, cidade
WHERE cliente.cidade_id = cidade.id 
AND cidade.id = 6;

5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.
SELECT cidade.nome, estado.sigla 
FROM cidade, estado 
WHERE cidade.ativo = 'S' 
AND cidade.estado_id = estado.id;

6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. 
SELECT funcionario.nome, cidade.nome 
FROM funcionario, cidade
WHERE funcionario.cidade_id = cidade.id;

7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. 
SELECT funcionario.nome, estado.sigla
FROM funcionario, estado, cidade
WHERE funcionario.cidade_id = cidade.id
AND cidade.estado_id = estado.id;

8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.
SELECT funcionario.nome, estado.sigla
FROM funcionario, estado, cidade
WHERE funcionario.cidade_id = cidade.id
AND cidade.estado_id = estado.id
AND (estado.id = 1 OR estado.id = 4 OR estado.id = 5); 

9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.


10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
12.	Liste o nome dos produtos da marca "Coca-cola".
13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
Semântica

1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. 
3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.
4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.
5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?
 **/
