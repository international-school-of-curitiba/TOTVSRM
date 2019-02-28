Select 
	UMaterias.PosHist,
	UMaterias.materia,
	(select top 1 PPessoa.Apelido from UprofMatturma, PPessoa, EProfes where EProfes.CodProf = UProfMatturma.CodProf and PPessoa.Codigo=EProfes.Codpessoa and UProfMatturma.Codmat =UMatAlun.CodMat and UProfMatturma.TipoProf = 'T' and UProfMatturma.CodPerlet = UMatAlun.Perletivo),
	isnull(SUBSTRING(cast(UMatAlun.A1 as varchar), 0, (LEN(UMatAlun.A1) - (PATINDEX('%.%', REVERSE(UMatAlun.A1))-1))), '-') as Q1,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ1,
	isnull(SUBSTRING(cast(UMatAlun.A2 as varchar), 0, (LEN(UMatAlun.A2) - (PATINDEX('%.%', REVERSE(UMatAlun.A2))-1))), '-') as Q2,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ2,
	isnull(SUBSTRING(cast(UMatAlun.A3 as varchar), 0, (LEN(UMatAlun.A3) - (PATINDEX('%.%', REVERSE(UMatAlun.A3))-1))), '-') as Sem1_Avg,
	isnull(SUBSTRING(cast(UMatAlun.A5 as varchar), 0, (LEN(UMatAlun.A5) - (PATINDEX('%.%', REVERSE(UMatAlun.A5))-1))), '-') as Sem1_Avg_AR,
	isnull(SUBSTRING(cast(UMatAlun.A6 as varchar), 0, (LEN(UMatAlun.A6) - (PATINDEX('%.%', REVERSE(UMatAlun.A6))-1))), '-') as Q3,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ3,
	isnull(SUBSTRING(cast(UMatAlun.A7 as varchar), 0, (LEN(UMatAlun.A7) - (PATINDEX('%.%', REVERSE(UMatAlun.A7))-1))), '-') as Q4,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ4,
	isnull(SUBSTRING(cast(UMatAlun.A8 as varchar), 0, (LEN(UMatAlun.A8) - (PATINDEX('%.%', REVERSE(UMatAlun.A8))-1))), '-') as Sem1_Avg,
	isnull(SUBSTRING(cast(UMatAlun.A10 as varchar), 0, (LEN(UMatAlun.A10) - (PATINDEX('%.%', REVERSE(UMatAlun.A10))-1))), '-') as Sem1_Avg_AR,
	isnull(SUBSTRING(cast(UMatAlun.A0 as varchar), 0, (LEN(UMatAlun.A0) - (PATINDEX('%.%', REVERSE(UMatAlun.A0))-1))), '-') as Final
From 
	UMatAlun, UMaterias
Where UMatAlun.CodMat = UMaterias.CodMat
and UMatAlun.Perletivo = '06/07'
and UMatAlun.MatAluno = '00132'
and UMatAlun.CodMat IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
order by UMaterias.PosHist

