Select
	UMA.MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = UMA.MatAluno) as Nome, 
	(Select UM.Materia from UMaterias UM where UM.CodMat = UMA.CodMat) as Materia$,
	UMA.CodTur as Turma$, 
	Case 
	when UMA.CodMat like '%ADV' then 
		isnull(Case when A1 >= 0 and A1 <= 59 then 'NI' WHEN A1 >= 60 and A1 <= 99 then 'M' WHEN A1 = 100 then 'E' ELSE '-' END, '-') 
	else
		isnull(SUBSTRING(cast(UMA.A1 as varchar), 0, (LEN(UMA.A1) - (PATINDEX('%.%', REVERSE(UMA.A1))-1))), '-')
	end as Q1,
        isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ1,
	Case 
	when UMA.CodMat like '%ADV' then 
		isnull(Case when A2 >= 0 and A2 <= 59 then 'NI' WHEN A2 >= 60 and A2 <= 99 then 'M' WHEN A2 = 100 then 'E' ELSE '-' END, '-') 
	else
		isnull(SUBSTRING(cast(UMA.A2 as varchar), 0, (LEN(UMA.A2) - (PATINDEX('%.%', REVERSE(UMA.A2))-1))), '-')
	end as Q2,
        isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ2,
	isnull(SUBSTRING(cast(UMA.A3 as varchar), 0, (LEN(UMA.A3) - (PATINDEX('%.%', REVERSE(UMA.A3))-1))), '-')as SA,
        isnull(SUBSTRING(cast(UMA.A4 as varchar), 0, (LEN(UMA.A4) - (PATINDEX('%.%', REVERSE(UMA.A4))-1))), '-')as Recuperation,
        isnull(SUBSTRING(cast(UMA.A5 as varchar), 0, (LEN(UMA.A5) - (PATINDEX('%.%', REVERSE(UMA.A5))-1))), '-')as SAAR,
        Case 
	when UMA.CodMat like '%ADV' then 
		isnull(Case when A6 >= 0 and A6 <= 59 then 'NI' WHEN A6 >= 60 and A6 <= 99 then 'M' WHEN A6 = 100 then 'E' ELSE '-' END, '-') 
	else
		isnull(SUBSTRING(cast(UMA.A6 as varchar), 0, (LEN(UMA.A6) - (PATINDEX('%.%', REVERSE(UMA.A6))-1))), '-')
	end as Q3,
         isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ3,
	Case 
	when UMA.CodMat like '%ADV' then 
		isnull(Case when A7 >= 0 and A7 <= 59 then 'NI' WHEN A7 >= 60 and A7 <= 99 then 'M' WHEN A7 = 100 then 'E' ELSE '-' END, '-') 
	else
		isnull(SUBSTRING(cast(UMA.A7 as varchar), 0, (LEN(UMA.A7) - (PATINDEX('%.%', REVERSE(UMA.A7))-1))), '-')
	end as Q4,
        isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ4,
	isnull(SUBSTRING(cast(UMA.A8 as varchar), 0, (LEN(UMA.A8) - (PATINDEX('%.%', REVERSE(UMA.A8))-1))), '-')as SA2,
        isnull(SUBSTRING(cast(UMA.A9 as varchar), 0, (LEN(UMA.A9) - (PATINDEX('%.%', REVERSE(UMA.A9))-1))), '-')as Recuperation2,
        isnull(SUBSTRING(cast(UMA.A10 as varchar), 0, (LEN(UMA.A10) - (PATINDEX('%.%', REVERSE(UMA.A10))-1))), '-')as SAAR2
from UMatAlun UMA
inner join UProfMatTurma UPMT (NoLock) on (UPMT.CodMat = UMA.CodMat and UPMT.CodTur = UMA.CodTur and UMA.PerLetivo = UPMT.CodPerLet)
where UMA.Perletivo ='09/10'
and ((UMA.CodCur = 2 and UMA.CodPer = 2) or (UMA.CodCur = 3 and UMA.CodPer = 1))
-- and UPMT.CodProf =
and UMA.Status in ('01', '07', '12')
ORDER BY Turma$, Materia$, NOME



Select distinct
	UMA.MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = UMA.MatAluno) as Nome, 
	(Select UM.Materia from UMaterias UM where UM.CodMat = UMA.CodMat) as Materia$,
	UMA.CodTur as Turma$, UMA.A1, UMA.C1, UMA.A2, UMA.C2, UMA.A6, UMA.C6, UMA.A7, UMA.C7, UMA.CODMAT
from UMatAlun UMA
inner join UProfMatTurma UPMT (NoLock) on (UPMT.CodMat = UMA.CodMat and UPMT.CodTur = UMA.CodTur and UMA.PerLetivo = UPMT.CodPerLet)
where UMA.Perletivo ='09/10'
and UMA.CodCur = 2
and UMA.CodPer = 1
and UMA.Status in ('01', '07')
and UPMT.CodProf =1311
ORDER BY Turma$, Materia$, NOME