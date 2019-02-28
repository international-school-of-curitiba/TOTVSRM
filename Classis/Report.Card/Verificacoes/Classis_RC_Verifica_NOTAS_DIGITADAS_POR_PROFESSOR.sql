Select distinct
	UMA.MatAluno,
	(Select A_NomeReduzido from EACompl where Matricula = UMA.MatAluno) as Nome, 
	(Select UM.Materia from UMaterias UM where UM.CodMat = UMA.CodMat) as Materia,
	UMA.CodTur, 
	isnull(cast(UMA.A1 as nVarchar), '-') as Q1,
    isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ1,
	isnull(cast(UMA.A2 as nVarchar), '-') as Q2,
    isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ2,
	isnull(cast(UMA.A6 as nVarchar), '-') as Q3,
    isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ3,
	isnull(cast(UMA.A7 as nVarchar), '-') as Q3,
    isnull((Select Case WHEN P1 >= 0 and P1 <= 59 then 'NI' WHEN P1 >= 60 and P1 <= 99 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 >= 0 and P2 <= 59 then 'NI' WHEN P2 >= 60 and P2 <= 99 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMA.MatAluno and EAlunoTPr.codmat = UMA.CodMat and EAlunoTPr.Perletivo = UMA.Perletivo), '-') as EQ4
from UMatAlun UMA
inner join UProfMatTurma UPMT (NoLock) on (UPMT.CodMat = UMA.CodMat and UPMT.CodTur = UMA.CodTur and UMA.PerLetivo = UPMT.CodPerLet)
where UMA.Perletivo = '07/08'
and ((UMA.CodCur = 2 and UMA.CodPer = 2) or (UMA.CodCur = 3 and UMA.CodPer = 1))
and UPMT.CodProf in(
Select EP.CodProf from EProfes EP
where EP.CodPessoa in (Select PP.Codigo from PPessoa PP 
where PP.Apelido like '%hein%'))
ORDER BY UMA.CodTur, NOME

