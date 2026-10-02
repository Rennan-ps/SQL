SELECT * FROM titulares;

/* ---------- Inicio apoio_cidades ------------ */

SELECT * FROM apoio_cidades;

/*distinguindo cidades*/
SELECT DISTINCT cidade FROM titulares;

/* criando a tabela e distinguindo as cidades*/	
CREATE TABLE apoio_cidades AS
SELECT DISTINCT 
	cidade 
FROM 
	titulares; 
	
SHOW TABLES;

DESC titulares;
DESC apoio_cidades;

/*inserindo o campo o id indexado*/
ALTER TABLE apoio_cidades
ADD COLUMN 
	id INT NOT NULL AUTO_INCREMENT 
	PRIMARY KEY FIRST; 
	
/* alterando o nome do campo para descrição */
ALTER TABLE apoio_cidades
CHANGE cidade descricao VARCHAR (50);

/* atualizando tiulares com a primeira forma normal em cidades*/

UPDATE titulares tit
LEFT JOIN apoio_cidades cid
	ON  tit.Cidade = cid.descricao
SET tit.Cidade = cid.id
WHERE tit.Cidade = cid.descricao;

/* atualizando a estrutura do campo cidade para numeros */

ALTER TABLE titulares 
MODIFY COLUMN cidade INT NOT NULL;

/* --------------- Fim apoio_cidades ----------------- */

/* --------------- inicio apoio_uf ----------------- */
	
SELECT * FROM titulares;

SELECT * FROM apoio_uf;

DESC titulares;

/* criando a tabela de apoio UF */

CREATE TABLE apoio_uf
(
	id INT NOT NULL AUTO_INCREMENT,
	uf CHAR(2),
	descricao VARCHAR(30) DEFAULT NULL,
	PRIMARY KEY(id) USING BTREE 
);

SHOW TABLES;


DESC apoio_uf;

INSERT INTO apoio_uf (uf, descricao) VALUES
( 'AC', 'Acre'),
( 'AL', 'Alagoas'),
( 'AP', 'Amapá'),
( 'AM', 'Amazonas'),
( 'BA', 'Bahia'),
( 'CE', 'Ceará'),
( 'DF', 'Distrito Federal'),
( 'ES', 'Espírito Santo'),
( 'GO', 'Goiás'),
( 'MA', 'Maranhão'),
( 'MT', 'Mato Grosso'),
( 'MS', 'Mato Grosso do Sul'),
( 'MG', 'Minas Gerais'),
( 'PA', 'Pará'),
( 'PB', 'Paraíba'),
( 'PR', 'Paraná'),
( 'PE', 'Pernambuco'),
( 'PI', 'Piauí'),
( 'RJ', 'Rio de Janeiro'),
( 'RN', 'Rio Grande do Norte'),
( 'RS', 'Rio Grande do Sul'),
( 'RO', 'Rondônia'),
( 'RR', 'Roraima'),
( 'SC', 'Santa Catarina'),
( 'SP', 'São Paulo'),
( 'SE', 'Sergipe'),
( 'TO', 'Tocantins');

/* atualivando uf em titulares */ 

UPDATE titulares tit 
LEFT JOIN apoio_uf UF 
	ON tit.UF = UF.uf 
SET tit.UF = UF.id
WHERE tit.UF = UF.uf;

/* atualizando a estrutura das UFs em titulares */

ALTER TABLE titulares 
MODIFY COLUMN UF INT NOT NULL;

/* --------------- fim apoio_uf ----------------- */

/* --------------- inicio dependentes ----------------- */

SELECT * FROM dependentes;

SELECT * FROM apoio_cidades;
SELECT * FROM apoio_uf;

DESC dependentes;

SELECT DISTINCT (Cidade) FROM dependentes;

/* atualizando cidades para a FN */

UPDATE dependentes dep
LEFT JOIN apoio_cidades cid
	ON dep.Cidade = cid.descricao
SET dep.Cidade = cid.id
WHERE dep.Cidade = cid.descricao;

/* atualizando a estrutura do campo "cidades" */

ALTER TABLE dependentes 
MODIFY COLUMN Cidade INT NOT NULL;

/* atualizando UF para a FN */

UPDATE dependentes dep
LEFT JOIN apoio_uf UF
	ON dep.UF = UF.uf
SET dep.UF = UF.id
WHERE dep.UF = UF.uf;

