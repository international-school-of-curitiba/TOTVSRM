

Select 
	MatAluno,
	(Select A_NomeReduzido from EACompl where matricula = MatAluno),
	Periodo
from UMatricpl 
where PerLetivo = '08/09' and codCur = 3 and Periodo != 12
and mataluno not in (
Select mataluno from UmatAlun
where perletivo = '08/09'
and codcur = 3 
and codtur = 'HS_Elective'
)


Select 
	MatAluno,
	(Select A_NomeReduzido from EACompl where matricula = MatAluno),
	CodTur,
	(Select materia from UMaterias where UMaterias.CodMat = UMatAlun.CodMat),
	 Case when cast(A1 as varchar) = '1.00' then 'Incomple' else cast(A1 as varchar) end
 from UMatAlun
where PerLetivo = '08/09'
and A1 = 1 and codcur != 1 and ((CodCur = 2 and CodPer = 2) or (CodCur = 3))