SELECT
	c.cancao AS nome_musica,
    CASE
		WHEN c.cancao LIKE '%Streets%' THEN REPLACE(c.cancao, 'Streets','Code Review')
		WHEN c.cancao LIKE '%Her Own%' THEN REPLACE(c.cancao, 'Her Own','Trybe')
		WHEN c.cancao LIKE '%Inner Fire%' THEN REPLACE(c.cancao, 'Inner Fire','Project')
		WHEN c.cancao LIKE '%Silly%' THEN REPLACE(c.cancao, 'Silly','Nice')
		WHEN c.cancao LIKE '%Circus%' THEN REPLACE(c.cancao, 'Circus','Pull Request')
    ELSE c.cancao
	END AS novo_nome
FROM cancoes AS c
WHERE c.cancao LIKE '%Streets%'
OR c.cancao LIKE '%Her Own%'
OR c.cancao LIKE '%Inner Fire%'
OR c.cancao LIKE '%Silly%'
OR c.cancao LIKE '%Circus%'
ORDER BY c.cancao;
