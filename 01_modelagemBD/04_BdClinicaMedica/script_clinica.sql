
-- TABELA BANCO DE DADOS CLINICA 


-- 7° SETIMO

CREATE TABLE consulta
(
	codconsulta    INTEGER,
	dtconsulta     DATE NOT NULL ,
	fkcodpaciente  INTEGER,
	fkcodmedico    INTEGER,
	fkcodatendente INTEGER,
	PRIMARY KEY(codconsulta),
    	FOREIGN KEY(fkcodpaciente) REFERENCES paciente(codpaciente),
	FOREIGN KEY(fkcodmedico) REFERENCES medico(codmedico),
	FOREIGN KEY(fkcodatendente) REFERENCES atendente(codatendente)
);

-- 1° PRIMEIRO 

CREATE TABLE atendente
(
	codatendente     INTEGER,
	nome 		 VARCHAR(20) NOT NULL,
	telefone 	 VARCHAR(15) NOT NULL,
	PRIMARY KEY(codatendente)
);

-- 2° SEGUNDA

CREATE TABLE paciente
(
	codpaciente     INTEGER,
	nome 		    VARCHAR(20) NOT NULL,
	cpf			    VARCHAR(11) NOT NULL,
    PRIMARY KEY(codpaciente)
);

-- 6° SEXTA

CREATE TABLE prontuario
(
	codprontuario     INTEGER,
	receita 	  VARCHAR(30) NOT NULL,
	dtprontuario      DATE        NOT NULL,
	fkcodpaciente     INTEGER,
	fkcodmedico	  INTEGER,
	PRIMARY KEY(codprontuario),
	FOREIGN KEY(fkcodpaciente) REFERENCES paciente(codpaciente),
	FOREIGN KEY(fkcodmedico) REFERENCES medico(codmedico)		
);

-- 3° TERCEIRA

CREATE TABLE medico
(
	codmedico 	INTEGER,
	telefone 	VARCHAR(15) NOT NULL,
	endereco        VARCHAR(30) NOT NULL,
	PRIMARY KEY(codmedico)
	
);

-- 4° QUARTA

CREATE TABLE exame
(
	codexame      INTEGER,
	tpexame	      VARCHAR(15) NOT NULL,
	dtexame	      DATE        NOT NULL,
	fkcodmedicoex INTEGER,
	PRIMARY KEY(codexame),
	FOREIGN KEY(fkcodmedicoex) REFERENCES exame(codexame)
	
);
-- 5° QUINTA

CREATE TABLE especializacao
(
	fkcodmedico INTEGER,
	especialidade VARCHAR(30) NOT NULL,
	PRIMARY KEY(fkcodmedico),
	FOREIGN KEY(fkcodmedico) REFERENCES medico(codmedico)
	
);


-- PERMISSÃO - DELEGACAO DE CADA SETOR

-- PERMISSOES ---

-- MEDICOS -> PODEM EDITAR PLANILHAS DO EXAME,PONTUARIO,PACIENTE

-- SECRETARIO -> PODEM EDITAR PLANILHAS DE CONSULTA,PACIENTE,ATENDENTE


-- ADMINISTRADOR 
	-- -> TEM O PODER DE MODIFICAR TODAS AS TABELAS E UTILIZAR
	-- -> AS FUNÇOES, ALEM DE PODER DAR DIREITOS DE ACESSO AOS DEMAIS  USUARIOS.

-- MARKETING DIGITAL|AUXILIAR ADMINISTRATIVO -> PODEM ACESSAR A VISAO DA TABELA CONSULTAR O PACIENTE.




CREATE ROLE medico;
CREATE ROLE secretaria;
CREATE ROLE administrador;
CREATE ROLE marketing;
CREATE ROLE aux_administrador;


