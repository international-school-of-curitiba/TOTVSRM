
Select  
	A_DataEntradaISC,
	Ealunos.matricula, 
	A_NomeReduzido,
   (Select top 1 '(' + UMATALUN.CODTUR + ')' from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo ='06/07' Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level
from 	Ealunos 
left join UMatricPL (noLock) on (UMatricpl.Mataluno = Ealunos.matricula and UMatricpl.Perletivo = '06/07')
inner join EACOMPL (NoLock) on (EACompl.Matricula = EAlunos.Matricula)
where UMatricpl.Status in ('01', '07')
Order by A_DataEntradaISC