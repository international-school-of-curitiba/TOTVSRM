Select Distinct
    EAcompl.Matricula,
	EACompl.A_NomeReduzido,
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
	Case When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then EACompl.A_Nacional1
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then EACompl.A_Nacional1 + '/'+ EACompl.A_Nacional2 + '/' + Eacompl.A_Nacional3
		end as Nationality,
        Case when A_DataTeste is null then 'NOT TESTED' else '' end as Test,
        Case when DatePart(Month,UMatricpl.DataMat) = 1 then 'Jan'
             when DatePart(Month,UMatricpl.DataMat) = 2 then 'Fev'
             when DatePart(Month,UMatricpl.DataMat) = 3 then 'Mar'
             when DatePart(Month,UMatricpl.DataMat) = 4 then 'Apr'
             when DatePart(Month,UMatricpl.DataMat) = 5 then 'May'
             when DatePart(Month,UMatricpl.DataMat) = 6 then 'Jun'
             when DatePart(Month,UMatricpl.DataMat) = 7 then 'Jul'
             when DatePart(Month,UMatricpl.DataMat) = 8 then 'Aug'
             when DatePart(Month,UMatricpl.DataMat) = 9 then 'Sep'
             when DatePart(Month,UMatricpl.DataMat) = 10 then 'Oct'
             when DatePart(Month,UMatricpl.DataMat) = 11 then 'Nov'
             when DatePart(Month,UMatricpl.DataMat) = 12 then 'Dec'
        end  + '/' + Cast(DatePart(YYYY,UMatricpl.DataMat) as Varchar)as DataMatricula,
	UMatricpl.CodCur, UMatricpl.CodPer , UMatricpl.Periodo,
	Case 
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 0 then 'Pre-Toddler'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 1 then 'Toddler'		
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 2 then 'Nursery'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 3 then 'Pre-Kinder'
		when UMatricpl.CodCur = 1 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 4 then 'Kinder'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 1 then '1st Grade'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 2 then '2nd Grade'
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 3 then '3rd Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 4 then '4th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 5 then '5th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 6 then '6th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 7 then '7th Grade'		
		when UMatricpl.CodCur = 2 and UMatricpl.CodPer = 2 and UMatricpl.Periodo = 8 then '8th Grade'		
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 9 then '9th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 10 then '10th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 11 then '11th Grade'	
		when UMatricpl.CodCur = 3 and UMatricpl.CodPer = 1 and UMatricpl.Periodo = 12 then '12th Grade'						
	else '' 
	end		
from Ealunos
	Left Join EACompl   (Nolock) on (EAlunos.Matricula = EAcompl.Matricula)
	Left Join UMatricPL (Nolock) on (EAlunos.Matricula = UMatricPL.Mataluno)
Where 	
 	UMatricPL.Perletivo ='10/11'
    and	UMatricPL.Status = '09'
order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, EACompl.A_NomeReduzido