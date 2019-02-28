Declare @SchooLYear as nvarchar(5)
Declare @EmailLanguage as nvarchar(15)

Set @SchoolYear ='13/14'
Set @EmailLanguage = '%'


Select Distinct
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = EALUNOS.MAE) as Email,
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = EALUNOS.PAI) as Email,
	EAcompl.A_Emailing
from EAlunos
Inner Join EACompl (NoLock) on (EACompl.Matricula = EAlunos.Matricula)
where
EAlunos.MATRICULA in 
	(
		select 
			Ealunos.Matricula
		from Ealunos
		inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
		inner join UTabTipo (NoLock) on (Ealunos.TipoAluno = UTabtipo.codtipo)
		inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
		where 
			UMatricpl.Perletivo ='13/14'
		and UMatricpl.Status = '18'	
	)

and EAcompl.A_Emailing like @EmailLanguage

union

Select Distinct
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = EALUNOS.PAI) as Email,
	(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = EALUNOS.MAE) as Email,
	EAcompl.A_Emailing
from EAlunos
Inner Join EACompl (NoLock) on (EACompl.Matricula = EAlunos.Matricula)
where
EAlunos.MATRICULA in 
	(
		select 
			Ealunos.Matricula
		from Ealunos
		inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
		inner join UTabTipo (NoLock) on (Ealunos.TipoAluno = UTabtipo.codtipo)
		inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
		where 
			UMatricpl.Perletivo ='13/14'
		and UMatricpl.Status = '18'	
	)

and EAcompl.A_Emailing like @EmailLanguage

