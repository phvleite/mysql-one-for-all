SELECT
	art.nome AS artista,
	alb.album AS album,
    COUNT(seg.id_usuario) AS seguidores
FROM seguindo_artista AS seg
INNER JOIN artistas AS art
ON seg.id_artista = art.id
INNER JOIN albuns AS alb
ON art.id = alb.id_artista
GROUP BY seg.id_artista, alb.album
ORDER BY seguidores DESC, artista, album;
