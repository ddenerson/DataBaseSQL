
-- 1° PRIMEIRA LISTA DE EXERCICIO - PARTE UM - PART ONE OF EXERCISES -------------------------------------------------------

-- 1

ALTER TABLE estado
ALTER nmestado TYPE varchar(20);

INSERT INTO estado(sgestado, nmestado)
VALUES('SP','SAO PAULO'),
      ('RJ','RIO DE JANEIRO');

-- 2

ALTER TABLE cidade
ALTER nmcidade TYPE varchar(20);

INSERT INTO cidade (cdcidade, nmcidade, fk_sgestadocid)
VALUES (1, 'SAO PAULO', 'SP'),
       (2, 'SANTO ANDRE', 'SP'),
       (3, 'CAMPINAS', 'SP'),
       (1, 'RIO DE JANEIRO', 'RJ'),
       (2, 'NITEROI', 'RJ');

-- 3

INSERT INTO bairro(cdbairro, nmbairro, fk_cdcidadeba, fk_sgestadoba)
VALUES(1,'JARDINS',1,'SP'),
      (2,'MORUMBI',1,'SP'),
      (3,'AEROPORTO',1,'SP'),
      (1,'AEROPORTO',1,'RJ'),
      (2,'FLAMENGO',1,'RJ');


-- 4

ALTER TABLE vendedor ADD endereco varchar(30);
ALTER TABLE vendedor ALTER endereco TYPE varchar(30);
ALTER TABLE vendedor ALTER email TYPE varchar(30);
ALTER TABLE vendedor ALTER nmvendedor TYPE varchar(30);
 

INSERT INTO vendedor(cdvendedor,nmvendedor,endereco,email)
VALUES(1,'MARIA DA SILVA','RUA DO GRITO,45','msilva@mednet.com.br'),
      (2,'MARCOS ANDRADE','AV. DA SAUDADE, 325','mandrade@mednet.com.br'),
      (3,'ANDRE CARDOSO','AV. BRASIL, 401','acardoso@mednet.com.br'),
      (4,'TATIANA SOUZA','RUA DO IMPERADOR','tsouza@mednet.com.br');

-- 5

INSERT INTO imoveis(cdimovel,fk_cdvendedormo,fk_cdbairromo,fk_cidademo,fk_sgestadomo, rua, numero, nrareautil, area_total, vlpreco)
VALUES (1,1,1,1,'SP','AL TIETE',3304,250,400,180000);

INSERT INTO imoveis(cdimovel,fk_cdvendedormo,fk_cdbairromo,fk_cidademo,fk_sgestadomo, rua, numero, nrareautil, area_total, vlpreco,imovel_indicado)
VALUES (2,1,2,1,'SP','AV MORUMBI',2230,150,250,135000,1),
       (3,2,1,1,'RJ','R GAL OSORIO',445,250,400,185000,2),
       (4,2,2,1,'RJ','R PEDRO I',882,120,200,110000,1),
       (5,3,3,1,'SP','AV RUBEM BERTA',2355,110,200,95000,4),
       (6,4,1,1,'RJ','R GETULIO VARGAS',552,200,300,99000,5);

-- 6 

ALTER TABLE comprador ALTER endereco TYPE varchar(30);
ALTER TABLE comprador ALTER email TYPE varchar(30);
ALTER TABLE comprador ALTER nmcomprador TYPE varchar(30);


INSERT INTO comprador(cdcomprador, nmcomprador,endereco,email)
VALUES(1,'EMMANUEL ANTUNES','R SARAIVA 452','eantunes@terra.com.br'),
      (2,'JOANA PEREIRA','AV. PORTUGAL 52','jpereira@yahoo.com.br'),
      (3,'RONALDO COMPELO','R ESTADOS UNIDOS 790','rcampelo@terra.com.br'),
      (4,'MANFRED AUGUSTO','AV. BRASIL 351','maugusto@gmail.com');


--- 7

INSERT INTO oferta(fk_cdcompradorof,fk_cdimovelof, vloferta, dtoferta)
VALUES(1,1,170000,'10-01-02'),
      (1,3,180000,'10-01-02'),
      (2,2,135000,'15-02-02'),
      (2,4,100000,'15-02-02'),
      (3,1,160000,'05-01-02'),
      (3,2,140000,'20-02-02');


-- 8. Aumente o preço de venda dos imóveis em 10%

