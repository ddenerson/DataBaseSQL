-- 1 - INICIANDO O PROCESSO DE TRANSAÇÃO
BEGIN

-- 2 -  CRIANDO A TABALE teste

CREATE OR REPLACE FUNCTION ft_criarteste() RETURNS TEXT
AS
$$
BEGIN
CREATE TABLE teste 
(
	idteste INT,
	nometeste VARCHAR(30),
	dtteste DATE DEFAULT '23-10-2019',
	vlteste DECIMAL(6,2),
	PRIMARY KEY(idteste)
);
RETURN 'Tabela criada com sucesso';
END;
$$
LANGUAGE plpgsql;

SELECT ft_criarteste();

SELECT * FROM teste;

-- 3 - DESPREZANDO O CONTEUDO QUE FOI FEITO, NO CASO A CRIACAO DA TABELA

ROLLBACK
 
-- 4 - DEPOIS CRIAR NOVAMENTE A TABELA E NA LINHA DE COMANDO INSERIR 3 TUPLAS NA TABELA TESTE

SELECT ft_criarteste();

CREATE OR REPLACE FUNCTION ft_adinfo(idtest INT,nome VARCHAR (30) ,valor DECIMAL(6,2)) RETURNS TEXT
AS
$$
BEGIN																			 																			 
	INSERT INTO teste(idteste,nometeste,vlteste)
	VALUES(idtest,nome,valor);
	RETURN 'Usuário cadastrado com sucesso';																	  
END;
$$
LANGUAGE plpgsql;


																				 
BEGIN																				 
SELECT ft_adinfo(1,'BEATRIZ',600.00);
SELECT ft_adinfo(2,'DENERSON',700.00);
SELECT ft_adinfo(3,'ALEXSSANDRA',800.00);
																				 

-- 5 - LISTE TODOS OS DADOS DA TABELA TESTE
																				 
SELECT * FROM teste;																			 
																				 
														
-- 6 - EXECUTE O COMANDO ROLLBACK

ROLLBACK
																				 
-- 7 - LISTE TODOS OS DADOS DA TABELA TESTE
																				 
SELECT * FROM teste;


-- 8 - INSIRA 3 TUPLAS ONDE A SOMA DOS VALORES DE TESTE TOTAL SEJA IGUAL A 3

BEGIN
SELECT ft_adinfo(1,'BEATRIZ',4.00);
SELECT ft_adinfo(2,'DENERSON',5.00);
SELECT ft_adinfo(3,'ALEXSSANDRA',1.00);
																				 
-- 9 - LISTE A SOMA DOS VALORES DOS TESTES INSERIDOS NA TABELA TESTE

SELECT SUM(vlteste) AS SOMA FROM teste;																			 
																				 
-- 10 - EXECUTE O COMANDO "COMMIT"

COMMIT

-- 11 - ATUALIZE O VALOR DE UM DOS TESTE DE FORMA QUE A SOMA DOS VALORES 
-- SEJA IGUAL A 40.

CREATE OR REPLACE FUNCTION update_teste(valor INT,upid INTEGER)RETURNS text
AS
$$
BEGIN
	UPDATE teste SET vlteste = $1 WHERE idteste = $1;
	RETURN 'atualização feita com sucesso';
END
$$
LANGUAGE PLPGSQL;


SELECT update_teste(31,1);


-- 12 - LISTE A SOMA DOS VALORES INSERIDO NA TABELA TESTE;

SELECT idteste,vlteste FROM teste;


-- 13 - DEFINA UM PRIMEIRO SAVEPOINT

SAVEPOINT teste_um; 

-- 13 - DEFINA UM PRIMEIRO SAVEPOINT
BEGIN

SAVEPOINT teste_um;

-- 14  ATUALIZE O VALOR DE UM TESTE DE FORMA QUE A SOMA DOS VALORES DOS TESTES SEJA IGUAL A 65

SELECT update_teste(22,1);
SELECT update_teste(20,2);
SELECT update_teste(23,3);


-- 15 - DEFINA O SEGUNDO SAVEPOINT

SAVEPOINT teste_dois;

-- 16   LISTE A SOMA DOS VALORES DOS TESTES INSERIDOS NA TABELA TESTE

SELECT SUM(vlteste) FROM teste;

-- 17 EXECUTE ROLLBACK para o primeiro savepoint

ROLLBACK TO SAVEPOINT teste_um;

-- 18 LISTE A SOMA DOS VALORES DOS TESTES INSERIDOS NA TABELA TESTE.

SELECT SUM(vlteste) FROM teste;


---


 

	

