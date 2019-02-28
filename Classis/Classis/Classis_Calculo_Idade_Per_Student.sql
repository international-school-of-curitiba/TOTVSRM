select distinct
	EAcompl.A_Familia, 
	--(Select top 1 Ealunos.nome from Ealunos as Alunos where Alunos.matricula = Ealunos.matricula) as Student,
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
	END AS IDADE,
	EAcompl.matricula
from 	EAcompl (Nolock)
	left join Ealunos (nolock) on (EAcompl.matricula = Ealunos.matricula)
	left join Ualucurso (Nolock) on (Ualucurso.Mataluno = Ealunos.matricula)
	left join Eirmaos (Nolock) on (Eirmaos.Mataluno = Ealunos.Matricula)
	left join Umatricpl (NoLock) On (Umatricpl.mataluno = Ealunos.matricula)
Where 	Ualucurso.status = '01' -- Todos os Matriculados
Order by  
	EAcompl.A_Familia, Idade