/* DELIMITADOR */

CREATE DATABASE AULASQL

USE AULASQL

CREATE TABLE TESTE(
    NOME VARCHAR(30)
)

CREATE DATABASE BANCO01

USE BANCO01

CREATE TABLE TESTE(
    NOME VARCHAR(30)
)

CREATE DATABASE BANCO02
GO

USE BANCO02
GO

CREATE TABLE TESTE(
    NOME VARCHAR(30)
)
GO

/* ORGANIZAR FISICAMENTE E LOGICAMENTE UM BANCO DE DADOS 

1 - CRIAR UM BANCO COM ARQUIVOS PARA OS SETORES DE MKT E RH
2 - CRIAR UM ARQUIVO GERAL
3 - DEIXAR O MDG APENAS COM O DICIONARIO DE DADOS
4 - CRIAR 2 GRUPOS DE ARQUIVOS (PRIMARY - MDF)

*/

CREATE TABLE TB_EMPRESA(
    ID INT,
    NOME VARCHAR(50)
)
GO