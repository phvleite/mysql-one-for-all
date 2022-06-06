SELECT
	u.usuario AS usuario,
	IF(YEAR(MAX(hr.dt_reproducao)) >= 2021, 'Usuário ativo','Usuário inativo') AS condicao_usuario
FROM historico_reproducoes AS hr
INNER JOIN usuarios AS u
ON hr.id_usuario = u.id
GROUP BY hr.id_usuario
ORDER BY u.usuario;
