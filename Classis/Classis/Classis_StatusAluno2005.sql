Select 
	EACompl.A_NomeReduzido, UAluCurso.DataAltStatus,
	Case when UAluCurso.Status = '02' then 'Transferido'
	when UAluCurso.Status = '03' then 'Formado'
	when UAluCurso.Status = '14' then 'Transferido em Curso'
	end as Status 
from
	UAluCurso
	Inner Join UMatricpl (NoLock) on (UMatricpl.MatAluno = UAluCurso.MatAluno and UMatricpl.Perletivo = '05/06')
	Inner Join EAcompl (NoLock) on (UAluCurso.MatAluno = EAcompl.Matricula)
Where 
	(UAluCurso.Status in ('03', '02', '14') and UAluCurso.CodCur = '3') 
OR	(UAluCurso.Status in ('02', '14'))
and 	UAluCurso.DataAltStatus >= '05/01/2005'
and 	UAluCurso.DataAltStatus <= '07/31/2006'