
-- CRIAÇÃO DE TODAS AS TABELAS 
---------------------------------------

CREATE TABLE livro
 (
      codLivro INT PRIMARY KEY,
      titulo CHAR(50) NOT NULL,
      editora CHAR(50) NOT NULL,
      ano INT(4) NOT NULL,
      "local" varchar(45) NOT NULL
 );

CREATE TABLE livro_autor 
  (  
     fk_codautor   INT , 
     fk_codlivro   INT ,
     PRIMARY KEY(fk_codautor,fk_codlivro)
  ); 


CREATE TABLE autor 
  ( 
     codautor   INT PRIMARY KEY, 
     nome_autor VARCHAR(50)NOT NULL 
  ); 


CREATE TABLE livro_assunto 
  ( 
     codlivro_assunto INT, 
     fk_codassunto    INT,
      PRIMARY KEY(codlivro_assunto,fk_codassunto)
  ); 


CREATE TABLE assunto 
  ( 
     codassunto  INT PRIMARY KEY, 
     desc_assunto CHAR(50) NOT NULL 
  ); 


CREATE TABLE exemplar 
  ( 
     num_exemplar    INT PRIMARY KEY, 
     fk_ex_codlivro    INT NOT NULL, 
     data_aquisicao DATE   NOT NULL
  ); 


CREATE TABLE exemplar_associado 
  ( 
     fk_num_exemplar INT, 
     fk_cod_associado INT, 
     dataemprestimo  DATE, 
     datadevolucao   VARCHAR(45) NOT NULL, 
     PRIMARY KEY(fk_num_exemplar, fk_cod_associado, dataemprestimo) 
  ); 


CREATE TABLE multa
  (	
	codMulta int PRIMARY KEY,

	fk_num_exemplarMT int NOT NULL,
	
	fk_cod_associadoMT int NOT NULL,

	fk_dataemprestimo DATE NOT NULL,

	data_devolucao varchar(45) NOT NULL
  );


CREATE TABLE associado 
  ( 
     cod_associado  INT PRIMARY KEY, 
     nome_associado CHAR(50) NOT NULL, 
     endereco       CHAR(50) NOT NULL, 
     telefone       CHAR(15) NOT NULL, 
     email          CHAR(50) NOT NULL, 
     datanasc       VARCHAR(45) NOT NULL 
  );

CREATE TABLE dependente 
  ( 
     
    cod_dependente INT PRIMARY KEY,
    fk_cod_cidade  INT NOT NULL,
    fk_cod_associadoDP INT NOT NULL,
    nome_dependente CHAR(50) NOT NULL,
    datanasc       VARCHAR(45) NOT NULL

  );

CREATE TABLE cidade
 ( 

   cod_cidade  INT PRIMARY KEY,
   nome_cidade CHAR(30) NOT NULL,
   uf VARCHAR(45) NOT NULL
 ); 

-- CRIANDO O RELACIONAMENTO ENTRE AS TABELAS
------------------------------------------------

ALTER TABLE DEPENDENTE

     ADD CONSTRAINT fk_cod_cidade FOREIGN KEY (fk_cod_cidade) REFERENCES
     CIDADE (cod_cidade);

ALTER TABLE DEPENDENTE

     ADD CONSTRAINT fk_cod_associadoDP FOREIGN KEY(fk_cod_associadoDP) REFERENCES

     ASSOCIADO (cod_associado);

ALTER TABLE MULTA

     ADD CONSTRAINT fk_num_exemplarMT FOREIGN KEY (fk_num_exemplarMT) REFERENCES

     EXEMPLAR (num_exemplar);

ALTER TABLE MULTA

     ADD CONSTRAINT fk_cod_associadoMT FOREIGN KEY(fk_cod_associadoMT) REFERENCES 
     ASSOCIADO (cod_associado);

ALTER TABLE MULTA

     ADD CONSTRAINT fk_dataemprestimo FOREIGN KEY (fk_dataemprestimo) REFERENCES

     EXEMPLAR_ASSOCIADO (dataemprestimo);

ALTER TABLE
 EXEMPLAR_ASSOCIADO 
    ADD CONSTRAINT fk_num_exemplar FOREIGN KEY (fk_num_exemplar) REFERENCES

    EXEMPLAR (num_exemplar);


ALTER TABLE
 EXEMPLAR_ASSOCIADO 
    ADD CONSTRAINT fk_cod_associado FOREIGN KEY (fk_cod_associado) REFERENCES

    ASSOCIADO (cod_associado);

ALTER TABLE
 EXEMPLAR 
   ADD CONSTRAINT fk_ex_codlivro FOREIGN KEY (fk_ex_codlivro) REFERENCES

   LIVRO (codLivro);

ALTER TABLE LIVRO_ASSUNTO

   ADD CONSTRAINT codlivro_assunto FOREIGN KEY(codlivro_assunto) REFERENCES

   LIVRO (codLivro);

ALTER TABLE LIVRO_ASSUNTO

   ADD CONSTRAINT fk_codassunto FOREIGN KEY(fk_codassunto) REFERENCES

   ASSUNTO (codassunto);

ALTER TABLE LIVRO_AUTOR
  ADD CONSTRAINT fk_codlivro FOREIGN KEY(fk_codlivro) REFERENCES
  LIVRO (codLivro)


ALTER TABLE LIVRO_AUTOR
	
  ADD CONSTRAINT fk_codautor FOREIGN KEY (fk_codautor) REFERENCES

  AUTOR (codautor);














