Select Distinct
	(Select top 1 case when UMatricpl.CodCur = '1' then UMATALUN.CODTUR else 'Grade ' + UMATALUN.CODTUR end as teste from UMatAlun where UMatAlun.Status in('01','07','04') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = UMatricPL.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level$$,
	EAcompl.Matricula,
	Rtrim(EACompl.A_NomeReduzido) as NomeReduzido,
    Ealunos.DtNasc,
	DateDiff(yy, Ealunos.DtNasc, GETDATE()) -
		(case when (datepart(m, Ealunos.DtNasc) > datepart(m, GetDate())) or
			(datepart(m, Ealunos.DtNasc) = datepart(m, Getdate()) And 
			 datepart(d, Ealunos.DtNasc) > datepart(d, Getdate()))
			 then 1
	  		 else 0
		end) 
	as Idade,
		Case when Ealunos.Sexo = 'M' then 'Male' else 'Female' end as Gender, 
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then rtrim(EACompl.A_Nacional1)
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2)
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2) + '/' + rtrim(Eacompl.A_Nacional3)
		end as Nationality,
	Case when vwESLStudents.MatAluno is not null then 'ESL' Else ' ' end as ESL,
	Case when vwPSLStudents.MatAluno is not null then 'PSL' Else ' ' end as PSL,
        Case when Ealunos.Sexo = 'M' then '1' else '0' end as Male, 
        Case when Ealunos.Sexo = 'F' then '1' else '0' end as Female, 
	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo,
        Case 
            when A_DataEntradaISC >= (getdate()-60) or a_ReturnedToISC >= (getdate()-60) then 'NEW ' 
	    when A_DATASAIDAISC is not null and A_RETURNEDTOISC is null and A_LEFTISC_2 is null then 'LEAVING '
	    when A_DATASAIDAISC is not null and A_RETURNEDTOISC is not null and A_LEFTISC_2 is not null then 'LEAVING '			
        else '' 
        end as NewStudent,
        Case when A_DataTeste is null then 'NOT TESTED' else '' end as Test,
        Substring(Utabtipo.Descricao,1,13)
from	Ealunos
	Left Join EACompl   (Nolock) on (EAlunos.Matricula = EAcompl.Matricula)
	Left Join UMatricPL (Nolock) on (EAlunos.Matricula = UMatricPL.Mataluno)
	Left Join UMatAlun  (Nolock) on (UMatricPL.MatAluno = UMatAlun.Mataluno and UMatAlun.Perletivo = UMatricPL.Perletivo)
	Left Join vwESLStudents (Nolock) on (vwESLStudents.Mataluno = Ealunos.Matricula and vwESLStudents.Perletivo = UMatricPL.Perletivo)
	Left Join vwPSLStudents (NoLock) on (vwPSLStudents.Mataluno = Ealunos.Matricula and vwPSLStudents.Perletivo = UMatricPL.Perletivo)
        Left Join Utabtipo (NoLock) on (utabtipo.CodTipo = Ealunos.TipoAluno)
Where 	
 	UMatricPL.Perletivo ='11/12'
    and UMatAlun.CodTur like '%'
    and	UMatricPL.Status in('01','07','04')
order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level$$, NomeReduzido