Select Distinct
	Case when ZFam.Lingua = 'English' then SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) + ' Family' 
	Else 'Família ' + SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) End as Familia,
	ZFam.Nome,
	ZFam.Lingua,
	ZFam.Pessoa1,
	ZFam.Pessoa2,  
	(Select Top 1 EACompl.a_NomeReduzido
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='14/15' 
	and    ((Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or 
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))
	Order by Ealunos.DTnasc desc, Ealunos.matricula) As Student,
	(Select Top 1 UMatricpl.CodCur 
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula)
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='14/15' 
	and    ((Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or 
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))
	Order by Ealunos.DTnasc desc, Ealunos.matricula) AS CODCUR,
	(Select Top 1 UMatricpl.Periodo
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='14/15' 
	and    ((Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or 
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))
	Order by Ealunos.DTnasc desc, Ealunos.matricula)	As PERIODO,
	(Select Top 1 '(' + UMatAlun.CodTur + ')' 
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	INNER Join UMatAlun  (NoLock) on (UMatAlun.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo ='14/15') 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='14/15' 
	and    ((Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or 
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.RespAcad as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Mae as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.RespAcad as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Pai as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))
	Group by UMatAlun.CodTur, Ealunos.DTnasc, Ealunos.matricula Order by Ealunos.DTnasc desc, Count(UMatAlun.CodTur)desc, Ealunos.matricula) As TURMA
From ZFamilia ZFam
Left Join EACompl (NoLock) on (ZFam.Nome = EACompl.A_Familia and ZFam.MATRICULA = EACOMPL.MATRICULA)
Left Join UMATALUN (NoLock) on (UMATALUN.MATALUNO = EACompl.Matricula and UMATALUN.PERLETIVO = ZFam.Perletivo)
Where ZFam.Perletivo ='14/15'
and ZFam.Status in ('01','07')
and ZFam.Lingua like '%'

AND ZFam.PESSOA1  IN (Select PESSOA1 from ZFAMILIA where Matricula in(
SELECT MATALUNO FROM EALUBOLSA, ETIPOBOLS 
WHERE CODBOL = CODBOLSA AND LEFT(DESCBOLSA,11) = 'FUNCIONÁRIO' 
AND EALUBOLSA.PERLETIVO ='14/15')
AND ZFAMILIA.PERLETIVO = '14/15')

AND ZFam.PESSOA2  IN (Select PESSOA2 from ZFAMILIA where Matricula in(
SELECT MATALUNO FROM EALUBOLSA, ETIPOBOLS 
WHERE CODBOL = CODBOLSA AND LEFT(DESCBOLSA,11) = 'FUNCIONÁRIO' 
AND EALUBOLSA.PERLETIVO ='14/15')
AND ZFAMILIA.PERLETIVO = '14/15')
Order by  ZFam.Lingua, ZFam.NomE


/*
select FLAN.CODCFO, FCFO.NOME from FLAN
inner join FCFO (NoLock) on (FCFO.CODCFO = FLAN.CODCFO)
 where flan.CODTDO in ('000111',  '000112')
*/
