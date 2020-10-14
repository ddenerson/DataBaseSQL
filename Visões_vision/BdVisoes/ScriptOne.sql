------------------------------------ VISÕES -----------------------------------------------


CREATE TABLE piloto
(
	codPiloto INTEGER PRIMARY KEY,
	nomePiloto VARCHAR(20),
	salario NUMERIC(10,2),
	gratificacao NUMERIC(10,2),
	companhia VARCHAR(20),
	pais VARCHAR(20)
);


CREATE TABLE voo
(
	codVoo INTEGER PRIMARY KEY,
	aeropOrigem  VARCHAR(20),
	aeropDestino VARCHAR(20),
	hora         DATE
);


CREATE TABLE escala
(
	codVooES 	 INTEGER,
	dtVoo 	         DATE,		
	codPilotoes      INTEGER,
	aviao            VARCHAR(15),
	PRIMARY KEY (codVooEs,dtVoo)
);


CREATE TABLE aeroporto
(
	codAerop 	     INTEGER,
	nomeAerop 	     VARCHAR(30),		
	cidade           VARCHAR(20),
	pais             VARCHAR(15),
	PRIMARY KEY (codAerop)
);

----------------------------------------------------------------------------------------


ALTER TABLE escala ADD CONSTRAINT codVooES FOREIGN KEY(codVooES)
REFERENCES voo(codVoo);




---------------------------------------------------------------------------------------
-- Escreva a Visões em SQL para armazenar as Consultas dos dados no esquema acima

-- 1  Os dados de todos os pilotos de companhias brasileiras

CREATE VIEW TodosPiloto (codPiloto,nomePiloto,salario,gratificacao,companhia,pais)
AS SELECT * FROM piloto;


-- 2 O nome de todos os pilotos da Varig

CREATE VIEW PilotoVarig (companhia) AS
SELECT companhia
FROM piloto
WHERE companhia = 'Varig';


-- 3 O nome de todos os pilotos escalados

CREATE VIEW nomePilo(codpilo,nomepiloto) AS
SELECT codpilotoes,nomepiloto
FROM piloto p,
     escala e
WHERE p.codpiloto = e.codpilotoes;


--- 4 Os códigos do vôos que partem do Brasil


CREATE VIEW nomePilo(codvoo) AS
SELECT codvoo
FROM voo
WHERE aeroporigem = 'Brasil';

--  5 Os pilotos que voam para o seu pais de origem

CREATE VIEW vooPiloOrigem(codvoo) AS
SELECT codvoo
FROM voo
WHERE aeropdestino = aeroporigem;


-- 6 nome de todos os pilotos, junto com seu salário e gratificação.

CREATE VIEW infoPilo(codpiloto,nomepiloto,salario,gratificacao) AS
SELECT codpiloto,
       nomepiloto,
       salario,
       gratificacao
FROM piloto;


-- 7 O código dos vôos com seu respectivo nome dos pilotos e do nome dos seus
-- aeroportos de origem e destino


CREATE VIEW VooPiloto(codvoo, nomepiloto, aeroporigem, aeropdestino)
AS
SELECT codvoo,
       nomepiloto,
       aeroporigem,
       aeropdestino
FROM voo v
RIGHT OUTER JOIN piloto p ON v.codvoo = p.codpiloto;



-- 8 O código de todos os vôos, nome dos pilotos escalados para os mesmos, e
respectivos tipos de avião e companhia

CREATE VIEW aviaocomp(codvoo, nomepiloto, aviao, companhia) AS
SELECT v.codvoo AS codigo_piloto,
       p.nomepiloto AS nome_piloto,
       e.aviao AS avião,
       p.companhia AS companhia
FROM voo v,
     piloto p,
     escala e
WHERE v.codvoo = e.codvooes
AND p.codpiloto = e.codpilotoes;



-- 9 A companhia dos pilotos que voam para a Itália

CREATE VIEW voaitalia(companhia) AS
SELECT companhia
FROM piloto
WHERE pais = 'Italia';



-- 10 O nome de todos os aeroportos onde a varig opera


CREATE VIEW aeropvarig(nomeaerop) AS
SELECT a.nomeaerop AS nome_aeroporto
FROM aeroporto a
RIGHT OUTER JOIN piloto p ON a.codaerop = p.codpiloto
WHERE companhia = 'Varig' ;


-- 11  O maior , o menor e quantidade de pilotos
-- 12 O maior , o menor e quantidade de pilotos por companhia
-- 13 O maior , o menor e média dos salários dos pilotos de companhias brasileiras

CREATE VIEW InfoSalarioPil(salario, pais) AS
SELECT MAX(salario) AS maior,
       MIN(salario) AS menor,
       AVG(salario) AS media
FROM piloto WHERE pais = 'Brasil';


-- 14  O total da folha de pagamento por companhias

CREATE VIEW FolhaPag (salario) AS
SELECT count(salario)
FROM piloto
GROUP BY companhia; 

-- 15 O total de pilotos por pais

CREATE VIEW TotalPiloto (nomepiloto) AS
SELECT count(nomepiloto)
FROM piloto
GROUP BY pais; 


-- 16 O Número de Aeroporto por Cidade Brasileira

CREATE VIEW AeroBrasil (nomeaerop, pais,cidade) AS
SELECT count(nomeaerop)
FROM aeroporto
WHERE pais = 'Brasil'
GROUP BY cidade;


