Select 
	Matricula, EACompl.a_NomeReduzido,
    UMATALUN.CODTUR, UMatAlun.CodMat,
    (Select Materia from UMaterias where UMaterias.CodMat = UMatAlun.CodMat),
	a1, a2,a3,a4,a5,status
from UMatAlun
	left join Eacompl (NoLock) on (EAcompl.Matricula = UMatAlun.MatAluno)
where a5 < 60
and Perletivo = '08/09' and 
((CodCur = 2 and CodPer = 2) or (CodCur = 3 and CodPer = 1)) 
and CodMat in (SELECT 	CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
and Status in ('01', '07','06', '12') --and a2 is not null
