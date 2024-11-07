/* SUBQUERIES */
/* QUEM VENDEU MENOS EM MARCO*/

SELECT 
    (SELECT MIN(MARCO) FROM VENDEDORES) AS VALOR,
    (SELECT NOME FROM VENDEDORES WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES)) AS NOME;

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

/* QUEM VENDEU MAIS EM MARCO */   
SELECT 
    (SELECT MAX(MARCO) FROM VENDEDORES) AS VALOR,
    (SELECT NOME FROM VENDEDORES WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES)) AS NOME;  

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);


/* QUEM VENDEU MAIS QUE A MEDIA DE FEVEREIRO */
SELECT 
    (SELECT AVG(FEVEREIRO) FROM VENDEDORES) AS VALOR,
    (SELECT NOME FROM VENDEDORES WHERE FEVEREIRO >= (SELECT AVG(FEVEREIRO) FROM VENDEDORES) LIMIT 1) AS NOME;

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO > (SELECT MAX(FEVEREIRO) FROM VENDEDORES);      

/* OPERACOES EM LINHA */

SELECT  NOME, 
        JAN,
        FEV,
        MARCO,
        (JANEIRO + FEVEREIRO + MARCO) AS "TOTAL",
        TRUNCATE((JANEIRO + FEVEREIRO + MARCO)/ 3) AS MEDIA
        FROM VENDEDORES;