/* =========================================================================
   BD1 - Locadora de Filmes - Resolução das Listas 1 a 4
   Prof. Carlos Muniz
   
   Rennan Procópio dos Santos

/* =========================================================================
   LISTA 3 - JOINS / SUBQUERIES
   ========================================================================= */

-- 01. titulares do RJ que possuem dependentes: nome, endereço, bairro, cidade
SELECT DISTINCT tit.nome, tit.endereco, tit.bairro, tit.cidade
FROM titulares tit
JOIN dependentes dep 
	ON dep.id = tit.id
WHERE tit.cidade = '19';

-- 02. titulares do RJ e Petrópolis que possuem dependentes
SELECT DISTINCT tit.nome, tit.endereco, tit.bairro, tit.cidade
FROM titulares tit
JOIN dependentes dep ON dep.id = tit.id
WHERE tit.cidade IN ('19', '15');

-- 03 e 04. titulares do RJ que NÃO possuem dependentes 
SELECT tit.nome, tit.endereco, tit.bairro, tit.cidade
FROM titulares tit
WHERE tit.cidade = 'Rio de Janeiro'
  AND NOT EXISTS (
      SELECT 1 
		FROM dependentes dep 
WHERE dep.Matricula = tit.id
  );

-- 05. titulares do RJ e Volta Redonda que NÃO possuem dependentes
SELECT tit.nome, tit.endereco, tit.bairro, tit.cidade
FROM titulares tit
WHERE tit.cidade IN ('19', '24')
  AND NOT EXISTS (
      SELECT 1 
FROM dependentes dep WHERE dep.Matricula = tit.id
  );

-- 06. id, nome, situação dos filmes alugados + nome e telefone do titular responsável, ordenados pelo nome do filme
SELECT fil.id, fil.nome, fil.situacao, tit.nome AS nome_titular, tit.telefone
FROM filmes fil
JOIN titulares tit ON tit.id = fil.id
WHERE fil.situacao = 'alugado'
ORDER BY fil.nome;

-- 07. mesmo, apenas titulares que moram no Rio de Janeiro
SELECT fil.id, fil.nome, fil.situacao, tit.nome AS nome_titular, tit.telefone
FROM filmes fil
JOIN titulares tit ON tit.id = fil.id
WHERE fil.situacao = 'alugado' AND tit.cidade = '19'
ORDER BY fil.nome;

-- 08. titular responsável pelo aluguel do filme id 10266, seus dependentes, nome e gênero do filme
SELECT tit.nome AS nome_titular, dep.nome AS nome_dependente, fil.nome AS nome_filme, fil.genero
FROM filmes fil
JOIN titulares tit ON tit.id = fil.id
LEFT JOIN dependentes dep ON dep.Matricula = tit.id
WHERE fil.id = 10266;

-- 09. documentação dos titulares do bairro Bento Ribeiro (RJ), nome e dependentes
SELECT tit.nome, doc.RG, doc.Cartao, doc.CVV2,
       dep.nome AS nome_dependente
FROM titulares tit
JOIN documentacao doc ON doc.id = tit.id
LEFT JOIN dependentes dep ON dep.Matricula = tit.id
WHERE tit.bairro = 'Bento Ribeiro' AND tit.cidade = '19';

-- 10. id, nome, situação dos filmes alugados + nome, telefone, documentação do titular
--     + nome e contato dos dependentes, ordenados pelo nome do filme
SELECT fil.id, fil.nome AS nome_filme, fil.situacao,
       tit.nome AS nome_titular, tit.telefone,
       doc.RG, doc.Cartao,
       dep.Nome AS nome_dependente, dep.Telefone
FROM filmes fil
JOIN titulares tit   ON tit.id = fil.id
JOIN documentacao doc ON doc.id = tit.id
LEFT JOIN dependentes dep ON dep.Matricula = tit.id
WHERE fil.situacao = '2'
ORDER BY fil.nome;

-- 11. Situação de TODOS os filmes; se alugado, traz também titular/documentação/dependentes
--     
SELECT fil.id, fil.nome AS nome_filme, fil.situacao,
       tit.nome AS nome_titular, tit.telefone,
       doc.RG, doc.Cartao,
       dep.nome AS nome_dependente, dep.Telefone
FROM filmes fil
LEFT JOIN titulares tit     ON tit.id = fil.id AND fil.situacao = '2'
LEFT JOIN documentacao doc ON doc.id = tit.id
LEFT JOIN dependentes dep ON dep.Matricula = tit.id
ORDER BY fil.nome;