CREATE ROLE Alice    LOGIN 		PASSWORD '0000' IN ROLE medico;
CREATE ROLE Sophia   LOGIN 		PASSWORD '1111' IN ROLE medico;
CREATE ROLE Arthur   LOGIN 		PASSWORD '2222' IN ROLE medico;
CREATE ROLE Bernardo LOGIN 		PASSWORD '3333' IN ROLE medico;
CREATE ROLE Helena 	 LOGIN 		PASSWORD '4444' IN ROLE medico;
CREATE ROLE Manuela  LOGIN 		PASSWORD '5555' IN ROLE secretaria;
CREATE ROLE Julia 	 LOGIN 		PASSWORD '6666' IN ROLE secretaria;
CREATE ROLE Maria_Luiza LOGIN 	PASSWORD '7777' IN ROLE secretaria;
CREATE ROLE Miguel 		LOGIN 	PASSWORD '8888' IN ROLE administrador;
CREATE ROLE Lorenzo 	LOGIN 	PASSWORD '9999' IN ROLE marketing;
CREATE ROLE Giovane 	LOGIN	PASSWORD '1010' IN ROLE aux_administrador;
CREATE ROLE Nicholas	LOGIN   PASSWORD '1212' IN ROLE  aux_administrador;
CREATE ROLE Guilherme	LOGIN   PASSWORD '1313' IN ROLE  aux_administrador;
CREATE ROLE Benjamin	LOGIN   PASSWORD '1414' IN ROLE  aux_administrador;



-- VISÕES -- CRIADO PARA PESSOAL DO MARKETIN E AUXILIAR ADMINISTRATIVO


CREATE VIEW acesso_paciente(codpaciente,nome,cpf)AS
SELECT * FROM paciente;


CREATE VIEW acesso_consulta(dtconsulta,fkcodpaciente,fkcodmedico) AS
SELECT dtconsulta,fkcodpaciente,fkcodmedico FROM consulta;


-- FUNÇÕES -- 
	
	-- REGISTRAR ATENDENTE

CREATE OR REPLACE FUNCTION ftadd_atendente(codatd INT ,nomeatd VARCHAR(20),telcon VARCHAR(20))RETURNS TEXT
AS
$adicionaratende$
BEGIN
   INSERT INTO atendente(codatendente,nome,telefone)
   VALUES(codatd,nomeatd,telcon);
   RETURN 'FUNCIONARIO NO CARGO ATENDENTE';
END;
$adicionaratende$
LANGUAGE plpgsql SECURITY DEFINER; 

    	-- REGISTRAR MEDICO

CREATE OR REPLACE FUNCTION ftaddmedico(codmed INTEGER,medtel VARCHAR(20),medend VARCHAR(20))RETURNS TEXT
AS
$ADICIONARMEDICO$
BEGIN
  INSERT INTO medico(codmed,medtel,medend)
  VALUES(codmedico,telefone,endereco);
  RETURN 'FUNCIONARIO NO CARGO MEDICO';
END;
$ADICIONARMEDICO$
LANGUAGE plpgsql SECURITY DEFINER;

	-- REGISTRAR EXAME 

CREATE OR REPLACE FUNCTION ftaddexame(excodex INTEGER ,extpex INTEGER,exdtex DATE,fkcodmedex INTEGER)RETURNS TEXT
AS
$ADICIONAREXAME$
BEGIN
 INSERT INTO exame(excodex,extpex,exdtex,fkcodmedex)
 VALUES(codexame,tpexame,dtexame,fkcodmedicoex);
END;
$ADICIONAREXAME$
LANGUAGE plpgsql SECURITY DEFINER;

	-- REGISTRAR CONSULTA


CREATE OR REPLACE FUNCTION ftaddconsulta(ftcodcon INT,ftdtcon DATE,ftcodpac INT,ftcodmed INT,fkcodaten INT)RETURNS TEXT 
AS 
$adicionarconsulta$ 
BEGIN
 INSERT INTO consulta(ftcodcon, ftdtcon, ftcodpac, ftcodmed, fkcodaten)
 VALUES(codconsulta,dtconsulta,fkcodpaciente,fkcodmedico,fkcodatendente); 
 RETURN 'AGENDAMENTO FEITO COM SUCESSO';
END;
$adicionarconsulta$
LANGUAGE plpgsql SECURITY DEFINER;


	-- REGISTRAR PACIENTE


CREATE OR REPLACE FUNCTION ftaddpaciente(pacod INT,panome VARCHAR(15),pacpf VARCHAR(12))RETURNS TEXT
AS
$adicionarpaciente$
BEGIN
	INSERT INTO paciente(pacod,panome,pacpf)
	VALUES(codpaciente,nome,cpf);
	RETURN 'PACIENTE CADASTRADO COM SUCESSO';
END;
$adicionarpaciente$
LANGUAGE plpgsql SECURITY DEFINER;


	-- REGISTRAR PONTURARIO

