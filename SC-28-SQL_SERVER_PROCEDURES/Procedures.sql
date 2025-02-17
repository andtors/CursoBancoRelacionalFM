/* PROCEDURES */

CREATE TABLE PESSOA(
    IDPESSOA INT PRIMARY KEY IDENTITY,
    NOME VARCHAR(30) NOT NULL,
    SEXO CHAR(1) NOT NULL CHECK(SEXO IN('M', 'F')),
    NASCIMENTO DATE NOT NULL
)
GO

CREATE TABLE TELEFONE(
    IDTELEFONE INT NOT NULL IDENTITY,
    TIPO CHAR(3) NOT NULL CHECK(TIPO IN('CEL', 'COM')),
    NUMERO CHAR(10) NOT NULL,
    ID_PESSOA INT
)
GO

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_PESSOA
FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
ON DELETE CASCADE
GO

INSERT INTO PESSOA VALUES('ANTONIO', 'M', '1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL', 'M', '1985-03-18')
INSERT INTO PESSOA VALUES('CLEIDE', 'M', '1979-10-13')

SELECT @@IDENTITY -- GUARDA O ULTIMO INDENTITY INSERIDO NA SEÇÃO
GO

INSERT INTO TELEFONE_PR VALUES('CEL', '6468551', 1)
INSERT INTO TELEFONE_PR VALUES('COM', '6516327', 1)
INSERT INTO TELEFONE_PR VALUES('CEL', '2548216', 2)
INSERT INTO TELEFONE_PR VALUES('CEL', '8112264', 2)
INSERT INTO TELEFONE_PR VALUES('COM', '7126279', 3)
INSERT INTO TELEFONE_PR VALUES('COM', '5432168', 2)
INSERT INTO TELEFONE_PR VALUES('CEL', '8726952', 3)

/* CRIANDO A PROCEDURE */

CREATE PROC SOMA
AS 
    SELECT 10 + 10 AS SOMA
GO

/* EXCUTANDO A PROCEDURE */

SOMA

EXEC SOMA
GO

/* DINAMICAS - COM PARAMETROS */

CREATE PROC CONTA @NUM1 INT, @NUM2 INT
AS  
    SELECT @NUM1 + @NUM2 AS RESULTADO
GO

EXEC CONTA 90, 70
GO

/* APAGANDO A PROCEDURE */

DROP PROC CONTA
GO

/* PROCEDURE EM TABELAS */

SELECT NOME, NUMERO
FROM PESSOA
INNER JOIN TELEFONE_PR
ON IDPESSOA = ID_PESSOA
WHERE TIPO = 'CEL'
GO

/* TRAZER OS TELEFONES DE ACORDO COM O TIPO PASSADO*/

CREATE PROC TELEFONES @TIPO CHAR(3)
AS
    SELECT NOME, NUMERO, TIPO
    FROM PESSOA
    INNER JOIN TELEFONE_PR
    ON IDPESSOA = ID_PESSOA
    WHERE TIPO = @TIPO
GO

EXEC TELEFONES 'CEL'
GO

EXEC TELEFONES 'COM'
GO

EXEC TELEFONES 'RES'
GO

/* PARAMETROS DE OUTPUT */

SELECT TIPO, COUNT(*) AS QUANTIDADE
FROM TELEFONE 
GROUP BY TIPO
GO

/* CRIANDO PROCEDURE COM PARAMETROS DE ENTRADA E SAIDA */

CREATE PROCEDURE GETTIPO @TIPO CHAR(3), @CONTADOR INT OUTPUT
AS 
    SELECT @CONTADOR = COUNT(*) 
    FROM TELEFONE
    WHERE TIPO = @TIPO
    GO

/* EXECUCAO DA PROC COM PARAMETRO DE SAIDA */

/* TRANSACTION SQL -> LINGUAGEM QUE O SQL SERVER TRABALHA */

DECLARE @SAIDA INT 
EXEC GETTIPO @TIPO = 'CEL', @CONTADOR = @SAIDA OUTPUT
SELECT @SAIDA AS QUANTIDADE
GO

DECLARE @SAIDA INT 
EXEC GETTIPO 'CEL', @SAIDA OUTPUT
SELECT @SAIDA AS QUANTIDADE
GO

/* PROCEDURE DE CADASTRO */

CREATE PROC CADASTRO @NOME VARCHAR(30), @SEXO CHAR(1), @NASCIMENTO DATE,
@TIPO CHAR(3), @NUMERO VARCHAR(10)
AS 
    DECLARE @FK INT 
    INSERT INTO PESSOA VALUES(@NOME, @SEXO, @NASCIMENTO)

    SET @FK = (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA = @@IDENTITY)

    INSERT INTO TELEFONE_PR VALUES(@TIPO, @NUMERO, @FK)
GO

EXEC CADASTRO 'THIAGO', 'M', '1981-02-02', 'CEL', '9556196'
GO

SELECT PESSOA.*, TELEFONE_PR.*
FROM PESSOA
INNER JOIN TELEFONE_PR
ON IDPESSOA = ID_PESSOA
GO


