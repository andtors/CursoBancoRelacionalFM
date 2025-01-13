/* MOSTRAR O PADRAO DE DATA */

SHOW DATESTYLE

/* PARA ALTERAR O PADRÃO DE DATA BASTA IR NO DIRETORIO DO POSTGRESQL ->
    DATA -> postgresql.config -> datestyle e alterar para 
    d - day
    m - month
    y - year
para o ordem que deseja  */
                                                          
/* FUNÇÕES DE AGREGAÇÕES */


/* QUERY SIMPLES */      

SELECT * FROM FUNCIONARIOS;

/* CONTANDO O NUMERO DE OCORRENCIAS */

SELECT COUNT(*) FROM FUNCIONARIOS;
SELECT COUNT(*) FROM DEPARTAMENTOS;
SELECT COUNT(*) FROM LOCALIZACOES;

/* AGRUPANDO POR SEXO COM GROUP BY */

SELECT COUNT(*) FROM FUNCIONARIOS
GROUP BY SEXO;

/* COLOCANDO O NOME DA COLUNA */

SELECT SEXO, COUNT(*) AS QUANTIDADE FROM FUNCIONARIOS
GROUP BY SEXO;

/* MOSTRANDO O NUMERO DE FUNCIONARIOS EM CADA DEPARTAMENTO */

SELECT DEPARTAMENTO, COUNT(*) FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* EXIBINDO O MAXIMO DE SALARIOS - 149929 */

SELECT MAX(SALARIO) AS "SALARIO MAXIMO" FROM FUNCIONARIOS;

/* EXIBINDO O MINIMO DE SALARIOS - 40138*/

SELECT MIN(SALARIO) AS "SALARIO MINIMO" FROM FUNCIONARIOS;

/* EXIBINDO MAXIMO E MINIMO JUNTOS */

SELECT MIN(SALARIO) AS "SALARIO MINIMO", MAX(SALARIO) AS "SALARIO MAXIMO"
FROM FUNCIONARIOS;

/* EXIBINDO O MAXIMO E O MINIMO DE CADA DEPARTAMENTO */

SELECT DEPARTAMENTO, MIN(SALARIO) AS "SALARIO MINIMO", MAX(SALARIO) AS "SALARIO MAXIMO"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* EXIBINDO O MAXIMO E O MINIMO POR SEXO */

SELECT SEXO, MIN(SALARIO) AS "SALARIO MINIMO", MAX(SALARIO) AS "SALARIO MAXIMO"
FROM FUNCIONARIOS
GROUP BY SEXO;

/* ESTATISTICAS */

/* MOSTRANDO UMA QUANTIDADE LIMITADA DE LINHAS */

SELECT * FROM FUNCIONARIOS
LIMIT 10;

/* QUAL O GASTO TOTAL DE SALARIO PAGO PELA EMPRESA */

SELECT SUM(SALARIO) AS TOTAL FROM FUNCIONARIOS;

/* QUAL O MONTANTE TOTAL QUE CADA DEPARTAMENTO RECEBE DE SALARIO */

SELECT DEPARTAMENTO, SUM(SALARIO) AS TOTAL
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* POR DEPARTAMENTO QUAL O TOTAL E A MEDIA PAGA PARA OS FUNCIONARIOS */

SELECT SUM(SALARIO) AS TOTAL, AVG(SALARIO) AS MEDIA
FROM FUNCIONARIOS;

SELECT DEPARTAMENTO, SUM(SALARIO) AS TOTAL, AVG(SALARIO) AS MEDIA
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* ORDENANDO */

SELECT DEPARTAMENTO, SUM(SALARIO) AS TOTAL, AVG(SALARIO) AS MEDIA
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 3;

SELECT DEPARTAMENTO, SUM(SALARIO) AS TOTAL, AVG(SALARIO) AS MEDIA
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 3 ASC;

SELECT DEPARTAMENTO, SUM(SALARIO) AS TOTAL, AVG(SALARIO) AS MEDIA
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 3 DESC;