UPDATE imoveis
SET vlpreco = (180000 * 0.10)+ 180000
WHERE cdimovel = 1;

UPDATE imoveis
SET vlpreco = ( 135000 * 0.10)+ 135000
WHERE cdimovel = 2;

UPDATE imoveis
SET vlpreco = ( 185000 * 0.10)+ 185000
WHERE cdimovel = 3;

UPDATE imoveis
SET vlpreco = ( 110000 * 0.10)+ 110000
WHERE cdimovel = 4;

UPDATE imoveis
SET vlpreco = ( 95000 * 0.10)+ 95000
WHERE cdimovel = 5;

UPDATE imoveis
SET vlpreco = ( 99000 * 0.10)+ 99000
WHERE cdimovel = 6;

-- 9 Abaixe o preço de venda dos imóveis do vendedor 1 em 5%.

UPDATE imoveis
SET vlpreco = 198000 - (198000  * 0.05) 
WHERE cdimovel = 1;


-- 10 Aumente em 5% o valor das ofertas do comprador 2.

UPDATE imoveis
SET vlpreco = (148500  * 0.05) + 148500
WHERE cdimovel = 2;

-- 11 Altere o endereço do comprador 3 para RANANÁS, 45 e o estado para RJ

UPDATE comprador
SET rua = 'RANANÁS'
WHERE cdcomprador = 3;

UPDATE comprador
SET numero = 45
WHERE cdcomprador = 3;

UPDATE comprador
SET estado_comp = 'RJ'
WHERE cdcomprador = 3;

-- 12 Altere a oferta do comprador 2 no imóvel 4 para 101.000

UPDATE oferta
SET vloferta = 101000
WHERE fk_cdimovelof = 4



-- 13 Exclua a oferta do comprador 3 no imóvel 1


UPDATE oferta
SET vloferta = 0
WHERE fk_cdcompradorof = 3 and fk_cdimovelof = 1;


-- 14 Exclua a cidade 3 do Estado SP.


UPDATE cidade
SET nmcidade= '-'
WHERE cdcidade = 3;


-- 15 Liste todos os campos e linhas da tabela BAIRRO

SELECT * FROM bairro;

-- 16 Liste todas as linhas e os campos CDCOMPRADOR, NMCOMPRADOR e EMAIL da tabela COMPRADOR

SELECT cdcomprador,
       nmcomprador,
       email
FROM comprador;

-- 17  Liste todas as linhas e os campos CDVENDEDOR, NMVENDEDOR e EMAIL da tabela VENDEDOR em ordem alfabética.

SELECT cdvendedor,
       nmvendedor,
       email
FROM vendedor;

-- 18  Repita o comando anterior em ordem alfabética decrescente.

SELECT cdvendedor,
       nmvendedor,
       email
FROM vendedor
ORDER BY cdvendedor DESC;

-- 19 Liste todos os bairros do Estado de SP.

SELECT *
FROM bairro
WHERE fk_sgestadoba = 'SP';

-- 20 Liste as colunas CDIMOVEL, CDVENDEDOR e VLPRECO de todos os imóveis do vendedor 2


SELECT cdimovel,
       fk_cdvendedormo,
       vlpreco
FROM imoveis
WHERE fk_cdvendedormo = 2;


-- 21 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
--    imóveis cujo preço de venda seja inferior a 150 mil e sejam do estado do RJ

SELECT cdimovel,
       fk_cdvendedormo,
       fk_sgestadomo,
       vlpreco
FROM imoveis
WHERE vlpreco < 150000
  AND fk_sgestadomo = 'RJ';

-- 22 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
-- imóveis cujo preço de venda seja inferior a 150 mil ou seja do vendedor 1

SELECT cdimovel,
       fk_cdvendedormo,
       fk_sgestadomo,
       vlpreco
FROM imoveis
WHERE vlpreco < 150000;

-- 23 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
-- imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.

SELECT cdimovel,
       fk_cdvendedormo,
       fk_sgestadomo,
       vlpreco
FROM imoveis
WHERE vlpreco < 150000 and fk_cdvendedormo != 2;

-- 24 Liste as colunas CDCOMPRADOR, NMCOMPRADOR, NMENDERECO e SGESTADO da tabela COMPRADOR em que o Estado seja nulo

SELECT cdcomprador,
       nmcomprador,
       rua
