Create view Filhos as
Select 
	EACompl.A_Familia as Familia,
	Ealunos.Matricula, EAlunos.Nome,
	Case 
	When EACompl.A_Pessoa1= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa1= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa1= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa1= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa2= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa2= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa2= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa2, 
	Ealunos.dtnasc
from 	EAcompl (Nolock), Ealunos (nolock), Ualucurso (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and Ualucurso.Mataluno = Ealunos.matricula
	and Ualucurso.status = '01'