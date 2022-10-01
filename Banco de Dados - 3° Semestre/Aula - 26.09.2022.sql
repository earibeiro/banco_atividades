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
SELECT estado.nome
FROM estado, cliente, cidade
WHERE cliente.cidade_id = cidade.id
AND cidade.estado_id = estado.id
AND estado.ativo = 'S';

10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.
SELECT venda.*, funcionario.nome
FROM venda, funcionario
WHERE venda.funcionario_id = funcionario.id;

11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.
SELECT produto.nome, produto.preco_venda, unidade_medida.nome
FROM produto, unidade_medida
WHERE produto.unidade_medida_id = unidade_medida.id;

12.	Liste o nome dos produtos da marca "Coca-cola".
SELECT produto.nome
FROM produto, marca
WHERE produto.marca_id = marca.id
AND produto.marca_id = '1';

13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT cliente.nome nome_cliente, estado.nome nome_estado, produto.nome nome_produto
FROM cliente, estado, produto
WHERE produto.id = 10 AND estado.id = 2;


Semântica
1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
O JOIN deve ser utilizado sempre que houver interesse em realizar buscas em uma ou mais tabelas de uma única vez. As tabelas poder receber o JOIN quando existir
relacionamento entre elas, ou seja, uma deve possuir dependência(FOREIGN KEY) da outra.


2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter.
Uma condição de junção define o modo como duas tabelas são relacionadas em uma consulta por: Especificando a coluna de cada tabela a ser usada para a junção. 
Uma condição de junção típica especifica uma chave estrangeira de uma tabela e sua chave associada na outra tabela.


3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. 
Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.

O WHERE serve para filtrar dados em diferentes tabelas do banco de dados, enquanto o JOIN busca tão somente unir as colunas.

4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.
Resulta em uma combinação de todas as duplas entre as duas relações de entrada, e é utilizado quando se necessita obter dados presentes em duas ou mais relações.
O produto cartesiano é conhecido como conexão cruzada e resulta no cruzamento entre uma linha de uma tabela com todas as outras de outra tabela.
O JOIN realiza tal função quando utilizamos os comandos CROSS JOIN ou INNER JOIN.

5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?
Serão necessárias no mínimo 1586, vez que o valor para condições de junção é igual ao valor de (tabelas - 1).

 **/
