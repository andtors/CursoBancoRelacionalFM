
/* TODOS CLIENTES (TELEFONE E ENDERECP) */
DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;
 
SELECT  C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
        E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
        T.TIPO, T.NUMERO
FROM CLIENTE C 
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE

/* TODOS OS HOMENS */
SELECT  C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
        E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
        T.TIPO, T.NUMERO
FROM CLIENTE C 
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'M';

/* CORREÇÃO DO SEXO DOS REGISTROS - 11, 12, 16, 17 */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 11
OR IDCLIENTE = 12
OR IDCLIENTE = 16
OR IDCLIENTE = 17

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (11, 12, 16, 17);

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN (11, 12, 16, 17);


/* TODAS AS MULHERES */
SELECT * FROM CLIENTE
WHERE SEXO = 'F';


/* QUANTIDADE AGRUPADO POR SEXO */
SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO; --7

/* QUANTIDADE DE TIPO DE TELEFONE, BAIRRO E CIDADE */
SELECT TIPO, COUNT(*)
FROM TELEFONE
GROUP BY TIPO; --8

SELECT BAIRRO, COUNT(*)
FROM ENDERECO
GROUP BY BAIRRO; --9

SELECT CIDADE, COUNT(*)
FROM ENDERECO
GROUP BY CIDADE; --10


/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO NAO TENHAM CELULAR */

-- COMO USAMOS A LÓGICA (AND) COLOCAMOS EM ORDEM DE MENOR AO MAIOR
SELECT IDCLIENTE, EMAIL
FROM CLIENTE C
	INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
AND E.BAIRRO = 'CENTRO' 
AND E.CIDADE = 'RIO DE JANEIRO'
AND T.TIPO != 'CEL'; 