/*

SOMA = TOTAL
MAX = MAIOR NUMERO
MIN = MENOR NUMERO 
MEDIA = A MEDIA DE UM AGRUPADO DE NUMEROS
MEDIANA = O MEIO DE UM GRUPO DE NUMEROS
MODA = QUANTAS VEZES SE REPETEM UM NUMERO
AMPLITUDE = O MAIOR MENOS O MENOR
VARIANCA = MÉDIA, SUBTRAE CADA MEMBRO DA MÉDIA, ELEVAR AO QUADRADO,
           SOMAR TODOS OS RESULTADOS, DIVIDIR OS RESULTADOS PELO N° DE OCORRENCIAS
           TIRAR A RAIZ DA VARIANCIA, DIVIDIR DP PELA MÉDIA
COEF.VAR = QUANDO ESTÁ MANIPULANDO DADOS DIFERENTE, DESVIP DIVIDO PELA MEDIA MULTIPLICADO POR 100

*/ 

/* Banco de Dados -> 1,2 e 3 Formas normais
Evitam reduncancia, consequentemente poupam espaço em disco.
Consomem muito processamento em função de Joins. Queries lentas

Data Science e B.I -> Focam em agregaçoes e performance. Não se 
preocupam com espaço em disco. Em B.I, modelagem mínima (DW)
em Data Science, preferencialmente modelagem Colunar */

/* O servidor de maquinas gerou um arquivo de log CSV.
Vamos importá-lo e analisa-lo dentro do nosso banco */

/* INSERINDO DADOS DE UMA PLANILHA NUMA TABELA */

CREATE TABLE MAQUINAS(
    MAQUINA VARCHAR(30),
    DIA INT,
    QTD NUMERIC(10,2)
);

COPY MAQUINAS
FROM 'C:\Users\Public\Downloads\LogMaquinas.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM MAQUINAS

/* QUAL A MEDIA DE CADA MAQUINA */

SELECT MAQUINA, AVG(QTD) AS MEDIA_QTD
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/* ARREDONDANDO */

SELECT MAQUINA, ROUND(AVG(QTD),2) AS MEDIA_QTD
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/* QUAL A MODA DAS QUANTIDADES */

SELECT MAQUINA, QTD, COUNT(*) AS MODA
FROM MAQUINAS
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC

/* QUAL A  MODA DAS QUANTIDADES DE CADA MAQUINA */

SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 01'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 02'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT MAQUINA, QTD, COUNT(*) FROM MAQUINAS
WHERE MAQUINA = 'Maquina 03'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

/* MODA DO DATASET INTEIRO */

SELECT QTD, COUNT(*)
FROM MAQUINAS
GROUP BY QTD
ORDER BY 2 DESC;

/* QUAL O MAXIMO E MINIMO E AMPLITUDE DE CADA MAQUINA */

SELECT MAQUINA,
    MAX(QTD) AS MAXIMO,
    MIN(QTD) AS MINIMO,
    MAX(QTD) - MIN(QTD) AS AMPLITUDE
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 4 DESC;

/* ACRESCENTE A MEDIA DO RELATORIO */    

SELECT MAQUINA,
    ROUND(AVG(QTD),2) AS MEDIA,
    MAX(QTD) AS MAXIMO,
    MIN(QTD) AS MINIMO,
    MAX(QTD) - MIN(QTD) AS AMPLITUDE
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 4 DESC;

/* DESVIO PADRAO E VARIANCIA */

STDDEV_POP(COLUNA)
VAR_POP(COLUNA)

SELECT MAQUINA,
    ROUND(AVG(QTD),2) AS MEDIA,
    MAX(QTD) AS MAXIMO,
    MIN(QTD) AS MINIMO,
    MAX(QTD) - MIN(QTD) AS AMPLITUDE,
    ROUND(STDDEV_POP(QTD), 2) AS DESV_PAD,
    ROUND(VAR_POP(QTD), 2) AS VARIANCIA
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 4 DESC;

/* CALCULO DE VARIANCIA */

