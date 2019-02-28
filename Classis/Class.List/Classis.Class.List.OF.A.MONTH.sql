Select Distinct
	(Select top 1 
		case when UMatricpl.CodCur = '1' then UMATALUN.CODTUR 
		else 'Grade ' + UMATALUN.CODTUR end as teste
		from UMatAlun where UMatAlun.Status in ('01', '07','18','04') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = Umatricpl.Perletivo and UMatricPL.Status in('01','07','18','04') Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level$$,
	(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.Status in ('01', '07','18','04') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = Umatricpl.Perletivo and UMatricPL.Status in('01','07','18','04') Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as CodTUR,
 	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo as Periodo$$
from Ealunos
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno)
	Left Join UmatAlun (Nolock) on (Umatricpl.mataluno = UMatAlun.mataluno and UmatAlun.PerLetivo = Umatricpl.Perletivo )
Where 	
 	Umatricpl.Perletivo ='11/12' and UMatricPL.Status in('01','07','18','04') and UMatAlun.CodTur like '%'
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level$$





Select Distinct
	UMatricPL.Status,
	EACOMPL.A_DATAENTRADAISC,
	eacompl.A_DATASAIDAISC,
	EACOMPL.A_RETURNEDTOISC,
	Eacompl.A_LEFTISC_2,
	(Select top 1 case when UMatricpl.CodCur = '1' then UMATALUN.CODTUR else 'Grade ' + UMATALUN.CODTUR end as teste from UMatAlun where UMatAlun.Status in(select distinct status from UMATRICPL where PERLETIVO = '11/12') and UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo = UMatricPL.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level$$,
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
        Case when A_DataEntradaISC >= (getdate()-60) or a_ReturnedToISC >= (getdate()-60) then 'NEW ' else '' end as NewStudent,
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
 	--UMatricPL.Perletivo ='11/12'
  --  and UMatAlun.CodTur like :Espelho#3_S
    --	UMatricPL.Status in (select distinct status from UMATRICPL where PERLETIVO = '11/12')
   --AND (EACOMPL.A_DATAENTRADAISC <= '08/31/2011' or EACOMPL.A_RETURNEDTOISC <= '08/31/2011')
   --AND (EACOMPL.A_DATASAIDAISC <= '08/31/2011')
     UMatricPL.Status not in('09','16','18','20')
 AND( 
   	(UMatricPL.PerLetivo ='11/12' and A_DataEntradaISC <='08/31/2011' and A_DataSaidaISC is null) 
OR
	(UMatricPL.PerLetivo ='11/12' and A_DataEntradaISC <='08/31/2011' and A_DataSaidaISC >'08/31/2011')
OR
	(UMatricPL.PerLetivo ='11/12' and A_ReturnedToISC <='08/31/2011' and A_LeftISC_2 is null) 
OR
	(UMatricPL.PerLetivo ='11/12' and A_ReturnedToISC <='08/31/2011' and A_LeftISC_2 >'08/31/2011')
)
order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level$$, NomeReduzido



