Select 
		UMatAlun.MatAluno,
		EACompl.A_NomeReduzido,
		UMaterias.Materia,
		UMatAlun.CodTur,
		UMatAlun.A1,
		UMatAlun.C1
from	UMatAlun
		Left Join EACompl (noLock) on (EACompl.Matricula = UMatAlun.MatAluno)
		Left Join UMaterias (NoLock) on (UMaterias.CodMat = UMatAlun.CodMat)
Where
		UMatAlun.Perletivo = '06/07'
and		UMatAlun.CodCur = 2
and		UMatAlun.CodPer = 1
and		UMatAlun.C1 in ('U', 'D')
and		UMaterias.SegundoNome = 'US'
Order by CodTur, A_NomeReduzido