FROM comprador
WHERE estado_comp = NULL;

-- 25 Liste as colunas CDCOMPRADOR, NMCOMPRADOR, NMENDERECO e SGESTADO da tabela COMPRADOR em que o Estado não seja nulo.

SELECT cdcomprador,
       nmcomprador,
       rua
FROM comprador
WHERE estado_comp !=NULL;


-- 26 Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil

SELECT *
FROM oferta
WHERE vloferta > 100000
  AND vloferta < 150000;


-- 27 Liste todas as ofertas cuja data da oferta esteja entre ‘01/02/02’ e ‘01/03/02’


SELECT *
FROM oferta
WHERE dtoferta BETWEEN '01-02-02' AND '01-03-02';


-- 28 Liste todos os vendedores que comecem com a letra M

SELECT *
FROM vendedor
WHERE nmvendedor = '%M%';


-- 29 Liste todos os vendedores que tenham a letra A na segunda posição do nome 


SELECT *
FROM vendedor
WHERE nmvendedor = 'M%';

-- 30 Liste todos os compradores que tenham a letra U em qualquer posição do endereço.

SELECT *
FROM vendedor
WHERE endereco = '%U%';


-- 31 Liste todas as ofertas cujo imóvel seja 1 ou 2


SELECT fk_cdimovelof,
       vloferta AS oferta,
       dtoferta
FROM oferta
WHERE fk_cdimovelof = 1
  OR fk_cdimovelof = 2;


-- 32 Liste todos os imóveis cujo código seja 2 ou 3 em ordem alfabética de endereço

SELECT *
FROM imoveis
WHERE cdimovel = 2
  OR cdimovel = 3 order by rua;

-- 33 Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 140 mil, em ordem decrescente de data


SELECT *
FROM oferta
WHERE fk_cdimovelof = 2
  OR fk_cdimovelof = 3
  AND vloferta > 140000
ORDER BY dtoferta DESC;


-- 34 Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil.

SELECT *
FROM imoveis
WHERE vlpreco >= 110000
  AND vlpreco <= 200000
ORDER BY nrareautil;

-- 35 Escreva uma busca que mostre CDIMOVEL, VLPRECO e VLPRECO com 10% de aumento

SELECT cdimovel,
       vlpreco * 0.110 AS aumento_valor_preco
FROM imoveis;


-- 36 / 37 Escreva uma busca igual à anterior, porém acrescente uma coluna mostrando a diferença entre VLPRECO e VLPRECO com 10% de aumento

SELECT cdimovel,
       vlpreco,
       vlpreco * 0.110 AS aumento_valor_preco
FROM imoveis;

-- 38 Escreva uma busca que mostre o NMVENDEDOR em letras maiúsculas e Email em letras minúsculas

SELECT cdvendedor,
       upper(nmvendedor) as nome_vendedor,
       lower(email) as nome_email
FROM vendedor;



-- 39 Escreva uma busca que mostre o NMCOMPRADOR e NMCIDADE em uma única coluna e separados por um hífen

SELECT nmvendedor || '-' || email as nome_email
FROM vendedor;



 -- 40 Escreva uma busca que mostre todos os compradores que tenham a letra A no nome


SELECT *
FROM comprador
WHERE nmcomprador = '%A%';


 -- 41 Escreva uma busca que mostre todos os compradores que o campo nome dos compradores não seja nulo

SELECT *
FROM comprador
WHERE nmcomprador != NULL;

-- 42 Escreva uma busca que mostre todos os imóveis do estado de São Paulo

SELECT *
FROM imoveis
WHERE fk_sgestadomo = 'SP';


-- 43 Escreva uma busca que mostre todos os imóveis com preço maior que 100000 Reais


SELECT *
FROM imoveis
WHERE vlpreco > 100000;


-- 44 Escreva uma busca que mostre o NMVENDEDOR, NMENDERECO e NMCIDADE da cidade de Ribeirão Preto e estado de São Paulo


SELECT nmvendedor,
       nmendereco,
       nmcidade
WHERE nmcidade = 'riberao preto'
  AND nmestado = 'sao paulo';

-- 45 Escreva uma busca que mostre o imóvel localizado no estado de São Paulo ou o estado Minas Gerais.

SELECT *
FROM imoveis
WHERE fk_sgestadomo = 'RJ'
  OR fk_sgestadomo = 'SP';

