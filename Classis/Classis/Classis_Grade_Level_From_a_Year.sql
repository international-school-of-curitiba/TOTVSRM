Select Distinct
	(Select top 1 UMatTurma.NomeTurma from UMatTurma 
	where EAlunos.matricula = UMatAlun.MatAluno
	and UMatTurma.CodTur = UMatAlun.CodTur and UMatTurma.CodPerlet = UMatricPL.Perletivo) as Grade_Level,
        (Select top 1 UMatTurma.CodTur from UMatTurma 
	where EAlunos.matricula = UMatAlun.MatAluno
	and UMatTurma.CodTur = UMatAlun.CodTur and UMatTurma.CodPerlet = UMatricPL.Perletivo) as CodTUR,
 	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo as Periodo$$
from Ealunos
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join UmatAlun (Nolock) on (Umatricpl.mataluno = UMatAlun.mataluno)
Where 	
 	Umatricpl.Perletivo ='06/07' and UmatAlun.PerLetivo ='06/07' and UMatricPL.Status in('01','07')
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level