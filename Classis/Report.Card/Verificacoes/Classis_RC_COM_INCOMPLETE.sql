select 
	MATALUNO,
	(Select Nome from EALUNOS where EAlunos.MATRICULA = MATALUNO) as Nome, 
	CodTur,
	(Select MATERIA from UMATERIAS where UMATERIAS.CODMAT = UMATALUN.CODMAT)
from UMATALUN where PERLETIVO = '11/12' and A1 = 1
order by codcur, codper, substring(CODTUR,1,1) desc