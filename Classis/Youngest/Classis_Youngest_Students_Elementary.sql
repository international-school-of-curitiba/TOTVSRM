Select Distinct
	(Select Top 1 EAlunos.Matricula -- Rtrim(EAcompl.A_NomeReduzido) + ' (' + UMatAlun.CodTur + ')' 
	from EACompl, EAlunos , UMatricpl (NoLock), UMatAlun (NoLock)
	where EAlunos.Matricula = EACompl.Matricula
	and UMatricpl.MatAluno = Ealunos.Matricula
	and UMatricpl.status in ('01', '07') and Umatricpl.Perletivo ='05/06'
	and UMatricpl.CodCur = '2' and UMatricpl.CodPer = '1' 
	and UMatAlun.MatAluno = Ealunos.Matricula
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
	Order by Ealunos.DTnasc desc) As TURMA
From ZFamilia ZFam
Where ZFam.Perletivo ='05/06'
and ZFam.Status in ('01','07')
and ZFam.Lingua like '%' 
