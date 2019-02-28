Create Procedure dbo.UPDATE_ZFAMILIA as
DELETE ZFamilia
Go
Insert into ZFamilia (Nome, Pessoa1,Class_Pessoa1, Pessoa2, Class_Pessoa2, Lingua, Matricula, Perletivo, Status) --RecebeEMail, Publica, Propaganda,
(Select
	EACompl.A_Familia as Familia, 
	Cast
	(Case
	When EACompl.A_Pessoa1= 'Pai' then cast(Ealunos.Pai as varchar(25))
	When EACompl.A_Pessoa1= 'Mãe' then cast(Ealunos.Mae as varchar(25))
	When EACompl.A_Pessoa1= 'Responsável Financeiro' then cast(Ealunos.Respons as varchar(25))
	When EACompl.A_Pessoa1= 'Responsável Acadêmico' then cast(Ealunos.RespAcad as varchar(25))
	Else '0'
	End AS Varchar(25)) as Pessoa1,
	EACompl.A_Pessoa1 as Class_Pessoa1,
	Cast
	(Case
	When EACompl.A_Pessoa2= 'Pai' then cast(Ealunos.Pai as varchar(25))
	When EACompl.A_Pessoa2= 'Mãe' then cast(Ealunos.Mae as varchar(25))
	When EACompl.A_Pessoa2= 'Responsável Financeiro' then cast(Ealunos.Respons as varchar(25))
	When EACompl.A_Pessoa2= 'Responsável Acadêmico' then cast(Ealunos.RespAcad as varchar(25))
	Else '0'
	End AS Varchar(25)) as Pessoa2,
	EACompl.A_Pessoa2 as Class_Pessoa2,
	EAcompl.A_EmailIng as Lingua,
	EACompl.Matricula as Matricula,
	UMatricPL.Perletivo As Perletivo,
	UMatricPL.Status
from 	EAcompl (Nolock), Ealunos (nolock), UMatricPL (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and UMatricPL.Mataluno = Ealunos.matricula
	and UMatricPL.status in ('01','07')
	and EACompl.A_Familia is not Null
)

