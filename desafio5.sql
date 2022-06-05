SELECT
  c.cancao AS cancao,
  COUNT(hr.dt_reproducao) AS reproducoes
FROM historico_reproducoes AS hr
INNER JOIN cancoes AS c
ON hr.id_cancao = c.id
GROUP BY hr.id_cancao
ORDER BY reproducoes DESC, c.cancao
LIMIT 2;
