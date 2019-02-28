

Select Distinct
	(Select top 1 
		case when UMatricpl.CodCur = '1' then UMATALUN.CODTUR 
		else 'Grade ' + UMATALUN.CODTUR end as teste
		from UMatAlun where UMatAlun.Status in ('01', '07') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = Umatricpl.Perletivo and UMatricPL.Status in('01','07') Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level$$,
	(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.Status in ('01', '07') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = Umatricpl.Perletivo and UMatricPL.Status in('01','07') Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as CodTUR,
 	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo as Periodo$$,
 	Select distinct Mataluno from UMatAlun UMA where UMA.Perletivo = Umatricpl.Perletivo and UMA.CodTur = UmatAlun.CodTur
from Ealunos
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join UmatAlun (Nolock) on (Umatricpl.mataluno = UMatAlun.mataluno and UmatAlun.PerLetivo = Umatricpl.Perletivo )
Where 	
 	Umatricpl.Perletivo ='10/11' and UMatricPL.Status in('01','07')
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level$$
