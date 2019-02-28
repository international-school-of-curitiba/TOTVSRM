Select Matricula, Ealunos.Nome, UMAT.codtur, UMAT.a2, UMAT.c2,
	(Select a1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%POR' and UmatAlun.perletivo = UMAT.perletivo) as POR,
	(Select c1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%POR' and UmatAlun.perletivo = UMAT.perletivo) as CPORT,
	(Select a1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%BST' and UmatAlun.perletivo = UMAT.perletivo) as BST,
	(Select c1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%BST' and UmatAlun.perletivo = UMAT.perletivo) as CBST,
	(Select a1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%BHG' and UmatAlun.perletivo = UMAT.perletivo) as BHG,
	(Select c1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%BHG' and UmatAlun.perletivo = UMAT.perletivo) as CBHG,
	(Select a1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%PSL' and UmatAlun.perletivo = UMAT.perletivo) as PSL,
	(Select c1 from UmatAlun where Umatalun.mataluno = UMAT.mataluno and Umatalun.codmat like '%PSL' and UmatAlun.perletivo = UMAT.perletivo) as CPSL
from UmatAlun UMAT, Ealunos
where  UMAT.MatAluno = Ealunos.Matricula
and UMAT.perletivo = '07/08'
and UMAT.codmat like '%PSL'
and Umat.CodCur = 2
and UMAT.Status in ('01', '07')
Order by Nome