SELECT distinct
	TIPOALUNO,	UMATRICPL.PERLETIVO,
	UMATRICPL.MATALUNO, EACOMPL.A_COMPANHIA,
	EDESCLAN.PLANO,
	CASE 
		WHEN EDESCLAN.PLANO LIKE '%50%' THEN '50'
	ELSE	
		'0'
	END AS DESCONTO, 

	
	CASE 
		WHEN EDESCLAN.PLANO LIKE '%50%' THEN 	EDESCLAN.VALOR1 * 2
	ELSE	
			EDESCLAN.VALOR1 * 1
	END AS BRUTO,

	CASE 
		WHEN EDESCLAN.PLANO LIKE '%50%' THEN 	EDESCLAN.VALOR1 
	ELSE	
			EDESCLAN.VALOR1 * 0
	END AS DESCONTO,
	
	EDESCLAN.VALOR1 as PAGO
	
FROM
	EALUNOS
	INNER JOIN UTABTIPO (NOLOCK) ON (UTABTIPO.CODTIPO = EALUNOS.TIPOALUNO)
	INNER JOIN UMATRICPL (NOLOCK) ON (UMATRICPL.MATALUNO = EALUNOS.MATRICULA)
	INNER JOIN EDESCLAN (NOLOCK) ON (EDESCLAN.MATALUNO = EALUNOS.MATRICULA AND EDESCLAN.PERLETIVO = UMATRICPL.PERLETIVO AND EDESCLAN.DESCRICAO LIKE '%FUND%' AND EDESCLAN.TIPOLANC = '7')
	INNER JOIN EACOMPL (NOLOCK) ON (EACOMPL.MATRICULA = EALUNOS.MATRICULA)
WHERE
	EALUNOS.TIPOALUNO IN ('3', '4')
and EACOMPL.A_COMPANHIA like 'BT Industries                 %'
AND UMATRICPL.PERLETIVO <> '05/06'
AND EDESCLAN.PLANO <> 'FDO_ECC'
order by UMATRICPL.MATALUNO, UMATRICPL.PERLETIVO, DESCONTO  DESC


--select * from EDESCLAN where MATALUNO = 00026 and PERLETIVO = '05/06'