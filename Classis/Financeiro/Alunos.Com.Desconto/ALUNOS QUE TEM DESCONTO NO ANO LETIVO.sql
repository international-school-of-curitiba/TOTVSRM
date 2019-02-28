/* ALUNOS QUE TEM DESCONTO NO ANO LETIVO*/

SELECT 
	EALUNOS.MATRICULA, EALUNOS.NOME,
	EALUSERV.PLANO, EALUBOLSA.CODBOL, EALUBOLSA.PERCDESC, EALUSERV.CONTRATO, EALUBOLSA.CONTRATO
FROM EALUNOS
INNER JOIN UMATRICPL ON UMATRICPL.MATALUNO = EALUNOS.MATRICULA
INNER JOIN EALUSERV ON EALUSERV.MATALUNO = EALUNOS.MATRICULA AND EALUSERV.PERLETIVO = UMATRICPL.PERLETIVO
INNER JOIN EALUBOLSA ON EALUBOLSA.MATALUNO = EALUSERV.MATALUNO 
	AND EALUBOLSA.PERLETIVO = EALUSERV.PERLETIVO 
	--AND EALUSERV.CONTRATO = EALUBOLSA.CONTRATO
WHERE
	UMATRICPL.PERLETIVO = '18/19' AND UMATRICPL.STATUS IN ('07','01')
	AND EALUSERV.STATUS <> 'S'
	AND EALUBOLSA.ATIVO = 'S'

--SELECT * FROM GLINKSREL WHERE MASTERTABLE = 'EALUSERV'
--SELECT * FROM GLINKSREL WHERE MASTERTABLE = 'EMATRICPL'