-- 46 Faça uma busca que mostre CDIMOVEL, CD VENDEDOR, NMVENDEDOR e SGESTADO;

SELECT cdimovel,
       fk_cdvendedormo,
       nmvendedor,
       fk_sgestadomo
FROM imoveis
LEFT JOIN vendedor ON fk_cdvendedormo = vendedor.cdvendedor;

-- 47  Faça uma busca que mostre CDCOMPRADOR, NMCOMPRADOR, CDIMOVEL e VLOFERTA 

SELECT cdcomprador,
       nmcomprador,
       cdimovel,
       vloferta
FROM oferta
LEFT JOIN comprador ON oferta.fk_cdcompradorof = comprador.cdcomprador
LEFT JOIN imoveis ON oferta.fk_cdimovelof = imoveis.cdimovel;

-- 48 Faça uma busca que mostre CDIMOVEL, VLPRECO e NMBAIRRO, cujo código do vendedor seja 2

SELECT cdimovel,
       vlpreco,
       nmbairro
FROM imoveis
LEFT JOIN bairro ON imoveis.fk_cdbairromo = bairro.cdbairro
LEFT JOIN vendedor ON imoveis.fk_cdvendedormo = vendedor.cdvendedor
WHERE cdvendedor = 2;

-- 49 Faça uma busca que mostre todos os imóveis que tenham ofertas cadastradas

SELECT *
FROM oferta
LEFT JOIN imoveis ON oferta.fk_cdimovelof = imoveis.cdimovel;

-- 50 Faça uma busca que mostre os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel

SELECT *
FROM oferta
INNER JOIN imoveis ON oferta.fk_cdimovelof = imoveis.cdimovel;

-- 51 Faça uma busca que mostre todos os compradores e as respectivas ofertas realizadas por eles

SELECT *
FROM oferta
LEFT JOIN comprador ON oferta.fk_cdcompradorof = comprador.cdcomprador;

-- 52 Faça a mesma busca, porém acrescentando os compradores que ainda não fizeram ofertas para os imóveis;

SELECT *
FROM oferta
INNER JOIN comprador ON oferta.fk_cdcompradorof = comprador.cdcomprador;

-- 53 Faça uma busca anterior o nome dos vendedores de imóveis e os endereços dos imóveis indicados;

SELECT nmvendedor,
       rua || '-' || numero AS endereco
FROM imoveis
LEFT JOIN vendedor ON imoveis.fk_cdvendedormo = vendedor.cdvendedor;

-- 54 Acrescente à busca anterior o nome dos vendedores tanto do imóvel quanto do imóvel indicado


SELECT cdimovel,
       nmvendedor,
       rua || '-' || numero AS endereco
FROM imoveis
LEFT JOIN vendedor ON imoveis.fk_cdvendedormo = vendedor.cdvendedor;


-- 55 * Faça uma busca que mostre o endereço do imóvel, o bairro e o nível de preço do imóvel


SELECT rua || '-'|| numero AS endereco,
       nmbairro,
       vlpreco
FROM imoveis
LEFT JOIN bairro ON imoveis.fk_cdbairromo = bairro.cdbairro;


-- 56 Verifique a maior, a menor e o valor médio das ofertas da tabela

SELECT max(vloferta) AS maximo,
       min(vloferta) AS minimo,
       avg(vloferta) AS media
FROM oferta;


-- 57 


-- 58 

-- 59 Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.


SELECT max(vlpreco) AS maximo,
       min(vlpreco) AS minimo,
       avg(vlpreco) AS media
FROM imoveis;


-- 60 Modifique o comando anterior para que seja mostrados os mesmos índices por bairro

SELECT max(cdbairro) AS maximo,
       min(cdbairro) AS minino,
       avg(cdbairro) AS media
FROM bairro;


-- 61 Faça uma busca que retorne o total de imóveis por vendedor. Apresente em ordem total de imóveis


SELECT i.cdimovel,
       v.nmvendedor
FROM imoveis i,vendedor v
WHERE i.fk_cdvendedormo = v.cdvendedor
GROUP BY i.cdimovel,v.nmvendedor ;


-- 62 Verifique a diferença de preços entre o maior e o menor imóvel da tabela

SELECT vlpreco,
       MAX(vlpreco) - MIN(vlpreco)
FROM imoveis;



