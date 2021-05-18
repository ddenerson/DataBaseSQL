

------------------------------------------------------------------------------------------------CRIACAO DA TABELA - TABLE CREATION ---------------------  

CREATE DATABASE imobiliaria; 


CREATE TABLE vendedor 
  ( 
     cdvendedor INT PRIMARY KEY, 
     email      VARCHAR(10) , 
     nmvendedor VARCHAR(10) , 
     nmestado   VARCHAR(10) , 
     nrcpf      VARCHAR(10) , 
     nmbairro   VARCHAR(10) , 
     nmcidade   VARCHAR(10)  
  ) ;



CREATE TABLE telefone 
  ( 
     telefone_pk      INT PRIMARY KEY, 
     telefone         VARCHAR(10), 
     fk_cdvendedortel INT 
  );


CREATE TABLE comprador 
  ( 
     cdcomprador INT PRIMARY KEY, 
     cpf         VARCHAR(10) , 
     nmcomprador VARCHAR(10) , 
     endereco    VARCHAR(10) , 
     cidade      VARCHAR(10) , 
     bairro      VARCHAR(10) , 
     estado      CHAR(2) , 
     email       VARCHAR(10) 
  ); 


CREATE TABLE imoveis 
  ( 
     cdimovel         INT PRIMARY KEY, 
     rua              VARCHAR(60) , 
     numero           INT , 
     nrareautil       DECIMAL(10, 2), 
     area_total       DECIMAL(10, 2) , 
     descricao_imovel VARCHAR(150) , 
     vlpreco          DECIMAL(10, 2) , 
     nrofertas        VARCHAR(10) , 
     status_vendido   CHAR(1) , 
     dtlancamento     DATE , 
     imovel_indicado  VARCHAR(10), 
     fk_cdvendedormo  INT, 
     fk_cdbairromo    INT, 
     fk_sgestadomo    CHAR(2), 
     fk_cidademo      INT 
  );

CREATE TABLE oferta 
  ( 
     fk_cdimovelof    INT, 
     fk_cdcompradorof INT, 
     vloferta         NUMERIC(10, 2) , 
     dtoferta         DATE ,
     PRIMARY KEY(fk_cdimovelof,fk_cdcompradorof)
     	
  ); 



CREATE TABLE telefone_comprador 
  ( 
     fk_telefonecom    INT PRIMARY KEY, 
     telefone          VARCHAR(10) , 
     fk_cdcompradortel INT 
  ); 


CREATE TABLE estado 
  ( 
     sgestado char(2) PRIMARY KEY, 
     nmestado VARCHAR(10)  
  );
 

CREATE TABLE cidade 
  ( 
     cdcidade    INT, 
     fk_sgestadocid CHAR(2), 
     nmcidade    VARCHAR(10) , 
     PRIMARY KEY(cdcidade,fk_sgestadocid)
  );
 

CREATE TABLE bairro 
  ( 
     cdbairro      INT, 
     fk_sgestadoba CHAR(2), 
     fk_cdcidadeba INT, 
     nmbairro      VARCHAR(10) , 
     PRIMARY KEY(cdbairro,fk_sgestadoba,fk_cdcidadeba)
  );

----------------------------------------------------------------------------------------------------

ALTER TABLE telefone 
  ADD CONSTRAINT fk_cdvendedortel FOREIGN KEY (fk_cdvendedortel) REFERENCES 
  vendedor(cdvendedor);


ALTER TABLE telefone_comprador 
  ADD CONSTRAINT fk_cdcompradortel FOREIGN KEY (fk_cdcompradortel) REFERENCES 
  comprador(cdcomprador);

ALTER TABLE oferta 
  ADD CONSTRAINT fk_cdimovelof FOREIGN KEY (fk_cdimovelof) REFERENCES imoveis( 
  cdimovel);

ALTER TABLE oferta 
  ADD CONSTRAINT fk_cdcompradorof FOREIGN KEY (fk_cdcompradorof) REFERENCES 
  comprador(cdcomprador);


ALTER TABLE imoveis 
  ADD CONSTRAINT fk_cdvendedormo FOREIGN KEY(fk_cdvendedormo) REFERENCES 
  vendedor(cdvendedor); 


ALTER TABLE imoveis ADD CONSTRAINT fks_moveis
    FOREIGN KEY(fk_cdbairromo,fk_sgestadomo,fk_cidademo) REFERENCES bairro(cdbairro,fk_sgestadoba,fk_cdcidadeba);


ALTER TABLE bairro 
  ADD CONSTRAINT fk_sgestadoba FOREIGN KEY (fk_sgestadoba) REFERENCES estado( 
  sgestado);


ALTER TABLE bairro 
  ADD CONSTRAINT fk_cdcidadeba FOREIGN KEY(fk_sgestadoba,fk_cdcidadeba) REFERENCES cidade(fk_sgestadocid, 
  cdcidade); 

ALTER TABLE cidade 
  ADD CONSTRAINT fk_sgestadocid FOREIGN KEY (fk_sgestadocid) REFERENCES estado( 
  sgestado); 








