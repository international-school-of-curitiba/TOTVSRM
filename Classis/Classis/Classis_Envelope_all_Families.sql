select distinct
	Case When ZFamilia.lingua = 'Portuguese' then 'Família ' + RTrim(ZFamilia.Nome)
	Else RTrim(ZFamilia.Nome) + ' Family' End,
	ZFamilia.Pessoa1,
	ZFamilia.Pessoa2,
	ZFamilia.Nome
From ZFamilia
Where ZFamilia.PerLetivo ='05/06'
and Zfamilia.Status in ('01','07')
Order by ZFamilia.Nome

SELECT DISTINCT
	CASE
           WHEN (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
	End As End_Principal, 
	Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno AS End_Secundario,
	Ealunos.Cepaluno, EAcompl.A_Familia	
FROM
	ZFAMILIA
	INNER JOIN EALUNOS ON (ZFAMILIA.MATRICULA = EALUNOS.MATRICULA)
	INNER JOIN UMATRICPL ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	INNER JOIN EACOMPL ON (EALUNOS.MATRICULA = EACOMPL.MATRICULA)
WHERE
	ZFAMILIA.PESSOA1 ='295' --:ESPELHO#2
	AND ZFAMILIA.PESSOA2 ='296' --:ESPELHO#3
	AND UMATRICPL.PERLETIVO ='05/06'--:ESPELHO#1
	AND UMATRICPL.STATUS IN ('01', '07')



SELECT DISTINCT
	EALUNOS.NOME, '(' + UMATALUN.CODTUR + ')', EALUNOS.DTNASC
FROM
	ZFAMILIA
	INNER JOIN EALUNOS ON (ZFAMILIA.MATRICULA = EALUNOS.MATRICULA)
	INNER JOIN UMATRICPL ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	INNER JOIN UMATALUN ON (UMATRICPL.MATALUNO = UMATALUN.MATALUNO)
WHERE
	ZFAMILIA.PESSOA1 ='295'--:ESPELHO#2
	AND ZFAMILIA.PESSOA2 ='296' --:ESPELHO#3
	AND UMATRICPL.PERLETIVO ='05/06'--:ESPELHO#1
	AND UMATRICPL.STATUS IN ('01', '07')
Order by 
	EALUNOS.DTNASC Desc