Select distinct
	UMA.MatAluno,
	(Select Nome from Ealunos where Matricula = UMA.MatAluno) as Nome, 
	(Select UM.Materia from UMaterias UM where UM.CodMat = UMA.CodMat) as Materia,
	UMA.CodTur, UMA.A1, UMA.C1, UMA.A2, UMA.C2, UMA.A6, UMA.C6, UMA.A7, UMA.C7
from UMatAlun UMA
inner join UProfMatTurma UPMT (NoLock) on (UPMT.CodMat = UMA.CodMat and UPMT.CodTur = UMA.CodTur and UMA.PerLetivo = UPMT.CodPerLet)
where UMA.Perletivo = '07/08'
and UMA.CodCur = 2
and UMA.CodPer = 1 AND UMA.STATUS IN('01','07')
and UPMT.CodProf in(
Select EP.CodProf from EProfes EP
where EP.CodPessoa in (Select PP.Codigo from PPessoa PP 
where PP.Apelido like '%hein%'))
ORDER BY UMA.CodTur, NOME
