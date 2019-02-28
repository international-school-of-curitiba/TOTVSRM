
/* SELECIONA TODAS AS DISCIPLINAS US DE UMA TURMA */

SELECT DISTINCT
	UMATALUN.CODMAT, UMATERIAS.MATERIA, UMATERIAS.POSHIST
FROM UMATALUN
INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
WHERE UMATALUN.PERLETIVO = '06/07'
AND UMATALUN.CODTUR = '1A'
AND UMATALUN.CODMAT IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
ORDER BY UMATERIAS.POSHIST

/* SELECIONA TODOS OS ALUNOS DE UMA TURMA NAS DISCIPLINAS US */

SELECT DISTINCT
	UMATALUN.CODMAT, UMATERIAS.MATERIA, UMATALUN.MATALUNO, EACOMPL.A_NOMEREDUZIDO, UMATERIAS.POSHIST
FROM UMATALUN
INNER JOIN UMATERIAS (NOLOCK) ON (UMATERIAS.CODMAT = UMATALUN.CODMAT)
INNER JOIN EACOMPL (NOLOCK) ON (EACOMPL.MATRICULA = UMATALUN.MATALUNO)
WHERE UMATALUN.PERLETIVO = '06/07'
AND UMATALUN.CODTUR = '1A'
AND UMATALUN.CODMAT IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
ORDER BY UMATERIAS.POSHIST, EACOMPL.A_NOMEREDUZIDO





Select Distinct
	EAcompl.Matricula,
	EACompl.A_NomeReduzido,
	(Select top 1 Umatalun.CodTur from UMatAlun where EAlunos.matricula = UMatAlun.MatAluno AND UMATALUN.PERLETIVO = '06/07') as Grade_Level,
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
	Left Join Umatricpl (Nolock) on (Ealunos.matricula = Umatricpl.mataluno and Umatricpl.Perletivo='06/07')
	Left Join Umatalun (Nolock) on (Umatricpl.mataluno = Umatalun.mataluno and umatalun.perletivo = Umatricpl.Perletivo)
Where 	
 	Umatricpl.Perletivo = '06/07' 
and	UMatricpl.Status in('01','07')
and 	Umatalun.CodTur = ('1A')
Order By UMatricpl.CodCur, UMatricpl.CodPer, UMatricpl.Periodo, Grade_Level, EACompl.A_Nomereduzido
