
Select distinct 
	(Select top 1
		Case when EACompl.A_EMailIng = 'English' then SUBSTRING(EACompl.a_Familia, 1, len(EACompl.a_Familia)) + ' Family'
		Else 'Família ' + SUBSTRING(EACompl.a_Familia, 1, len(EACompl.a_Familia)) End
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula and  UMatAlun.PerLetivo ='06/07') 
	INNER Join UMatAlun  (NoLock) on (UMatAlun.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo ='06/07' and UMatAlun.CodTur like '9%')
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='06/07'
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
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))) As Familia,
	(Select Top 1 EACompl.a_NomeReduzido
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula and  UMatAlun.PerLetivo ='06/07') 
	INNER Join UMatAlun  (NoLock) on (UMatAlun.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo ='06/07' and UMatAlun.CodTur like '9%')
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='06/07'
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
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2))) As Student,
	((Select Top 1 '(' + UMatAlun.CodTur + ')' 
	from EACompl, EAlunos 
	INNER Join UMatricpl (NoLock) on (UMatricpl.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo ='06/07' ) 
	INNER Join UMatAlun  (NoLock) on (UMatAlun.MatAluno = Ealunos.Matricula and UMatAlun.PerLetivo ='06/07' and UMatAlun.CodTur like '9%')
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='06/07' 
	and  ((Cast(EAlunos.Pai as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Mae as Varchar)=ZFam.Pessoa2) or 
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
		(Cast(EAlunos.Respons as Varchar) =ZFam.Pessoa1 and Cast(EAlunos.Respons as Varchar)=ZFam.Pessoa2)))) As TURMA
From ZFamilia ZFam
inner Join EACompl (NoLock) on (ZFam.Nome = EACompl.A_Familia)
inner Join UMATALUN (NoLock) on (UMATALUN.MATALUNO = EACompl.Matricula and UMatAlun.Perletivo = '06/07' and UMatAlun.CodTur like '9%')
inner Join UMatricpl (Nolock) on (UMatricpl.Mataluno = EACompl.Matricula and UMatricpl.Perletivo = '06/07')
Where ZFam.Perletivo ='06/07'
and ZFam.Status in ('01','07')
and UMatAlun.Codtur like '9%'
Order by turma, student
