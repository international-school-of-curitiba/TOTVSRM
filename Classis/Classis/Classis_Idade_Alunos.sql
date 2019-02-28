select distinct
	EAlunos.Nome,
        Ealunos.dtnasc,
	CASE 
	   WHEN (DATEPART(DAY, EALUNOS.DTNASC)) > (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) > DATEPART(MONTH, GETDATE()) 
 	     OR (DATEPART(DAY, EALUNOS.DTNASC)) < (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) > DATEPART(MONTH, GETDATE())
	     OR (DATEPART(DAY, EALUNOS.DTNASC)) > (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) = DATEPART(MONTH, GETDATE()) 	
             OR (DATEPART(DAY, EALUNOS.DTNASC)) = (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) > DATEPART(MONTH, GETDATE())  
             	THEN DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, EALUNOS.DTNASC) - 1
	   WHEN (DATEPART(DAY, EALUNOS.DTNASC)) > (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) < DATEPART(MONTH, GETDATE()) 
	     OR	(DATEPART(DAY, EALUNOS.DTNASC)) < (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) < DATEPART(MONTH, GETDATE()) 
	     OR	(DATEPART(DAY, EALUNOS.DTNASC)) < (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) = DATEPART(MONTH, GETDATE())  	   
	     OR	(DATEPART(DAY, EALUNOS.DTNASC)) = (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) = DATEPART(MONTH, GETDATE())
	     OR (DATEPART(DAY, EALUNOS.DTNASC)) = (DATEPART(DAY, GETDATE())) AND DATEPART(MONTH, EALUNOS.DTNASC) < DATEPART(MONTH, GETDATE())
		THEN DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, EALUNOS.DTNASC)
        Else ''
	END AS IDADE
from 	
	EAcompl (Nolock)
	left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
Where 	
	Ualucurso.status = '01'
and     Ealunos.mae='576' or Ealunos.pai = '78' 
Group by EAlunos.Nome,  Ealunos.dtnasc
Order by 
	Ealunos.dtnasc desc