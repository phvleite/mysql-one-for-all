SELECT c.cancao AS nome, COUNT(hr.id_cancao) AS reproducoes
FROM historico_reproducoes AS hr
INNER JOIN cancoes AS c
ON hr.id_cancao = c.id
INNER JOIN usuarios AS u
ON hr.id_usuario = u.id
WHERE u.id_assinatura IN (1, 3)
GROUP BY hr.id_cancao
ORDER BY nome;