-- 63 Mostre o código do vendedor e o menor preço de imóvel dele no cadastro. Exclua da busca os valores de imóveis inferiores a 10 mil

SELECT cdvendedor,
       MIN(vlpreco)
WHERE vlpreco < 10000
  FROM vendedor
  JOIN imoveis ON vendedor.cdvendedor = imoveis.fk_cdvendedormo;



-- 64 Mostre o código e o nome do comprador e a média do valor das ofertas e o número de ofertas deste comprador

SELECT cdcomprador,
       nmcomprador,
       avg(vloferta)
FROM comprador
JOIN oferta ON comprador.cdcomprador = oferta.fk_cdcompradorof GROUP BY cdcomprador;



-- 65 Faça uma busca que retorne o total de ofertas realizadas nos anos de 2000, 2001 e 2002

SELECT count(*)
FROM oferta
WHERE dtoferta BETWEEN '2000-01-01' AND '2002-12-30'; 



-- LISTA 2 DE EXERCICIOS - PARTY TWO OF EXERCISES -------------------------------------------------------------



-- 1 Liste todos os campos e linhas da tabela BAIRRO

SELECT * FROM BAIRRO;



-- 2 Liste todas as linhas e os campos CDCOMPRADOR, NMCOMPRADOR e EMAIL da tabela COMPRADOR


SELECT cdcomprador,
       nmcomprador,
       email
FROM comprador;

-- 3 Liste todas as linhas e os campos CDVENDEDOR, NMVENDEDOR e EMAIL da tabela VENDEDOR em ordem alfabética


SELECT cdvendedor,
       nmvendedor,
       email
FROM vendedor;	   


-- 4 Repita o comando anterior em ordem alfabética decrescente


SELECT cdvendedor,
       nmvendedor,
	   email
FROM vendedor ORDER BY nmvendedor DESC;

-- 5 Liste todos os bairros do Estado de SP

SELECT * FROM bairro;


-- 6 Liste as colunas CDIMOVEL, CDVENDEDOR e VLPRECO de todos os imóveis do vendedor 2.


SELECT cdimovel,
	   fk_cdvendedormo,
	   vlpreco
FROM imoveis WHERE fk_cdvendedormo = 2;


-- 7 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
-- imóveis cujo preço de venda seja inferior a 150 mil e sejam do estado do RJ


SELECT cdimovel,
       fk_cdvendedormo,
       vlpreco,
       fk_sgestadomo
FROM imoveis
WHERE vlpreco <= 150000
  AND fk_sgestadomo = 'RJ';


-- 8 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
-- imóveis cujo preço de venda seja inferior a 150 mil ou seja do vendedor 1


SELECT cdimovel,
       fk_cdvendedormo,
       vlpreco,
       fk_sgestadomo
FROM imoveis
WHERE vlpreco <= 150000
  AND fk_cdvendedormo = 1;


-- 9 Liste as colunas CDIMOVEL, CDVENDEDOR, VLPRECO e SGESTADO dos
-- imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2


SELECT cdimovel,
       fk_cdvendedormo,
       vlpreco,
       fk_sgestadomo
FROM imoveis
WHERE vlpreco <= 150000
  AND fk_cdvendedormo != 2;

-- 10 Liste as colunas CDCOMPRADOR, NMCOMPRADOR, NMENDERECO e SGESTADO da tabela COMPRADOR em que o Estado seja nulo.

SELECT cdcomprador,
       nmcomprador,
       endereco,
       estado
FROM comprador
WHERE estado = null;


-- 11 Liste as colunas CDCOMPRADOR, NMCOMPRADOR, NMENDERECO e SGESTADO da tabela COMPRADOR em que o Estado não seja nulo

SELECT cdcomprador,
       nmcomprador,
       endereco,
       estado
FROM comprador
WHERE estado != null;

-- 12 Liste dotas as ofertas cujo valor esteja entre 100 mil e 150 mil

SELECT * FROM oferta WHERE vloferta > 100000 AND vloferta < 150000;


-- 13 Liste todas as ofertas cuja data da oferta esteja entre ‘01/02/02’ e ‘01/03/02’

SELECT * FROM oferta WHERE dtoferta = '01/02/02' AND dtoferta = '01/03/02';


-- 14 Liste todos os vendedores que comecem com a letra M


SELECT nmvendedor FROM vendedor WHERE nmvendedor = '%M%';


