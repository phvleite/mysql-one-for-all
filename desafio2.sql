SELECT
  COUNT(DISTINCT c.id) AS cancoes,
  COUNT(DISTINCT art.id) AS artistas,
  COUNT(DISTINCT alb.id) AS albuns
FROM cancoes AS c
INNER JOIN albuns AS alb
ON c.id_album = alb.id
INNER JOIN artistas AS art
ON art.id = alb.id_artista
ORDER BY c.id;