CREATE OR REPLACE FUNCTION ftaddpronturario(codpro INTEGER,prorec VARCHAR(20),dtpro DATE,fkcodpapro INT,fkcodmedpro INT)RETURNS TEXT
AS
$adicionarpronturario$
BEGIN
	INSERT INTO pronturario(codpro,prorec,dtpro,fkcodpapro,fkcodmedpro)
	VALUES(codprontuario,receita,dtprontuario,fkcodpaciente,fkcodmedico);
	RETURN 'PRONTUARIO DO PACIENTE ADICIONADO';
END;
$adicionarpronturario$
LANGUAGE plpgsql SECURITY DEFINER;

	
	-- REGISTRAR ESPECIALIZAÇÃO

CREATE OR REPLACE FUNCTION ftaddespecializacao(fkcodmed INTEGER,espec VARCHAR(30))RETURNS TEXT
AS
$adiconar_especializacao$
BEGIN
	INSERT INTO especialização(fkcodmed,espec)
	VALUES(fkcodmedico,especialidade);
	RETURN 'ESPECIALIZAÇÃO DO MEDICO CADASTRADA';
END;
$adiconar_especializacao$
LANGUAGE plpgsql SECURITY DEFINER;


-- REVOGANDO

REVOKE ALL ON FUNCTION ftadd_atendente(INT VARCHAR(20),VARCHAR(20)                 FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddmedico(INTEGER,VARCHAR(20),VARCHAR(20))                FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddexame(INTEGER ,INTEGER,DATE, INTEGER)                  FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddconsulta(INT,DATE,INT, INT, INT)	           	   FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddpaciente(INT,VARCHAR(15),VARCHAR(12))  		   FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddpronturario(INTEGER,VARCHAR(20),DATE, INT,INT)         FROM PUBLIC;
REVOKE ALL ON FUNCTION ftaddespecializacao(INTEGER,VARCHAR(30))			   FROM PUBLIC;


--- CRIANDO PERMISSOES 

GRANT SELECT,INSERT ON consulta,atendente,paciente,prontuario,medico,exame,especializacao 
TO administrador WITH GRANT OPTION;

GRANT SELECT,INSERT ON consulta,paciente,atendente TO secretaria WITH GRANT OPTION;

GRANT SELECT,INSERT ON exame,prontuario,paciente TO medico WITH GRANT OPTION;

GRANT SELECT,INSERT ON consulta,paciente TO aux_administrador WITH GRANT OPTION;

GRANT EXECUTE ON FUNCTION ftadd_atendente(INT VARCHAR(20),VARCHAR(20) 	TO secretaria;
	 
GRANT EXECUTE ON FUNCTION ftadd_atendente(INT VARCHAR(20),VARCHAR(20) 	TO administrador;

GRANT EXECUTE ON FUNCTION ftaddmedico(INTEGER,VARCHAR(20),VARCHAR(20)) 	TO medico;

GRANT EXECUTE ON FUNCTION ftaddmedico(INTEGER,VARCHAR(20),VARCHAR(20)) 	TO administrador;

GRANT EXECUTE ON FUNCTION ftaddexame(INTEGER ,INTEGER,DATE, INTEGER)   	TO medico;

GRANT EXECUTE ON FUNCTION ftaddexame(INTEGER ,INTEGER,DATE, INTEGER)   	TO administrador;

GRANT EXECUTE ON FUNCTION ftaddconsulta(INT,DATE,INT, INT, INT)		TO aux_administrador;

GRANT EXECUTE ON FUNCTION ftaddconsulta(INT,DATE,INT, INT, INT)         TO administrador;	

GRANT EXECUTE ON FUNCTION ftaddconsulta(INT,DATE,INT, INT, INT)         TO  consulta;

REVOKE ALL ON FUNCTION ftaddpaciente(INT,VARCHAR(15),VARCHAR(12))       TO  aux_administrador;

REVOKE ALL ON FUNCTION ftaddpaciente(INT,VARCHAR(15),VARCHAR(12))       TO  secretaria;

REVOKE ALL ON FUNCTION ftaddpaciente(INT,VARCHAR(15),VARCHAR(12))       TO  administrador;

REVOKE ALL ON FUNCTION ftaddpronturario(INTEGER,VARCHAR(20),DATE, INT,INT) TO administrador;

REVOKE ALL ON FUNCTION ftaddpronturario(INTEGER,VARCHAR(20),DATE, INT,INT) TO medico;

REVOKE ALL ON FUNCTION ftaddespecializacao(INTEGER,VARCHAR(30))	TO  administrador;

REVOKE ALL ON FUNCTION ftaddespecializacao(INTEGER,VARCHAR(30))	TO  medico;
 