-- 15 Liste todos os vendedores que tenham a letra A na segunda posição do nome


SELECT nmvendedor FROM vendedor WHERE nmvendedor = 'A%';


-- 16 Liste todos os compradores que tenham a letra U em qualquer posição do endereço

SELECT * FROM comprador WHERE endereco = '%U%';

-- 17 Liste todas as ofertas cujo imóvel seja 1 ou 2.

SELECT count(*)
FROM oferta
WHERE fk_cdimovelof IN(1,2);

-- 18 Liste todos os imóveis cujo código seja 2 ou 3 em ordem alfabética de endereço

SELECT *
FROM imoveis
WHERE cdimovel IN(2,3)
ORDER BY rua ASC; 

-- 19 Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que
-- 140 mil, em ordem decrescente de data.

SELECT *
FROM oferta
WHERE fk_cdimovelof IN(2,3)
AND vloferta > 140000
ORDER BY dtoferta DESC;

-- 20 Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja
do vendedor 1 em ordem de área útil.

SELECT *
FROM imoveis
WHERE vlpreco IS BETWEEN 110000 AND 200000
ORDER BY nrareautil;

-- 21 Escreva uma busca que mostre CDIMOVEL, VLPRECO e VLPRECO com 10% de aumento 


SELECT fk_cdimovelof,
       vloferta,
       (vloferta * 0.110) AS aumento
FROM oferta;


-- 22 Escreva uma busca igual à anterior, porém acrescente uma coluna mostrando a
-- diferença entre VLPRECO e VLPRECO com 10% de aumento.


SELECT fk_cdimovelof,
	vloferta,
        (vloferta * 0.110)  AS aumento,
	vloferta - (vloferta * 0.110) AS diferencia
FROM oferta;

-- 23  Escreva uma busca que mostre o NMVENDEDOR em letras maiúsculas e Email
-- em letras minúsculas.

SELECT upper(nmvendedor) as nome_vendedor,
       lower(email) as email
FROM vendedor;


-- 24 Escreva uma busca que mostre o NMCOMPRADOR e NMCIDADE em uma única coluna e separados por um hífen.

SELECT nmcomprador || '-' || cidade AS informacao
FROM comprador;


-- 25 Escreva uma busca que mostre todos os compradores que tenham a letra A no nome.

SELECT *
FROM comprador
WHERE nmcomprador = '%A%';

-- 26 Escreva uma busca que mostre todos os compradores que o campo nome dos compradores não seja nulo 

SELECT *
FROM comprador
WHERE nmcomprador != NULL;

-- 27 Escreva uma busca que mostre todos os imóveis do estado de São Paulo

SELECT *
FROM imoveis
WHERE fk_sgestadomo = 'SP';


-- 28 Escreva uma busca que mostre todos os imóveis com preço maior que 100000 Reais.

SELECT *
FROM imoveis
WHERE vlpreco > 100000;

-- 29 Escreva uma busca que mostre o NMVENDEDOR, NMENDERECO e 
-- NMCIDADE da cidade de Ribeirão Preto e estado de São Paulo.

SELECT nmvendedor,
       endereco,
       nmcidade
FROM vendedor
WHERE nmcidade = 'Ribeirão Preto'
  AND nmcidade = 'São Paulo';

-- 30 Escreva uma busca que mostre o imóvel localizado no estado de São Paulo ou o estado Minas Gerais.
  
SELECT *
FROM imoveis
WHERE fk_sgestadomo IN('SP','MG');


-- 31 Faça uma busca que mostre CDIMOVEL, CD VENDEDOR, NMVENDEDOR,NMVENDEDOR e SGESTADO;

SELECT cdimovel,
       cdvendedor,
       nmvendedor,
       sgestado
FROM estado  e,
     imoveis i,
     vendedor v
WHERE e.sgestado = i.fk_sgestadomo AND  i.fk_cdvendedormo = v.cdvendedor;


-- 32 Faça uma busca que mostre CDCOMPRADOR, NMCOMPRADOR,CDIMOVEL e VLOFERTA;

SELECT cdcomprador,
	   nmcomprador,
	   cdimovel,
	   vloferta
FROM oferta o,
	 comprador c,
	 imoveis i
WHERE o.fk_cdcompradorof = c.cdcomprador AND  o.fk_cdimovelof = i.cdimovel


