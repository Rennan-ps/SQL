/* =========================================================================
   BD1 - Locadora de Filmes - Resolução das Listas 1 a 4
   Prof. Carlos Muniz
   
   Rennan Procópio dos Santos


/* =========================================================================
   LISTA 1 - DML (INSERTS, UPDATES, DELETE)
   ========================================================================= */


-- 1. Insira um registro na tabela titulares
INSERT INTO titulares (Nome, Endereco, Bairro, Cidade, UF, CEP, Email, Telefone)
VALUES ('Rennan dos Santos', 'Rua das pedras 321', 'Castelanea', 'Petrópolis', 'RJ', '123456-789', 'oi@123', '(24) 91111-1234');

-- 2. Insira a documentação para o novo titular inserido
INSERT INTO documentacao (CPF, CNH, RG, Cartao, CVV2, Expiracao)
SELECT '12.345.678-9', '56774893210', '99999888', '0987654321234567', '788', '9/2026'
FROM titulares
WHERE nome = 'Rennan dos Santos' AND bairro = 'Castelanea';

-- 3. Insira dois dependentes para o novo titular inserido
INSERT INTO dependentes (Nome, Endereco, Bairro, Cidade, UF, CEP, Email, Telefone)
SELECT 'Pedro Magon', 'Edificio 53', 'Bonfim', 'Petrópolis', 'RJ', '25439002', 'ele@021', '(24) 98002-2233'
FROM titulares WHERE nome = 'Rennan dos Santos';

INSERT INTO dependentes (Nome, Endereco, Bairro, Cidade, UF, CEP, Email, Telefone)
SELECT 'Luiz Eduardo', 'Rua 19', 'Bingen', 'Petrópolis', 'RJ', '33401111', 'tu@666', '(24) 99954-1432'
FROM titulares WHERE nome = 'Rennan dos Santos';

-- 4. Insira dez mídias do mesmo filme na tabela filmes
INSERT INTO filmes (situacao, Nome, Titulo_original, Diretor, Ano, genero, Franquia, Classificacao, Sinopse, pais, Oscar, Globo_de_Ouro) 
VALUES 
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL),
    ('Disponível', 'Toy Story 5', 'Toy Story 5', 'Andrew Stanton', 2026, 'Animação', 'Toy Story', NULL, NULL, 'Estados Unidos', NULL, NULL);

-- 5. Altere o bairro 'Delegado Castilho' para 'Del Castilho' (titulares e dependentes do Rio de Janeiro)
UPDATE titulares
SET bairro = 'Del Castilho'
WHERE bairro = 'Delegado Castilho' AND cidade = 'Rio de Janeiro';

UPDATE dependentes
SET bairro = 'Del Castilho'
WHERE bairro = 'Delegado Castilho' AND cidade = 'Rio de Janeiro';

-- 6. Altere o bairro 'Alto Serra' para 'Alto da Serra' (titulares e dependentes de Petrópolis)
UPDATE titulares
SET bairro = 'Alto da Serra'
WHERE bairro = 'Alto Serra' AND cidade = 'Petrópolis';

UPDATE dependentes
SET bairro = 'Alto da Serra'
WHERE bairro = 'Alto Serra' AND cidade = 'Petrópolis';

-- 7. Atualize a sinopse de todas as mídias do filme 'Cidade de Deus'
UPDATE filmes
SET sinopse = 'Nova sinopse: a trajetória de jovens da Cidade de Deus entre o crime e a sobrevivência.'
WHERE nome = 'Cidade de Deus';

-- 8. Apague a mídia do filme 037
DELETE FROM filmes
WHERE id = 37;



