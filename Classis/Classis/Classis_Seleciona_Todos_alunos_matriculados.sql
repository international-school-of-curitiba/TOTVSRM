select distinct
	EAcompl.A_Familia,
	Ealunos.matricula,
	Ealunos.nome, 
	Eirmaos.Nome,
	Ealunos.dtnasc,
	Ealunos.pai,
	Ealunos.mae,
	EAcompl.A_NomeIng, 
	EAcompl.A_EmailIng, 
	EAcompl.A_pessoa1 as Pessoa1,
	EAcompl.A_Pessoa2 as Pessoa2
from 	EAcompl (Nolock)
	left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
Where 	Ualucurso.status = '01' --Apenas alunos matriculados 
order by 
	EAcompl.A_Familia,
	Ealunos.dtnasc desc,
	Ealunos.matricula