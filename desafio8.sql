SELECT art.nome AS artista, alb.album AS album
FROM albuns AS alb
INNER JOIN artistas AS art
ON alb.id_artista = art.id
WHERE art.nome = 'Walter Phoenix'
ORDER BY artista;
