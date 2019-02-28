Select  Ealunos.matricula
from 	Ealunos 
	left join Ualucurso (noLock) on (Ualucurso.Mataluno = Ealunos.matricula)
where 	Ualucurso.Status = '02'