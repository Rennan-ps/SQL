/* =========================================================================
   BD1 - Locadora de Filmes - Resolução das Listas 1 a 4
   Prof. Carlos Muniz
   
   Rennan Procópio dos Santos

/* =========================================================================
   LISTA 4 - DQL (Relatórios Quantitativos)
   ========================================================================= */

-- 1. Conte todos os titulares da cidade do 19
SELECT COUNT(*) AS total_titulares
FROM titulares
WHERE cidade = '19';

-- 2. Conte titulares do RJ que possuem dependentes
SELECT COUNT(DISTINCT tit.id) AS total_titulares_com_dependentes
FROM titulares tit
JOIN dependentes dep ON dep.Matricula = tit.id
WHERE tit.cidade = '19';

-- 3. mesmo, agrupando e ordenando por bairro
SELECT tit.bairro, COUNT(DISTINCT tit.id) AS total_titulares_com_dependentes
FROM titulares tit
JOIN dependentes dep ON dep.Matricula = tit.id
WHERE tit.cidade = '19'
GROUP BY tit.bairro
ORDER BY tit.bairro;

-- 4. titulares com dependentes no RJ, Petrópolis e Duque de Caxias, agrupando e ordenado por bairro
SELECT tit.cidade, tit.bairro, COUNT(DISTINCT tit.id) AS total_titulares_com_dependentes
FROM titulares tit
JOIN dependentes dep ON dep.Matricula = tit.id
WHERE tit.cidade IN ('19', 'Petrópolis', 'Duque de Caxias')
GROUP BY tit.cidade, tit.bairro
ORDER BY tit.bairro;

-- 5. Conte os filmes alugados
SELECT COUNT(*) AS total_filmes_alugados
FROM filmes
WHERE situacao = '2';

-- 6. Selecione os filmes de terror alugados
SELECT *
FROM filmes
WHERE genero = '7' AND situacao = '2';

-- 7. Conte os filmes alugados, agrupando por gênero
SELECT genero, COUNT(*) AS total_alugados
FROM filmes
WHERE situacao = '2'
GROUP BY genero
ORDER BY genero;

-- 8. Conte os filmes de terror disponíveis, agrupando por gênero
SELECT genero, COUNT(*) AS total_disponiveis_terror
FROM filmes
WHERE genero = '7' AND situacao = '1'
GROUP BY genero;








