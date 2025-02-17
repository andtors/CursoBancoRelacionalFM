/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* IS OU IS NOT NULL CUIDADO AO UTILIZAR*/

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM';

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIA PRA VIDA INTEIRA */

SELECT * FROM CLIENTE
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'JOAO@IG.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'JORGE@IG.COM.BR'
WHERE NOME = 'JORGE';

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@IG.COM.BR'
WHERE NOME = 'LILIAN';

SELECT NOME, EMAIL
FROM CLIENTE;

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

DELETE FROM CLIENTE;

SELECT * FROM CLIENTE WHERE NOME = 'ANA'

SELECT COUNT(*) FROM CLIENTE; -- TOTAL 6 DICA: SEMPRE CONTAR O TOTAL DE REGISTROS ANTES

SELECT COUNT(*) FROM CLIENTE -- TOTAL DELETADO DE 1 DICA: SEMPRE CONTAR O TOTAL A SER DELETADO
WHERE NOME = 'ANA'

DELETE FROM CLIENTE
WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE; -- RESTANTE 5

SELECT 6 - 1;

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES('CARLA', 'F', 'C.LOPES@UOL.COM', 45638854, '4575-0048', 'RUA COPPER LEAF - WILLIANSBURG - KITCHEN');

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM';

-- ANTES DE DELETAR SEMPRE VERIFICAR COM SELECT O QUE IRÁ SER EXCLUIDO
SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM'; -- OR TRAZ TODO MUNDO COM PELO MENOS UMA DAS DUAS CONDICOES

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@TERATI.COM.BR'; -- AND TRAZ APENAS O REGISTRO QUE SATISFACA AS DUAS CONDICOES

SELECT * FROM CLIENTE;

/* UPDATE 
UPDATE {TABELA}
SET {DATA A SER ALTERADA}
WHERE {CONDICAO}
*/

