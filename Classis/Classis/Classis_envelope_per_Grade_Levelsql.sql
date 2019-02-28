SELECT DISTINCT
	Case When ZFamilia.lingua = 'Portuguese' then 'Família ' + RTrim(ZFamilia.Nome)
	Else RTrim(ZFamilia.Nome) + ' Family' End,
	CASE
           WHEN (Ealunos.Compendal is null) THEN Ealunos.EndAluno + ', ' + EAlunos.Numendalun
	   ELSE Ealunos.EndAluno + ', ' + EAlunos.Numendalun + ' - ' + Ealunos.Compendal
	End As End_Principal, 
	Ealunos.BairroAlun + ' - ' + Ealunos.Cidaluno + ' - ' +	Ealunos.ufAluno AS End_Secundario,
	Ealunos.Cepaluno, EAcompl.A_Familia,	
	EALUNOS.NOME, '(' + UMATALUN.CODTUR + ')', EALUNOS.DTNASC
FROM
	ZFAMILIA
	INNER JOIN EALUNOS ON (ZFAMILIA.MATRICULA = EALUNOS.MATRICULA)
	INNER JOIN UMATRICPL ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	INNER JOIN UMATALUN ON (UMATRICPL.MATALUNO = UMATALUN.MATALUNO)
	INNER JOIN EACOMPL ON (EALUNOS.MATRICULA = EACOMPL.MATRICULA)
WHERE 	UMATRICPL.PERLETIVO ='05/06'--:ESPELHO#1
	AND UMATRICPL.STATUS IN ('01', '07')
	AND UMATALUN.CODTUR like '6B'