/* atualizando a estrutura do campo "UF" */

ALTER TABLE dependentes 
MODIFY COLUMN UF INT NOT NULL;

/* --------------- fim dependentes ----------------- */

/* --------------- mudanças ----------------- */

DESC titulares;
DESC dependentes;

ALTER TABLE titulares
MODIFY COLUMN CEP CHAR(9);

ALTER TABLE dependentes
MODIFY COLUMN CEP CHAR(9);

ALTER TABLE titulares
MODIFY COLUMN Telefone CHAR(14);

ALTER TABLE dependentes
MODIFY COLUMN Telefone CHAR(14);

/* --------------- inicio filmes ----------------- */

SHOW TABLES;

SELECT * FROM apoio_situacao;

DESC filmes;

SELECT * FROM filmes
ORDER BY Situacao;

/* criando a tabela com a distinção de situação */
CREATE TABLE apoio_situacao AS 
SELECT DISTINCT 
	situacao
FROM 
	filmes;

/* adicionando a coluna id como primeiro campo*/	
ALTER TABLE apoio_situacao
	ADD COLUMN id int NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
	
ALTER TABLE apoio_situacao
DROP COLUMN id;

/* atualizando o campo "Situacao" para a FN */
UPDATE filmes fil
LEFT JOIN apoio_situacao sit 
	ON fil.Situacao = sit.Situacao
SET fil.Situacao = sit.id
WHERE fil.Situacao = sit.Situacao;

ALTER TABLE filmes 
MODIFY COLUMN situacao INT NOT NULL;

/* criando a tabela com a distinção de genero */
CREATE TABLE apoio_genero AS 
SELECT DISTINCT 
	genero
FROM 
	filmes;
	
/* adicionando a coluna id como primeiro campo*/	
ALTER TABLE apoio_genero
	ADD COLUMN id int NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

/* atualizando o campo "genero" para a FN */	
UPDATE filmes fil
LEFT JOIN apoio_genero gen
	ON fil.Genero = gen.genero
SET fil.Genero = gen.id
WHERE fil.Genero = gen.genero;

ALTER TABLE filmes 
MODIFY COLUMN genero INT NOT NULL;

/* criando a tabela com a distinção de ""pais" */
CREATE TABLE apoio_pais AS 
SELECT DISTINCT 
	pais
FROM 
	filmes;

/* adicionando a coluna id como primeiro campo*/	
ALTER TABLE apoio_pais
	ADD COLUMN id int NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

/* atualizando o campo "pais" para a FN */	
UPDATE filmes fil
LEFT JOIN apoio_pais pais
	ON fil.Pais = pais.pais
SET fil.Pais = pais.id
WHERE fil.Pais = pais.pais;

ALTER TABLE filmes 
MODIFY COLUMN pais INT NOT NULL;

/* --------------- Fim filmes ----------------- */
/* --------------- inicio locaçao ----------------- */

-- criando a tabela locacoes

CREATE TABLE locacoes
(
	id INT(15) ZEROFILL NOT NULL AUTO_INCREMENT, 
	Matricula_Locatario INT(15) ZEROFILL NOT NULL, 
	id_filme INT(15) NOT NULL,
	Data_Pedido DATE DEFAULT (CURRENT_DATE()),
	Data_Devolucao DATE DEFAULT NULL,
	PRIMARY KEY(id) USING BTREE  
);

DESC locacoes;
DESC filmes;

-- verificando os filmes alugados 

SELECT id,Matricula_Locatario
FROM filmes
WHERE Matricula_Locatario
IS NOT NULL; 

INSERT INTO locacoes (id_filme,Matricula_Locatario)
SELECT id,Matricula_Locatario
FROM filmes
WHERE Matricula_Locatario
IS NOT NULL; 

SELECT * FROM locacoes;

ALTER TABLE filmes
DROP COLUMN Matricula_Locatario;

/* Lista 5 views  */

-- Selecione todos os titulares que moram em Petrópolis

CREATE VIEW vw_titulares_petropolis AS 
SELECT  tit.Nome, tit.Endereco, tit.Bairro, cid.descricao
FROM titulares tit
LEFT JOIN apoio_cidades cid
	ON tit.cidade = cid.id
LEFT JOIN apoio_uf uf 
	ON tit.UF = uf.id
WHERE cid.descricao = 'Petropolis';

















