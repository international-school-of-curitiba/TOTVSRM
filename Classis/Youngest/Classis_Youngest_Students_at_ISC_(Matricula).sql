Select Distinct
	(Select Top 1 Ealunos.Matricula
	from EACompl (NoLock), EAlunos (NoLock), UMatricpl (NoLock)
	where EAlunos.Matricula = EACompl.Matricula and UMatricpl.MatAluno = Ealunos.Matricula
	and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='05/06'
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
	Order by Ealunos.DTnasc desc) As Student
From ZFamilia ZFam
Where ZFam.Perletivo ='05/06'
and ZFam.Status in ('01','07')
and ZFam.Lingua like '%'

