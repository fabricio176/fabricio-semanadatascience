-- DDL(Data Definition Language)
	-- CREATE 
		-- TABLE
        -- DATABASE
        -- INDEX
        -- VIEW
        -- PROCEDURE
        -- FUNCTION
	-- DROP
	-- ALTER
-- DML(Data Manipulation Language)
	-- INSET
    -- UPDATE
    -- DELETE

-- DQL(DATA QUERY LANGUAGE)
	-- SELECT
    -- WHERE
    -- FROM
	-- < > >=  AND OR

-- DCL(DATA CONTROL LANGUAGE)
	-- CRIAR USUÁRIOS
    -- Tarefas de ADMIN
-- DTL(DATA TRANSACTION LANGUAGE)
    -- Transações
    
    -- BEGIN TRAN (OU BEGIN TRANSACTION) – Marca o começo de uma transação no banco da dados  que pode ser completada ou não.
    -- COMMIT – Envia todos os dados da transação permanentemente para o banco de dados.
    -- ROLLBACK – Desfaz as alterações feitas na transação realizada.

-- DDL: CREATE DATABASE
CREATE DATABASE schooltracker;

USE schooltracker;
-- Mostrar Tabelas

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR(8) NOT NULL UNIQUE
);

CREATE TABLE diariobordo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT NOT NULL,
    datahora DATETIME,
    fk_aluno_id INT
);

ALTER TABLE diariobordo ADD CONSTRAINT fk_aluno_id
	FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id)
    ON DELETE CASCADE;

CREATE TABLE professor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55)
);

CREATE TABLE avaliacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    n1 INT,
    n2 INT,	
    n3 INT,
    n4 INT,
    fk_aluno_id INT
);

ALTER TABLE 
	avaliacao 
ADD CONSTRAINT 
	fk_aluno_id2
FOREIGN KEY 
	(fk_aluno_id) 
REFERENCES aluno(id) ON DELETE CASCADE;

ALTER TABLE avaliacao ADD COLUMN fk_professor_id INT;

ALTER TABLE 
	avaliacao 
ADD CONSTRAINT 
	fk_professor_id
FOREIGN KEY 
	(fk_professor_id)
REFERENCES 
	professor(id);

ALTER TABLE aluno ADD COLUMN nome VARCHAR(55);

UPDATE aluno SET nome = 'Ana Silva' WHERE id = 1;
UPDATE aluno SET nome = 'Carlos Souza' WHERE id = 2;
UPDATE aluno SET nome = 'Fernanda Oliveira' WHERE id = 3;
UPDATE aluno SET nome = 'Gabriel Santos' WHERE id = 4;
UPDATE aluno SET nome = 'Juliana Pereira' WHERE id = 5;
	
    
-- Inserção 1
INSERT INTO avaliacao (n1, n2, n3, n4, fk_aluno_id) VALUES (8, 7, 9, 6, 1);

-- Inserção 2
INSERT INTO avaliacao (n1, n2, n3, n4, fk_aluno_id) VALUES (5, 6, 7, 8, 2);

-- Inserção 3
INSERT INTO avaliacao (n1, n2, n3, n4, fk_aluno_id) VALUES (9, 8, 10, 9, 3);

-- Inserção 4
INSERT INTO avaliacao (n1, n2, n3, n4, fk_aluno_id) VALUES (4, 5, 6, 7, 4);

-- Inserção 5
INSERT INTO avaliacao (n1, n2, n3, n4, fk_aluno_id) VALUES (7, 7, 7, 7, 5);

SELECT * FROM avaliacao;
SELECT * FROM aluno;

SELECT
	a.nome, 
    av.n1 as '1° Bimestre', 
    av.n2 as '2° Bimestre', 
    av.n3 as '3° Bimestre', 
    av.n4 as '4° Bimestre',
	(n1+n2+n3+n4)/4.0 AS media,
    IF((n1+n2+n3+n4)/4.0 >= 6, 'Aprovado', 'Reprovado') AS 'Situação'
FROM 
	aluno a 
INNER JOIN 
	avaliacao av 
ON 
	av.fk_aluno_id = a.id;

ALTER TABLE aluno ADD COLUMN tempoestudo INT;
ALTER TABLE aluno ADD COLUMN rendafamiliar DECIMAL;


SELECT last_insert_id();

