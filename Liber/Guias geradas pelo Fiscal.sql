/* Guias geradas pelo Fiscal */

SELECT
	SUM(VALORORIGINAL), MONTH(DATAEMISSAO)
FROM 
	FLAN
WHERE
	STATUSLAN <> 2
	AND IDGUIA IN(
		SELECT IDGUIA FROM DGUIAPERIODO
			WHERE (CODRECEITA = '3208' OR CODRECEITA = '0561')
				AND IDPER IN (
					SELECT IDPER FROM DPERIODO
						WHERE CODPER >= '01-01-2016' AND CODPER <= '12-31-2016' AND CODTRB = 'IRRFPF'
				)
	)
	--AND CODAPLICACAO = 'D'
GROUP BY
	MONTH(DATAEMISSAO)