-- 33 Faça uma busca que mostre CDIMOVEL, VLPRECO e NMBAIRRO, cujo código do vendedor seja 2; 
	 
SELECT i.cdimovel,
	   i.vlpreco,
	   b.nmbairro
FROM imoveis i,
	 bairro b,
	 vendedor v
WHERE i.cdimovel = b.cdbairro AND i.fk_cdvendedormo = v.cdvendedor AND  cdvendedor = 2; 


-- 34 Faça uma busca que mostre todos os imóveis que tenham ofertas cadastradas

SELECT * 
FROM imoveis i,
     oferta o
WHERE i.cdimovel = o.fk_cdimovelof ORDER BY i.cdimovel;	

-- 35 Faça uma busca que mostre os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel

SELECT * 
FROM imoveis i,
     oferta o
WHERE i.cdimovel = o.fk_cdimovelof;



-- 36 Faça uma busca que mostre todos os compradores e as respectivas ofertas realizadas por eles

SELECT *
FROM oferta o,
     comprador c
WHERE o.fk_cdcompradorof = c.cdcomprador AND vloferta = NULL;


-- 37 Faça a mesma busca, porém acrescentando os compradores que ainda não fizeram ofertas para os imóveis

SELECT *
FROM oferta o,
     comprador c
WHERE o.fk_cdcompradorof = c.cdcomprador;
 
-- 38. Faça uma busca anterior o nome dos vendedores de imóveis e os endereços dos imóveis indicados

SELECT v.nmvendedor,
	   i.rua || ' - ' || i.numero as endereco_resposavel
FROM imoveis i,
	 vendedor v
WHERE i.fk_cdvendedormo = v.cdvendedor;	 


-- 39 

-- 40 Faça uma busca que mostre o endereço do imóvel, o bairro e o nível de preço do imóvel

SELECT i.rua,
       i.numero,
       b.nmbairro,
       i.vlpreco
FROM imoveis i,
     bairro b
WHERE b.cdbairro = i.fk_cdbairromo;

-- 41 Verifique a maior, a menor e o valor médio das ofertas da tabela

SELECT MAX(vloferta) AS MAXIMO,
       MIN(vloferta) AS MINIMO,
       AVG(vloferta) AS MEDIA
FROM oferta;

-- 42

-- 43 

-- 44 Mostre o maior, o menor, o total e a média de preço de venda dos imóveis

SELECT MAX(vlpreco) AS maximo,
       MIN(vlpreco) AS minimo,
       AVG(vlpreco) AS media
FROM imoveis;


-- 45 Modifique o comando anterior para que seja mostrados os mesmos índices por bairro 

SELECT MAX(vlpreco) AS MAXIMO,
       MIN(vlpreco) AS MINIMO,
       AVG(vlpreco) AS MEDIA
FROM imoveis i,
      bairro b
WHERE i.cdbairromo = b.cdbairro
GROUP BY b.cdbairro;


-- 46 Faça uma busca que retorne o total de imóveis por vendedor. Apresente em ordem total de imóveis; 


SELECT *
FROM imoveis i,
     vendedor v
WHERE i.fk_cdvendedormo = v.cdvendedor
ORDER BY v.cdvendedor;


-- 47 Verifique a diferença de preços entre o maior e o menor imóvel da tabela


SELECT MAX(vlpreco) - MIN(vlpreco) AS diferenca
FROM imoveis;


--  48.Mostre o código do vendedor e o menor preço de imóvel dele no
-- cadastro. Exclua da busca os valores de imóveis inferiores a 10 mil


SELECT v.cdvendedor,
       MIN(i.vlpreco)
FROM imoveis i,
     vendedor v
WHERE i.fk_cdvendedormo = v.cdvendedor
AND vlpreco < 10000;

-- 49 Mostre o código e o nome do comprador e a média do valor das
-- ofertas e o número de ofertas deste comprador 

SELECT c.nmcomprador,
       c.cdcomprador,
FROM comprador c,
     oferta o
WHERE  c.cdcomprador = o.fk_cdcompradorof ORDER  BY vloferta;

-- 50 Faça uma busca que retorne o total de ofertas realizadas nos anos de 2000, 2001 e 2002.

SELECT COUNT(dtoferta)
FROM oferta
WHERE dtoferta IS BETWEEN '2000' AND '2002';

