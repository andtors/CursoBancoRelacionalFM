/* Exercicio Livraria */

/* Criação da Tabela e inserção de dados */
CREATE DATABASE LIVRARIA;
CREATE TABLE(
    NOME_LIVRO VARCHAR(100),
    NOME_AUTOR VARCHAR(30),
    SEXO_AUTOR CHAR(1),
    LIVRO_PAGS INT(4),
    NOME_EDITORA VARCHAR(30),
    VALOR_LIVRO DECIMAL(5,2),
    ESTADO_EDITORA CHAR(2),
    ANO_LIVRO INT(4)
)

INSERT INTO LIVROS (NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, LIVRO_PAGS, NOME_EDITORA, VALOR_LIVRO, ESTADO_EDITORA, ANO_LIVRO) 
VALUES 
('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49,90, 'RJ', 2009),
('SQL para leigos', 'João Nunes', 'M', 450, 'Addilson', 98.00, 'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45.00, 'RJ', 2008),
('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018),
('Habitos Saudáveis', 'Eduardo Santos', 'M', 390, 'Beta', 150.98, 'RJ', 2019),
('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60.00, 'MG', 2016),
('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100.00, 'ES', 2015),
('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011),
('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018),
('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);

/* Questoes de 1 - 6 */
SELECT * FROM livraria.livros;

SELECT NOME_LIVRO, NOME_EDITORA FROM LIVROS;

SELECT NOME_LIVRO, ESTADO_EDITORA FROM LIVROS WHERE SEXO_AUTOR = 'M';

SELECT NOME_LIVRO, LIVRO_PAGS FROM LIVROS WHERE SEXO_AUTOR = 'F';

SELECT VALOR_LIVRO FROM LIVROS WHERE ESTADO_EDITORA = 'SP';

SELECT NOME_AUTOR, SEXO_AUTOR FROM LIVROS WHERE SEXO_AUTOR = 'M' AND ESTADO_EDITORA = 'SP' OR SEXO_AUTOR = 'M' AND ESTADO_EDITORA = 'RJ'