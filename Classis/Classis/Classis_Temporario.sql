Select Distinct
	(Select top 1 UMatTurma.NomeTurma from UMatTurma 
	where EAlunos.matricula = UMatAlun.MatAluno
	and UMatTurma.CodTur = UMatAlun.CodTur) as Grade_Level,
 	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo
from Ealunos
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join UmatAlun (Nolock) on (Umatricpl.mataluno = UMatAlun.mataluno)
Where 	
 	Umatricpl.Perletivo ='05/06'
and	UMatricpl.Status in('01','07')
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level

Select * from UMatTurma