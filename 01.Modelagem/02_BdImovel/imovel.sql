 -- CRIAR TABELAS DE IMOVEIS 


CREATE TABLE tbtipo 
  ( 
     id_tipo    INT PRIMARY KEY, 
     observacao VARCHAR(150), 
     descricao  VARCHAR(150) 
  ); 



CREATE TABLE tbimovel 
  ( 
     id_imovel         INT PRIMARY KEY, 
     numero_oferta     INT NOT NULL, 
     descricao         VARCHAR(50) NOT NULL, 
     area_total_imovel DECIMAL(10, 2) NOT NULL, 
     dt_lancamento     DATE NOT NULL, 
     area_construida   DECIMAL(10, 2) NOT NULL, 
     preco_imovel      DECIMAL(10, 2), 
     fk_cod_situacaoim INT NOT NULL, 
     fk_cod_cidadeim   INT NOT NULL, 
     fk_cod_bairroim   INT NOT NULL, 
     fk_cod_tipoim     INT NOT NULL 
  );


CREATE TABLE tbsituacao 
  ( 
     id_situacao INT PRIMARY KEY, 
     descricao   VARCHAR(50) NOT NULL, 
     st_data     DATE NOT NULL
  ); 


CREATE TABLE tbvendedor_imovel 
  ( 
     cod_vendedor INT, 
     cod_imovel   INT, 
     hora         TIME NOT NULL, 
     vi_data      DATE NOT NULL, 
     PRIMARY KEY (cod_vendedor, cod_imovel) 
  ); 


CREATE TABLE tboferta 
  ( 
     id_oferta        INT PRIMARY KEY, 
     valor_oferta     DECIMAL(10, 2) NOT NULL, 
     of_data          DATE NOT NULL, 
     fk_cod_imovelof  INT NOT NULL, 
     fk_cod_clienteof INT NOT NULL, 
     fk_cod_vendedorof  INT NOT NULL 
  ); 


CREATE TABLE tbcliente 
  ( 
     id_cliente      INT PRIMARY KEY, 
     sexo            CHAR(1) NOT NULL, 
     nome_cliente    VARCHAR(50) NOT NULL, 
     telefone        VARCHAR(12) NOT NULL, 
     email           VARCHAR(30) NOT NULL, 
     endereco        VARCHAR(60) NOT NULL, 
     cpf             INT NOT NULL, 
     fk_cod_cidadecl INT NOT NULL, 
     fk_cod_bairrocl INT NOT NULL 
  ); 

CREATE TABLE tbbairro 
  ( 
     fk_cod_cidadeba INT, 
     cod_bairro      INT, 
     nome_bairro     VARCHAR(60) NOT NULL, 
     PRIMARY KEY(fk_cod_cidadeba, cod_bairro) 
  ); 


CREATE TABLE tbvendedor 
  ( 
     id_vendedor     INT PRIMARY KEY, 
     nome_vendedor   VARCHAR(40) NOT NULL, 
     sexo            CHAR(1) NOT NULL, 
     cpf             INT NOT NULL, 
     telefone        VARCHAR(12) NOT NULL, 
     email           VARCHAR(30) NOT NULL, 
     fk_cod_cidadeve INT NOT NULL, 
     fk_cod_bairrove INT NOT NULL
  ); 


CREATE TABLE tbnegocio 
  ( 
     id_negocio      INT PRIMARY KEY, 
     valor_venda     DECIMAL(10, 2) NOT NULL, 
     ne_data         DATE NOT NULL, 
     observacao      VARCHAR(100) NOT NULL, 
     fk_cod_ofertane INT NOT NULL 
  );



CREATE TABLE tbcidade 
  ( 
     id_cidade    INT PRIMARY KEY, 
     nome_cidade VARCHAR(40), 
     fk_cod_ufes  CHAR(2) NOT NULL 
  ); 


CREATE TABLE tbestado 
  ( 
     id_uf       INT PRIMARY KEY, 
     nome_estado VARCHAR(40) NOT NULL 
  ); 


-- RELACIONANDO AS TABELAS

ALTER TABLE TBCIDADE ADD CONSTRAINT fk_cod_ufes foreing KEY(fk_cod_ufes) REFERENCES tbestado(id_uf);

ALTER TABLE TBBAIRRO ADD CONSTRAINT fk_cod_cidade FOREIGN KEY (fk_cod_cidadeba) REFERENCES tbcidade(id_cidade);

ALTER TABLE TBVENDEDOR ADD CONSTRAINT fk_cod_cidadeve FOREIGN KEY (fk_cod_cidadeve) REFERENCES tbcidade(id_cidade);

ALTER TABLE TBVENDEDOR ADD CONSTRAINT fk_cod_bairrove FOREIGN KEY (fk_cod_bairrove) REFERENCES tbbairro(cod_bairro);

ALTER TABLE TBCLIENTE ADD CONSTRAINT fk_cod_bairrocl FOREIGN KEY(fk_cod_bairrocl) REFERENCES tbbairro(cod_bairro);

ALTER TABLE TBCLIENTE ADD CONSTRAINT fk_cod_cidadecl FOREIGN KEY(fk_cod_cidadecl) REFERENCES tbcidade(id_cidade);

ALTER TABLE TBOFERTA ADD CONSTRAINT fk_cod_imovelof FOREIGN KEY (fk_cod_imovelof) REFERENCES tbimovel(id_imovel);

ALTER TABLE TBOFERTA ADD CONSTRAINT fk_cod_clienteof FOREIGN KEY (fk_cod_clienteof) REFERENCES tbcliente(id_cliente);

ALTER TABLE TBOFERTA ADD CONSTRAINT fk_cod_vendedorof FOREIGN KEY (fk_cod_vendedorof) REFERENCES tbvendedor(id_vendedor);

ALTER TABLE TBNEGOCIO ADD CONSTRAINT fk_cod_ofertane FOREIGN KEY(fk_cod_ofertane) REFERENCES tboferta(id_oferta);

ALTER TABLE TBVENDEDOR_IMOVEL ADD CONSTRAINT cod_imovel FOREIGN KEY (cod_imovel) REFERENCES tbimovel(id_imovel);

ALTER TABLE TBIMOVEL ADD CONSTRAINT  fk_cod_tipoim FOREIGN KEY (fk_cod_tipoim) REFERENCES tbtipo(id_tipo);

ALTER TABLE TBIMOVEL ADD CONSTRAINT fk_cod_bairroim  FOREIGN KEY (fk_cod_bairroim) REFERENCES tbbairro(cod_bairro);

ALTER TABLE TBIMOVEL ADD CONSTRAINT fk_cod_cidadeim FOREIGN KEY (fk_cod_cidadeim) REFERENCES tbcidade(id_cidade);

ALTER TABLE TBIMOVEL ADD CONSTRAINT fk_cod_situacaoim FOREIGN KEY (fk_cod_situacaoim) REFERENCES tbsituacao(id_situacao);









