Declare @SchooLYear as nvarchar(5)
Declare @EmailLanguage as nvarchar(15)

Set @SchoolYear = '15/16'
Set @EmailLanguage = '%'


Select Distinct
	Case 
	When ZFamilia.Class_Pessoa1= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa1 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa1)
	End as Email,
	EAcompl.A_Emailing
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07')
and EAcompl.A_Emailing like @EmailLanguage

union

Select Distinct
	Case 
	When ZFamilia.Class_Pessoa2= 'Responsável Financeiro' then
		(Select FCFO.Email From FCFO Where FCFO.CodCFO = Cast(ZFamilia.Pessoa2 As Varchar(25)))
	Else 
		(Select PPessoa.Email From PPessoa Where PPessoa.Codigo = ZFamilia.Pessoa2)
	End as Email, 
	EAcompl.A_Emailing
from ZFamilia
Inner Join EAlunos (NoLock) on (Ealunos.Matricula = ZFamilia.Matricula) 
Inner Join EACompl (NoLock) on (EACompl.Matricula = ZFamilia.Matricula)
where ZFamilia.Perletivo =@SchoolYear  and ZFamilia.Status in ('01','07')
and EAcompl.A_Emailing like @EmailLanguage
