Declare @SchoolYear nvarchar(5)
Declare @Quarter nvarchar(2)

Set @SchoolYear = '08/09'
Set @Quarter = '7'

Select Distinct
	EAcompl.Matricula,
	EACompl.A_NOMEREDUZIDO,
	EAlunos.DtNasc,
	(Select top 1 UMATALUN.CODTUR from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno and UMatAlun.Perletivo =  @SchoolYear Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	(Select Count(EAluOcor.Mataluno) from EAluOcor where EAluOcor.MatAluno = Ealunos.Matricula and EAluOcor.Status in ('AE', 'PE') and EAluOcor.CodOcorrencia = @Quarter and EAluOcor.CodPerLet=@SchoolYear ) as ExcusedAbsente, 
	(Select Count(EAluOcor.Mataluno) from EAluOcor where EAluOcor.MatAluno = Ealunos.Matricula and EAluOcor.Status in ('A', 'P') and EAluOcor.CodOcorrencia = @Quarter and EAluOcor.CodPerLet=@SchoolYear) as Absente, 
	(Select Count(EAluOcor.Mataluno) from EAluOcor where EAluOcor.MatAluno = Ealunos.Matricula and EAluOcor.Status = ('T') and EAluOcor.CodOcorrencia = @Quarter and EAluOcor.CodPerLet=@SchoolYear) as Tarde, 
	(Select Count(EAluOcor.Mataluno) from EAluOcor where EAluOcor.MatAluno = Ealunos.Matricula and EAluOcor.Status = ('E') and EAluOcor.CodOcorrencia = @Quarter and EAluOcor.CodPerLet=@SchoolYear) as Early, 
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
 	Umatricpl.Perletivo = @SchoolYear
and	UMatricpl.Status in('01','07')-- ,'14') --, '12','17')
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level, A_NomeReduzido --EACompl.A_NOMEING

