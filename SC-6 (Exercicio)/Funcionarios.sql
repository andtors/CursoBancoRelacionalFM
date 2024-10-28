/* Exercicio da secão 6 */
CREATE DATABASE EXERCICIO;
CREATE TABLE FUNCIONARIOS(
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
);
insert into funcionarios values (1,'Kelley','rkelley0@soundcloud.com','Feminino','Computadores','10/2/2009',67470,'Structural Engineer',2);
insert into funcionarios values (2,'Armstrong','sarmstrong1@infoseek.co.jp','Masculino','Esporte','3/31/2008',71869,'Financial Advisor',2);
insert into funcionarios values (3,'Carr','fcarr2@woothemes.com','Masculino','Automotivo','7/12/2009',101768,'Recruiting Manager',3);
insert into funcionarios values (4,'Murray','jmurray3@gov.uk','Feminino','Joalheria','12/25/2014',96897,'Desktop Support Technician',3);
insert into funcionarios values (5,'Ellis','jellis4@sciencedirect.com','Feminino','Alimentícios','9/19/2002',63702,'Software Engineer III',7);
insert into funcionarios values (6,'Phillips','bphillips5@time.com','Masculino','Ferramentas','8/21/2013',118497,'Executive Secretary',1);
insert into funcionarios values (7,'Williamson','rwilliamson6@ted.com','Masculino','Computadores','5/14/2006',65889,'Dental Hygienist',6);
insert into funcionarios values (8,'Harris','aharris7@ucoz.com','Feminino','Brinquedos','8/12/2003',84427,'Safety Technician I',4);
insert into funcionarios values (9,'James','rjames8@prnewswire.com','Masculino','Joalheria','9/7/2005',108657,'Sales Associate',2);
/* e demais registros...*/

/* 1 */
SELECT  COUNT(*) FROM FUNCIONARIOS;

/* Quantidade */
/* Traz todos os departamentos e suas quantidades em ordem crescente */
SELECT COUNT(*), DEPARTAMENTO
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 1;

SELECT 
    (SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'Filmes') AS QNTD_FILMES,
    (SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'roupas') AS QNTD_ROUPAS;

/* Funcionarios */
/* Quantidade */
--Como estamos trabalhando com OR e a segunda condição é opcional
--colocamos na primeira condição quem tem mais chances de saída
--verdadeira, pois a segunda condição não será checada nesse caso.
SELECT * FROM FUNCIONARIOS WHERE DEPARTAMENTO = 'Roupas' OR DEPARTAMENTO = 'Filmes';

/* 2 */
/* Quantidade*/
SELECT COUNT(*) AS QNTD_FEM 
FROM FUNCIONARIOS  
WHERE SEXO = 'Feminino' 
GROUP BY SEXO;

/* Funcionarios */
--Em situações de AND colocamos em primeira a condição que tem menor quantidade
SELECT * FROM FUNCIONARIOS
WHERE 
(DEPARTAMENTO = 'Filmes' AND SEXO = 'Feminino')
OR 
(DEPARTAMENTO = 'Lar' AND SEXO = 'Feminino');

/* 3 */
/* Funcionarios */
SELECT * 
FROM FUNCIONARIOS 
WHERE DEPARTAMENTO = 'Jardim'
OR SEXO = 'MASCULINO'; 