CREATE OR REPLACE FUNCTION _final_median(numeric[])
   RETURNS numeric AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(numeric) (
  SFUNC=array_append,
  STYPE=numeric[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);

SELECT ROUND(MEDIAN(QTD), 2) AS MEDIANA
FROM MAQUINAS;

SELECT ROUND(MEDIAN(QTD), 2) AS MEDIANA
FROM MAQUINAS 
WHERE MAQUINA = 'Maquina 01';

SELECT ROUND(MEDIAN(QTD), 2) AS MEDIANA
FROM MAQUINAS 
WHERE MAQUINA = 'Maquina 02';

SELECT ROUND(MEDIAN(QTD), 2) AS MEDIANA
FROM MAQUINAS 
WHERE MAQUINA = 'Maquina 03';

INSERT INTO MAQUINAS VALUES('Maquina 01', 11, 15.9);
INSERT INTO MAQUINAS VALUES('Maquina 02', 11, 15.4);
INSERT INTO MAQUINAS VALUES('Maquina 03', 11, 15.7);
INSERT INTO MAQUINAS VALUES('Maquina 01', 12, 12.38);
INSERT INTO MAQUINAS VALUES('Maquina 02', 12, 12.24);
INSERT INTO MAQUINAS VALUES('Maquina 03', 12, 12.45);

DELETE FROM MAQUINAS WHERE DIA = 11 OR DIA = 12

/* 
    QUANTIDADE
    TOTAL
    MEDIA
    MAXIMO
    MINIMO
    AMPLITUDE    
    VARIANCIA
    DESVIO PADRAO
    MEDIANA
    COEF. VAR.
 */

SELECT MAQUINA, 
    COUNT(QTD) AS "QUANTIDADE",
    SUM(QTD) AS "TOTAL",
    ROUND(AVG(QTD), 2) AS "MEDIA",
    MAX(QTD) AS "MAXIMA",
    MIN(QTD) AS "MINIMA",
    MAX(QTD) - MIN(QTD) AS "AMPLIT. TOTAL",
    ROUND(VAR_POP(QTD), 2) AS "VARIANCIA",
    ROUND(STDDEV_POP(QTD), 2) AS "DESV. PADRAO",
    ROUND(MEDIAN(QTD), 2) AS "MEDIANA",
    ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100, 2) AS "COEF. VARIACAO"
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 1;

/* MODA - MODE() WITHIN GROUP(ORDER BY COLUNA) */

SELECT MODE() WITHIN GROUP(ORDER BY QTD) AS " MODA" FROM MAQUINAS;

SELECT MAQUINA,  MODE() WITHIN GROUP(ORDER BY QTD) AS " MODA"
FROM MAQUINAS
GROUP BY MAQUINA;

SELECT MAQUINA, 
    COUNT(QTD) AS "QUANTIDADE",
    SUM(QTD) AS "TOTAL",
    ROUND(AVG(QTD), 2) AS "MEDIA",
    MAX(QTD) AS "MAXIMA",
    MIN(QTD) AS "MINIMA",
    MAX(QTD) - MIN(QTD) AS "AMPLIT. TOTAL",
    ROUND(VAR_POP(QTD), 2) AS "VARIANCIA",
    ROUND(STDDEV_POP(QTD), 2) AS "DESV. PADRAO",
    ROUND(MEDIAN(QTD), 2) AS "MEDIANA",
    ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100, 2) AS "COEF. VARIACAO",
    MODE() WITHIN GROUP(ORDER BY QTD) AS " MODA"
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 1;


/* 
    PODEMOS CRIAR UMA TABELA COM O RESULTADO DE UMA QUERIE E ESSA É A 
    FORMA DE REALIZAR UMA MODELAGEM COLUNAR 
    CREATE TABLE AS SELECT
*/

SELECT F.NOME, G.NOME, L.DATA, L.DIAS, L.MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

SELECT * FROM FUNCIONARIOS;

CREATE TABLE RE_LOCADORA AS 
SELECT F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

COPY RE_LOCADORA TO 
'C:\Users\Public\Downloads\RE.LOCADORA.CSV'
DELIMITER ';'
CSV HEADER;

DROP TABLE LOCACAO

CREATE TABLE LOCACAO(
	IDLOCACAO INT PRIMARY KEY,
	DATA DATE,
	MIDIA INT,
	DIAS INT,
	ID_FILME INT,
	FOREIGN KEY(ID_FILME)
	REFERENCES FILME(IDFILME)
);

CREATE SEQUENCE SEQ_LOCACAO;

NEXTVAL('SEQ_LOCACAO');

INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/08/2019',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',56,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/07/2019',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2019',43,1,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2019',23,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/07/2019',76,3,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2019',45,1,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/08/2019',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/02/2019',23,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/07/2019',23,3,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/02/2019',38,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/10/2019',56,1,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'06/12/2019',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',56,2,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/10/2019',76,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/09/2019',32,2,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/02/2019',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',23,1,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/09/2019',45,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2019',89,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/07/2019',23,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2019',21,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',34,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/08/2019',67,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',76,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',66,3,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/12/2019',90,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2019',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2019',65,5,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/08/2019',43,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2019',27,31,200);

SELECT * FROM LOCACAO

DROP TABLE RE_LOCADORA;

SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO g
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

CREATE TABLE RELATORIO_LOCADORA AS 
SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO g
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

SELECT * FROM RELATORIO_LOCADORA;
SELECT * FROM LOCACAO;

/* SELECT PARA TRAZER OS REGISTROS NOVOS */

SELECT MAX(IDLOCACAO) AS RELATORIO, (SELECT MAX(IDLOCACAO) FROM LOCACAO) AS LOCACAO
FROM RELATORIO_LOCADORA;

SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO g
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME
WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);

/* INSERINDO OS REGISTROS NOVOS */

INSERT INTO RELATORIO_LOCADORA
SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME
WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);

/* VAMOS DEIXAR O PROCEDIMENTO AUTOMATICO POR MEIO DE UMA TRIGGER */

CREATE OR REPLACE FUNCTION ATUALIZA_REL()
RETURNS TRIGGER AS $$
BEGIN 
    INSERT INTO RELATORIO_LOCADORA
    SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
    INNER JOIN FILME F
    ON G.IDGENERO = F.ID_GENERO
    INNER JOIN LOCACAO L
    ON L.ID_FILME = F.IDFILME
    WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);

    COPY RELATORIO_LOCADORA TO
    'C:\Users\Public\Downloads\RELATORIO.LOCADORA.CSV'
    DELIMITER ';'
    CSV HEADER;

    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

/* COMANDO PARA APAGAR UMA TRIGGER */

DROP TRIGGER TG_RELATORIO ON LOCACAO;

CREATE TRIGGER TG_RELATORIO
AFTER INSERT ON LOCACAO
FOR EACH ROW
    EXECUTE PROCEDURE ATUALIZA_REL();

/* INSERINDO NOVOS REGISTROS */

INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'), NOW(),100,7,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'), NOW(),500,1,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'), NOW(),800,6,500);

SELECT * FROM LOCACAO;
SELECT * FROM RELATORIO_LOCADORA;

/* SINCRONIZANDO COM REGISTROS DELETADOS */

CREATE OR REPLACE FUNCTION DELETE_LOCACAO()
RETURNS TRIGGER AS
$$
BEGIN
    DELETE FROM RELATORIO_LOCADORA
    WHERE IDLOCACAO = OLD.IDLOCACAO;

    COPY RELATORIO_LOCADORA TO
    'C:\Users\Public\Downloads\RELATORIO.LOCADORA.CSV'
    DELIMITER ';'
    CSV HEADER;

    RETURN OLD;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER DELETE_REG
    BEFORE DELETE ON LOCACAO
    FOR EACH ROW
    EXECUTE PROCEDURE DELETE_LOCACAO();

SELECT * FROM LOCACAO;
SELECT * FROM RELATORIO_LOCADORA;

DELETE FROM LOCACAO
WHERE IDLOCACAO = 1;

/* VARIAVEIS DUMMY PARA MACHINE LEARNING */

/* UTILIZANDO O CASE */

SELECT NOME, SEXO FROM FUNCIONARIOS;    

SELECT NOME, CARGO,
CASE
    WHEN CARGO = 'Financial Advisor' THEN 'Condição 01'
    WHEN CARGO = 'Structural Engineer' THEN 'Condição 02'
    WHEN CARGO = 'Executive Secretary' THEN 'Condição 03'
    WHEN CARGO = 'Sales Associative' THEN 'Condição 04'
    ELSE 'OUTRAS CONDIÇÕES'
END AS "CONDICOES"
FROM FUNCIONARIOS

SELECT NOME,
CASE 
    WHEN SEXO = 'Masculino' THEN 'M'
    ELSE 'F'
END
FROM FUNCIONARIOS;



