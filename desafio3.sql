SELECT
	u.usuario AS usuario,
  COUNT(hr.id_cancao) AS qtde_musicas_ouvidas,
  CONVERT(ROUND(SUM(c.duracao_segundos/60),2),CHAR) AS total_minutos
FROM historico_reproducoes AS hr
INNER JOIN usuarios AS u
ON u.id = hr.id_usuario
INNER JOIN cancoes AS c
ON hr.id_cancao = c.id
GROUP BY u.id
ORDER BY u.usuario;
