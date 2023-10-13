/*Criação da tabela, identificação dos campos e tipos de dados, além de 
artifícios de organização e tratamento (AUTO_INCREMENT, PRIMARY KEY, NOT NULL).*/

CREATE TABLE tab_prod (
    id_produto INT PRIMARY KEY AUTO_INCREMENT, /**/
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(4 , 2 ) NOT NULL,
    estoque INT(100) NOT NULL,			
    perecivel CHAR(1) NOT NULL,
    marca VARCHAR(50),
    nacionalidade CHAR(3)
);

/*Insersão de valores na tabela.*/
insert into tab_prod (nome,preco,estoque,perecivel,marca,nacionalidade) values
 ('arroz',10.50,85,'s','prato fino','BR'),
 ('arroz',8.50,47,'s','tio joao','BR'),
 ('sal',5.69,88,'n','lebre','BR'),
 ('chocolate',20.00,38,'s','toblerone','CH'),
 ('cafe',15.00,59,'s','melita','BR');

 /*Exibe informação das colunas selecionadas da tabela indicada. */
SELECT * FROM tab_prod;

/*Exibe o numero de linhas não nulas como "total_produtos" na tabela indicada.*/ 
SELECT COUNT(*)AS total_produtos FROM tab_prod;

/*Exibe a média da coluna "preco" como "preco_medio" da tabela indicada.*/
SELECT AVG(preco) AS preco_medio FROM tab_prod;

/*Exibe o calculo do preço medio da coluna "preco" como "preco_medio" dos produtos agrupados por "perecivel" na tabela indicada.*/
SELECT perecivel, AVG(preco) AS preco_medio
FROM tab_prod
GROUP BY perecivel;

/*Exibe nome e a media como "preco_medio" agrupados por nome na tabela indicada*/
SELECT nome, AVG(preco) AS preco_medio
FROM tab_prod
GROUP BY nome;

/*Exibe a media dos preços como "media_preco" e soma da coluna "estoque" como "total_estoque" da tabela indicada*/
SELECT AVG(preco) AS media_precos, SUM(estoque) AS total_estoque
FROM tab_prod;

/*Exibe nome,marca,estoque do produto mais caro na tabela indicada*/
SELECT nome, marca, estoque
FROM tab_prod
WHERE preco = (SELECT MAX(preco) FROM tab_prod);

/*Exibe todos os produtos que  estão acima da media.*/
SELECT *
FROM tab_prod
WHERE preco > (SELECT AVG(preco) FROM tab_prod);

/*Exibe a o numero de produtos como "quantidade" ordenando por nacionaliade na tabela indicada*/
SELECT nacionalidade, COUNT(*) AS quantidade
FROM tab_prod
GROUP BY nacionalidade;





