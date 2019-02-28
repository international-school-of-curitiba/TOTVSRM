Select Distinct
--	Case when ZFam.Lingua = 'English' then SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) + ' Family' 
--	Else 'Família ' + SUBSTRING(ZFam.Nome, 1, len(ZFam.Nome)) End as Familia,
	Rtrim(ZFam.Nome),
	(Select Top 1 Rtrim(EACompl.a_NomeReduzido)
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo =ZFam.Perletivo 
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
	Order by Ealunos.DTnasc desc) As Student,
	(Select Top 1 UMatricpl.CodCur 
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula)
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo =ZFam.Perletivo 
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
	Order by Ealunos.DTnasc desc) AS CODCUR,
	(Select Top 1 UMatricpl.Periodo
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo =ZFam.Perletivo 
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
	Order by Ealunos.DTnasc desc)	As PERIODO,
	(Select Top 1 '(' + UMatAlun.CodTur + ')' 
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula) 
	INNER Join UMatAlun  (NoLock) on (UMatAlun.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo =ZFam.Perletivo) 
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo =ZFam.Perletivo 
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
	Group by UMatAlun.CodTur, Ealunos.DTnasc Order by Ealunos.DTnasc desc, Count(UMatAlun.CodTur)desc) As TURMA,
	(Select email from ppessoa where codigo = ZFam.Pessoa1) AS EmailPai,
	(Select email from ppessoa where codigo = ZFam.Pessoa2) AS EmailMae, 
	ZFam.Lingua
From ZFamilia ZFam
Left Join EACompl (NoLock) on (ZFam.Nome = EACompl.A_Familia)
Left Join UMATALUN (NoLock) on (UMATALUN.MATALUNO = EACompl.Matricula and UMATALUN.PERLETIVO = ZFam.Perletivo)
Where ZFam.Perletivo = '11/12'
and ZFam.Status in ('01','07')
and ZFam.Lingua like 'ENGLISH'
and (EAcompl.A_PrintedBulletin = 'NO' or  EAcompl.A_PrintedBulletin is null)
Order by CODCUR, PERIODO, TURMA
