select distinct
	EAlunos.Nome
from 	EAcompl (Nolock)
	left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
Where 	Ualucurso.status = '01'
and	Ealunos.pai=:Espelho#2 or Ealunos.mae=:Espelho#3
order by 
	Ealunos.dtnasc desc