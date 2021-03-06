/* Valor L�quido por M�s de Compet�ncia */

SELECT COD_COLIG = DADOS.CODCOLIGADA
	,COLIGADA = DADOS.NOME
	,CFILIAL = DADOS.CDFILIAL
	,NFILIAL = DADOS.NMFILIAL
	,BANCON = DADOS.BANCO
	,LIQUIDO = SUM(DADOS.LIQUIDO)
	,FREQ = COUNT(DADOS.CHAPA)
	,COD_CCUSTO = DADOS.CODCCUSTO
	,NOME_CCUSTO = DADOS.NOMECCUSTO
	,DADOS.CODSITUACAO
FROM (
	SELECT GCOLIGADA.CODCOLIGADA
		,GCOLIGADA.NOME
		,CDFILIAL = E.CODFILIAL
		,NMFILIAL = E.NOME
		,BANCO = ISNULL(F.NOMEREDUZIDO, 'Sem_Banco')
		,CHAPA = A.CHAPA
		,LIQUIDO = SUM(CASE 
				WHEN C.PROVDESCBASE = 'P'
					THEN A.VALOR
				ELSE (A.VALOR * (- 1))
				END)
		,CODCCUSTO = G.CODREDUZIDO
		,NOMECCUSTO = G.NOME
		,B.CODSITUACAO
	FROM PFFINANC A(NOLOCK)
	INNER JOIN GCOLIGADA(NOLOCK) ON A.CODCOLIGADA = GCOLIGADA.CODCOLIGADA
	INNER JOIN PFUNC B(NOLOCK) ON A.CODCOLIGADA = B.CODCOLIGADA
		AND A.CHAPA = B.CHAPA
	INNER JOIN PEVENTO C(NOLOCK) ON A.CODCOLIGADA = C.CODCOLIGADA
		AND A.CODEVENTO = C.CODIGO
	INNER JOIN PSECAO D(NOLOCK) ON B.CODCOLIGADA = D.CODCOLIGADA
		AND B.CODSECAO = D.CODIGO
	INNER JOIN GFILIAL E(NOLOCK) ON D.CODCOLIGADA = E.CODCOLIGADA
		AND D.CODFILIAL = E.CODFILIAL
		AND B.CODFILIAL = E.CODFILIAL
	LEFT JOIN GBANCO F(NOLOCK) ON B.CODBANCOPAGTO = NUMBANCO
	LEFT JOIN GCCUSTO G(NOLOCK) ON G.CODCOLIGADA = A.CODCOLIGADA
		AND G.CODCCUSTO = D.NROCENCUSTOCONT
	WHERE A.ANOCOMP = 2017
		AND A.MESCOMP = 08
		--AND A.NROPERIODO <> 1
		--AND A.CHAPA = '000942'
		AND C.PROVDESCBASE <> 'B'
		AND B.CODSITUACAO <> 'D'
	GROUP BY GCOLIGADA.CODCOLIGADA
		,GCOLIGADA.NOME
		,E.CODFILIAL
		,E.NOME
		,F.NOMEREDUZIDO
		,A.CHAPA
		,G.CODREDUZIDO
		,G.NOME
		,B.CODSITUACAO
	) DADOS
WHERE DADOS.LIQUIDO > 0
GROUP BY DADOS.CODCOLIGADA
	,DADOS.NOME
	,DADOS.CDFILIAL
	,DADOS.NMFILIAL
	,DADOS.BANCO
	,DADOS.CODCCUSTO
	,DADOS.NOMECCUSTO
	,DADOS.CODSITUACAO
