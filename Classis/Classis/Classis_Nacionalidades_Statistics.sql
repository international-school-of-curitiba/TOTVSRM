/*

drop View VW_Students_Nationality
Create View VW_Students_Nationality AS
Select distinct
	A_Nacional1,
	A_Nacional2,
	A_Nacional3,
	Umatricpl.Perletivo as Perletivo,
	count(EAcompl.Matricula) as Students
from Eacompl
	Left Join Ealunos (nolock) on (EAlunos.matricula = EAcompl.Matricula)
	Left Join UAluCurso (NoLock) on (Ealunos.matricula = UAlucurso.mataluno)
	Left Join Umatricpl (NoLock) on (EAlunos.Matricula = Umatricpl.MatAluno)
Where Umatricpl.Perletivo = '05/06'
and UMatricpl.Status in ('01','07')
Group by A_Nacional1, A_Nacional2, A_Nacional3, Umatricpl.Perletivo

*/

Select 	
	Case 
	When A_Nacional3 is null and A_Nacional2 is null then A_Nacional1
	When A_Nacional3 is null and A_Nacional2 is not null then A_Nacional1 + '/'+ A_Nacional2
	When A_Nacional3 is not null and A_Nacional2 is not null then A_Nacional1 + '/'+ A_Nacional2 + '/' + A_Nacional3
	end as Nationality,
	Students
from VW_Students_Nationality
Where Perletivo = '05/06'