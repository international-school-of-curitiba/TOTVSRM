
Select 	Distinct
	ZFamilia.Nome, 
	ZFamilia.Pessoa1, 
	ZFamilia.Pessoa2,
	(Select Count (EACompl.Matricula) from EAcompl(Nolock) 
	Where 	EAcompl.A_Familia = ZFamilia.Nome and
		EAcompl.A_CodPessoa1 = ZFamilia.Pessoa1 and 
		EACompl.A_CodPessoa2 = ZFamilia.Pessoa2
	Group by EACompl.A_Familia) as Quantidade,
	(Select Top 1 EAlunos.Matricula from EAlunos (Nolock), EAcompl(Nolock) 
	Where 	EACompl.Matricula = EAlunos.Matricula and
		EAcompl.A_CodPessoa1 = ZFamilia.Pessoa1 and 
		EACompl.A_CodPessoa2 = ZFamilia.Pessoa2
	Order by Ealunos.DTNasc desc) as Matricula,
	(Select Top 1 EALunos.Nome from EAlunos (Nolock), EAcompl(Nolock) 
	Where 	EACompl.Matricula = EAlunos.Matricula and
		EAcompl.A_CodPessoa1 = ZFamilia.Pessoa1 and 
		EACompl.A_CodPessoa2 = ZFamilia.Pessoa2
	Order by Ealunos.DTNasc desc) as Student
from ZFamilia (Nolock)
Where ZFamilia.Perletivo = '05/06'
Group by ZFamilia.Nome, ZFamilia.Pessoa1, ZFamilia.Pessoa2
