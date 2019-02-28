Declare @SchoolYear nvarchar(10);

Set @SchoolYear = '08/09'

Select Distinct
	EAcompl.Matricula,
	EACompl.A_NomeReduzido,
        (Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo =@SchoolYear Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level$$,
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then EACompl.A_Nacional1
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2 + '/' + Eacompl.A_Nacional3
		end as Nationality,
	Case when Ealunos.Sexo = 'M' then 'Male' else 'Female' end as Gender, 
        Ealunos.DtNasc,
	DateDiff(yy, Ealunos.DtNasc, GETDATE()) -
		(case when (datepart(m, Ealunos.DtNasc) > datepart(m, GetDate())) or
			(datepart(m, Ealunos.DtNasc) = datepart(m, Getdate()) And 
			 datepart(d, Ealunos.DtNasc) > datepart(d, Getdate()))
			 then 1
	  		 else 0
		end) 
	as Idade,
	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo,
	(Select top 1 case when UMatricpl.CodCur = '1' then UMATALUN.CODTUR else 'Grade ' + UMATALUN.CODTUR end as teste from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo =@SchoolYear Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Nome_Level
from	Ealunos
	Left Join EACompl   (Nolock) on (EAlunos.Matricula = EAcompl.Matricula)
	Left Join UMatricPL (Nolock) on (EAlunos.Matricula = UMatricPL.Mataluno)
	Left Join UMatAlun  (Nolock) on (UMatricPL.MatAluno = UMatAlun.Mataluno and UMatAlun.Perletivo = UMatricPL.Perletivo)
	Left Join UMatTurma (NoLock) on (UMatTurma.CodTur = UMatAlun.CodTur and UMatAlun.Perletivo = UMatTurma.CodPerLet)
Where 	
 	UMatricPL.Perletivo = @SchoolYear
and	UMatricPL.Status in('01','07','04')
order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level$$, EACompl.A_NomeReduzido
