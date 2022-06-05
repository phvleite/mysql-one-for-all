SELECT
	COUNT(hr.id_cancao) AS quantidade_musicas_no_historico
FROM historico_reproducoes AS hr
INNER JOIN usuarios AS u
ON hr.id_usuario = u.id
WHERE u.usuario = 'Bill'
GROUP BY hr.id_usuario;
