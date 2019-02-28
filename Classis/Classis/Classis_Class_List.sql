Select Distinct
	EAcompl.Matricula,
	EACompl.A_NOMEREDUZIDO,
	(Select top 1  Umatalun.CodTur from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno and UmatAlun.Perletivo = '07/08' Group by Umatalun.codtur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then EACompl.A_Nacional1
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2 + '/' + Eacompl.A_Nacional3
		end as Nationality,
	Case when Ealunos.Sexo = 'M' then 'Male' else 'Female' end as Gender, 
	DateDiff(yy, Ealunos.DtNasc, GETDATE()) -
		(case when (datepart(m, Ealunos.DtNasc) > datepart(m, GetDate())) or
			(datepart(m, Ealunos.DtNasc) = datepart(m, Getdate()) And 
			 datepart(d, Ealunos.DtNasc) > datepart(d, Getdate()))
			 then 1
	  		 else 0
		end) 
	as Idade,
	UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo
from	Ealunos
	Left Join EACompl (Nolock) on  (Ealunos.matricula = EAcompl.matricula)
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join Umatalun (Nolock) on (Umatricpl.mataluno = Umatalun.mataluno)
Where 	
 	Umatricpl.Perletivo = '07/08'
and	UMatricpl.Status in('01','07')-- and Umatalun.CodTur is not null
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level, EACompl.A_NOMEREDUZIDO 