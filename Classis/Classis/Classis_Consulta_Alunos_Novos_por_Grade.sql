SELECT	Distinct 
	EALUNOS.MATRICULA,
	Ealunos.Nome,
	UMatAlun.CodTur,
	UmatricPL.Perletivo,
	Ealunos.DtNasc
FROM
	UMATRICPL, Ealunos
	Left join Umatalun (noLock) on (UmatAlun.MATALUNO = EALUNOS.MATRICULA)
WHERE
        UMATRICPL.MATALUNO = EALUNOS.MATRICULA
and     UMATRICPL.DATAMAT >='01/02/2007'
order by UMatAlun.CodTur

