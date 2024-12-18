/* TRIGGERS */

CREATE TABLE PRODUTOS(
    IDPRODUTO INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECO NUMERIC(10,2) NOT NULL
)
GO

CREATE TABLE HISTORICO(
    IDOPERACAO INT PRIMARY KEY IDENTITY,
    PRODUTO VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECOANTIGO NUMERIC(10, 2) NOT NULL,
    PRECONOVO NUMERIC(10, 2) NOT NULL,
    DATA DATETIME,
    USUARIO VARCHAR(30),
    MENSAGEM VARCHAR(100)
)
GO

INSERT INTO PRODUTOS VALUES('LIVRO SQL SERVER', 'LIVROS', 98.00)
INSERT INTO PRODUTOS VALUES('LIVRO ORACLE', 'LIVROS', 50.00)
INSERT INTO PRODUTOS VALUES('LICENCA POWERCENTER', 'SOFTWARES', 45000.00)
INSERT INTO PRODUTOS VALUES('NOOTBOOK I7', 'COMPUTADORES', 3150.00)
INSERT INTO PRODUTOS VALUES('LIVRO BUSINESS INTELLIGENCE', 'LIVROS', 90.00)

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO

/* VERIFICANDO O USUARIO DO BANCO */

SELECT SUSER_NAME()

/* TRIGGER DE DADOS - DATA MANIPULATION LANGUAGE */

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE
AS 
    DECLARE @IDPRODUTO INT
    DECLARE @PRODUTO VARCHAR(30)
    DECLARE @CATEGORIA VARCHAR(10)
    DECLARE @PRECO NUMERIC(10,2)
    DECLARE @PRECONOVO NUMERIC(10,2)
    DECLARE @DATA DATETIME
    DECLARE @USUARIO VARCHAR(30)
    DECLARE @ACAO VARCHAR(100)