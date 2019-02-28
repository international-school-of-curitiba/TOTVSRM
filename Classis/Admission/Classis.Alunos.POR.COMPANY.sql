select distinct
	EAcompl.A_Companhia, MATALUNO
from EACompl
	Inner join EALUNOS (NoLock) on (Ealunos.MATRICULA = EACOMPL.MATRICULA)
	Inner join UMatricPL (NoLock) on (UMatricpl.MatAluno = EACompl.Matricula)
where
	EALUNOS.TIPOALUNO in ('3','4')
and UMatricPl.Perletivo ='06/07'
and UMatricpl.Status in ('01', '07', '04', '14')

order by EAcompl.A_Companhia



/* outra maneira */

select distinct
	EAcompl.A_Companhia, count(MATALUNO)
from EACompl
	Inner join EALUNOS (NoLock) on (Ealunos.MATRICULA = EACOMPL.MATRICULA)
	Inner join UMatricPL (NoLock) on (UMatricpl.MatAluno = EACompl.Matricula)
where
	EALUNOS.TIPOALUNO in ('3','4')
and UMatricPl.Perletivo ='06/07'
and UMatricpl.Status in ('01', '07', '04', '14')
group by EAcompl.A_Companhia
order by EAcompl.A_Companhia


