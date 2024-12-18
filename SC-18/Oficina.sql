CREATE DATABASE PROJETO_OFICINA;

USE PROJETO_OFICINA;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME CHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    ID_CARRO INT UNIQUE
); 

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('CEL', 'RES', 'COM') NOT NULL,
    NUMERO VARCHAR(30) NOT NULL,
    ID_CLIENTE INT
);

CREATE TABLE MARCA(
  IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
  MARCA VARCHAR(30) UNIQUE NOT NULL  
);

CREATE TABLE CARRO(
    IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
    MODELO VARCHAR(30) UNIQUE NOT NULL,
    PLACA VARCHAR(30) UNIQUE NOT NULL,
    ID_MARCA INT
);

CREATE TABLE COR(
    IDCOR INT PRIMARY KEY AUTO_INCREMENT,
    COR VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO_COR(
    ID_CARRO INT,
    ID_COR INT,
    PRIMARY KEY(ID_CARRO, ID_COR)
);

/* CONSTRAINTS */

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

/* PREENCHER */

/* CLIENTE */
INSERT INTO CLIENTE VALUES
(NULL, "ANDRE", "M", 1),
(NULL, "PAULA", "F", 4),
(NULL, "RUBENS", "M", 2),
(NULL, "BEATRIZ", "M", 5),
(NULL, "MATHEUS", "M", 3),
(NULL, "RAOUL", "M", 7),
(NULL, "PEDRO", "M", 9),
(NULL, "PATRICK", "M", 10),
(NULL, "LUCAS", "M", 8),
(NULL, "NICOLAS", "M", 6);



/* CARRO */
INSERT INTO CARRO VALUES
( NULL, "SUPRA", "SUP-1234", 1),
( NULL, "ECLIPSE", "ECL-5432", 21),
( NULL, "S2000", "SDO-3521", 17),
( NULL, "HB20", "HBV-8731", 18),
( NULL, "CORSA", "COR-6354", 16),
( NULL, "SENTRA", "SEN-3281", 19),
( NULL, "FORD K", "FOK-6355", 20),
( NULL, "LANCER", "LAN-6540", 21),
( NULL, "FIESTA", "FIE-0635", 20),
( NULL, "CIVIC", "CIV-3524", 17);



/* MARCA */
INSERT INTO MARCA VALUES
(NULL, "TOYOTA"),
(NULL, "CHEVROLET"),
(NULL, "HONDA"),
(NULL, "HYUNDAI"),
(NULL, "NISSAN"),
(NULL, "FORD"),
(NULL, "TOYOTA"),
(NULL, "MITSUBISHI");



/* COR */
INSERT INTO COR VALUES
(NULL, "PRATA"),
(NULL, "PRETO"),
(NULL, "VERMELHO"),
(NULL, "AZUL");


/* TELEFONE */
INSERT INTO TELEFONE VALUES
(NULL,"CEL","1234-5687", 4),
(NULL,"RES","6542-5435", 4),
(NULL,"RES","3538-6306", 9),
(NULL,"COM","6535-3532", 10),
(NULL,"CEL","0563-6835", 11),
(NULL,"CEL","0968-5421", 5);



/* CARRO - COR */
INSERT INTO CARRO_COR VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 1),
(5, 1),
(6, 2),
(7, 3),
(8, 1),
(9, 3),
(10, 4);

