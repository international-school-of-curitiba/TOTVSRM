Select 
	UMatAlun.MatAluno, 
	(Select A_NomeReduzido from EACompl where Eacompl.Matricula = UMatAlun.Mataluno) as Nome,
	UMatAlun.CodTur,
	(Select Materia from Umaterias where UMaterias.CodMat = UMatAlun.codmat) as Materia,  
	A1,C1,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ1,
	A2, 
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ2,
	A3 as Sem_Avg,
	A4 as Recup_Grade,
	A5 as Sem_Avg_After_Recup,
	A6, 
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ3,
	A7,
	isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ4,
	A8 as Sem_Avg,
	A9 as Recup_Grade,
	A10 as Sem_Avg_After_Recup
from UmatAlun
where Perletivo = '08/09' and UMatAlun.status in ('01', '07') 
--and codmat in (Select CodMat from Uprofmatturma where codprof = '1332' and Codperlet = '06/07')
AND codmat in (Select CodMat from Umaterias where segundonome = 'US')
and MatAluno = '00649'
Order by CodTur, Nome
