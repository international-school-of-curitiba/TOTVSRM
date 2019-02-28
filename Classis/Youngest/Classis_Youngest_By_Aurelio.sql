Select Distinct
	Case when ZFam.Lingua = 'English' then SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) + ' Family' 
	Else 'Família ' + SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) End as Familia,
	ZFam.Pessoa1,
	ZFam.Pessoa2,
	ZFam.Lingua,  ZFam.Matricula
From ZFamilia ZFam
Left Join EACompl (NoLock) on (ZFam.Nome = EACompl.A_Familia)
Where ZFam.Perletivo ='05/06' and ZFam.Status in ('01','07') and Lingua like '%'


SELECT TOP 1
	EALUNOS.NOME, '(' + UMatAlun.CodTur + ')' 
FROM
	ZFAMILIA
	INNER JOIN EALUNOS ON (ZFAMILIA.MATRICULA = EALUNOS.MATRICULA)
	INNER JOIN UMATRICPL ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	INNER JOIN EACOMPL ON (EALUNOS.MATRICULA = EACOMPL.MATRICULA)
	INNER JOIN UMATALUN ON (UMATALUN.MATALUNO = EACOMPL.MATRICULA)
WHERE
	ZFAMILIA.PESSOA1 ='563'
	AND ZFAMILIA.PESSOA2 = '564'
	AND UMATRICPL.PERLETIVO ='05/06'
	AND UMATRICPL.STATUS IN ('01', '07')
ORDER BY
	EALUNOS.DTNASC DESC



/*Order by CodCur, Periodo, GradeLevel*/

