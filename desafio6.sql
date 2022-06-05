SELECT
	MIN(ass.valor) AS faturamento_minimo,
    MAX(ass.valor) AS faturamento_maximo,
    ROUND(AVG(ass.valor),2) AS faturamento_medio,
    ROUND(SUM(ass.valor),2) AS faturamento_total
FROM usuarios AS u
INNER JOIN assinaturas AS ass
ON u.id_assinatura = ass.id;
