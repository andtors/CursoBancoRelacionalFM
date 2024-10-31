/* ENTRANDO COM MAIS TELEFONES */

UPDATE CLIENTE
SET TELEFONE = '97865434'
WHERE NOME = 'JOAO';

SELECT * FROM CLIENTE;

UPDATE CLIENTE
SET TELEFONE = '22923110 - 97865434'
WHERE NOME = 'JOAO';

SELECT * FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT ENDERECO, COUNT(*) FROM CLIENTE
GROUP BY ENDERECO;

/* ERROS NUMA MODELAGEM RUIM 

- Os registros não são padronizados o que acarrega em erros na hora de consultar
*/

INSERT INTO CLIENTE VALUES('CARLA', 'F', 'C.LOPES@UOL.COM', 45638854, '9301-7585', 'RUA COPPER LEAF - WILLIANSBURG - KITCHEN');

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* PRIMEIRA FORMA NORMAL 

1 - TODO CAMPO VETORIZADO SE TORNA OUTRA TABELA

2 - TODO CAMPO MULTIVALORADO SE TORNARA OUTRA TABELA
QUANDO O CAMPO FOR DIVISIVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE INDENTIFIQUE TODO O REGISTRO COMO SENDO UNICO
ISSO É O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY

*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES;

CREATE TABLE CLIENTE (
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(50) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

SHOW TABLES;

CREATE TABLE ENDERECO (
    ID_ENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE, 
    FOREIGN KEY (ID_CLIENTE)
    REFERENCES CLIENTE(ID_CLIENTE) 
);

CREATE TABLE TELEFONE (
    ID_TELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(30) NOT NULL,
    ID_CLIENTE INT, 
    FOREIGN KEY (ID_CLIENTE)
    REFERENCES CLIENTE(ID_CLIENTE)
);

/*
    ENDERECO - OBRIGATORIO
    CADASTRO  DE SOMENTE UM

    TELEFONE - NAO OBRIGATORIO
    CADASTRO DE MAIS DE UM (OPCIONAL)

    CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
    QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE REGISTROS

    -- IMPORTANTE FOREIGN KEY -- 
    EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA

    EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE
    NA CARDIANALIDADE N
 */

INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@IG.COM', 7656787887);
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'F', 'CARLOS@IG.COM', 54623232);
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA@IG.COM', 3216357896);
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', NULL, 648435123);
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@IG.COM', 56846132);
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'F', 'CELIA@IG.COM', 21635468);
 
INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDORR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 8);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES', 5);

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '7417465', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '6541321', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '4563727', 1);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '7507272', 2);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '7507507', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '1204277', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '7537827', 3);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '9854235', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '0564652', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '6278153', 2);




