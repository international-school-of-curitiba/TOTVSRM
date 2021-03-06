Select 
	TMOV.IDMOV,
	TMOV.DATAEMISSAO,
	TMOV.CODCFO,
	FCFO.NOME, 
	FCFO.CGCCFO,
	TMOV.VALORBRUTO,
	TMOV.VALORLIQUIDO,
	TTRBMOV.CODTRB,
	TTRBMOV.VALOR
from
	TMOV
	INNER JOIN TTRBMOV (NoLock) on (TTRBMOV.IDMOV = TMOV.IDMOV and TTRBMOV.VALOR > 0)
	INNER JOIN FCFO (NOLOCK) ON (FCFO.CODCFO = TMOV.CODCFO)
where TMOV.CODTMV in ('1.2.11','1.2.12')
and datepart(yy,DATAEMISSAO) = '2012'
ORDER BY FCFO.NOME, TMOV.DATAEMISSAO