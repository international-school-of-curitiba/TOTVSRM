/* Discriminação do rateio das baixas de recebimentos */

SELECT 
	F.IDLAN, F.IDFAT,  F.CODCFO, F2.NOME, F2.NOMEFANTASIA, F.DATAEMISSAO, F.DATABAIXA,
	F.VALORBAIXADO, D.NOME, FR.VALOR RATEIO
FROM FLAN F
	INNER JOIN FLANRATDEP FR ON FR.IDLAN = F.IDLAN AND FR.CODCOLIGADA = F.CODCOLIGADA
	INNER JOIN GDEPTO D ON D.CODDEPARTAMENTO = FR.CODDEPARTAMENTO AND D.CODFILIAL = F.CODFILIAL
	INNER JOIN FCFO F2 ON F.CODCFO = F2.CODCFO
WHERE 
	F.DATABAIXA >= '08-01-2016' AND F.DATABAIXA <= '04-30-2017' AND F.PAGREC = 1
ORDER BY
	F.IDFAT, F.CODCFO, F.DATAEMISSAO, F.DATABAIXA DESC

--SELECT * FROM FLANRATCCU WHERE IDLAN = 307200

--SELECT * FROM GLINKSREL WHERE MASTERTABLE = 'FLANRATDEP'
--SELECT * FROM GLINKSREL WHERE 

