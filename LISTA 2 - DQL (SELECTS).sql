/* =========================================================================
   BD1 - Locadora de Filmes - Resolução das Listas 1 a 4
   Prof. Carlos Muniz
   
   Rennan Procópio dos Santos

/* =========================================================================
   LISTA 2 - DQL (SELECTS)
   ========================================================================= */

-- 1. nome, endereço, bairro, cidade, UF dos titulares do RJ, ordenados por Cidade, Bairro, Nome
SELECT nome, endereco, bairro, cidade, uf
FROM titulares
WHERE cidade = '19'
ORDER BY cidade, bairro, nome;

-- 2. mesmos campos, apenas titulares do bairro Centro do RJ
SELECT nome, endereco, bairro, cidade, uf
FROM titulares
WHERE cidade = '19' AND bairro = 'Centro'
ORDER BY cidade, bairro, nome;

-- 3. titulares de RJ, Nilópolis, Mesquita, Nova Iguaçu e Petrópolis
SELECT nome, endereco, bairro, cidade, uf
FROM titulares -- RJ    Np    Mq    Ni    Pt
WHERE cidade IN ('19', '11', '10', '14', '15')
ORDER BY cidade, bairro, nome;

-- 4. mesmas cidades, nomes que comecem com a letra C
SELECT nome, endereco, bairro, cidade, uf
FROM titulares -- RJ    Np    Mq    Ni    Pt
WHERE cidade IN ('19', '11', '10', '14', '15')
  AND nome LIKE 'C%'
ORDER BY cidade, bairro, nome;

-- 5. cidades que possuem titulares cadastrados
SELECT DISTINCT cidade
FROM titulares
ORDER BY cidade;

-- 6. cidades e número de titulares de cada uma
SELECT cidade, COUNT(*) AS numero_titulares
FROM titulares
GROUP BY cidade
ORDER BY cidade;

-- 7. bairros, cidades e número de titulares de cada um
SELECT bairro, cidade, COUNT(*) AS numero_titulares
FROM titulares
GROUP BY bairro, cidade
ORDER BY cidade, bairro;

-- 8. titulares do Rio de Janeiro e Petrópolis
SELECT *
FROM titulares
WHERE cidade IN ('19', '15');

-- 9.  número de titulares do Rio de Janeiro e Petrópolis ordenando por cidade e bairros
SELECT cidade, bairro, COUNT(*) AS numero_titulares
FROM titulares
WHERE cidade IN ('19', '15')
GROUP BY cidade, bairro
ORDER BY cidade, bairro;







