Select 
	Eprofes.Nome,
	CodTur, 
	(Select Materia from UMaterias where UMaterias.CodMat = UProfmatTurma.CodMat)as materia
from UProfmatturma
inner join Eprofes (NoLock) on (EProfes.CodProf = UProfmatturma.Codprof)
where 
	CodPerLet = '10/11'
and substring(CodMat,4,1) = 'I'
Order by Nome

Select 
	Eprofes.Nome,
	UProfMatTurma.CodTur, 
	(Select Materia from UMaterias where UMaterias.CodMat = UProfmatTurma.CodMat)as materia,
	(Select A_NomeReduzido from EAcompl where Matricula = UMatAlun.Mataluno) as Student
from UProfmatturma
inner join Eprofes (NoLock) on (EProfes.CodProf = UProfmatturma.Codprof)
inner Join UMatAlun (NoLock) on (UMatAlun.CodMat = UProfMatTurma.CodMat and UMatAlun.Perletivo = UProfMatTurma.CodPerLet)
where 
	UProfMatTurma.CodPerLet = '10/11'
and substring(UProfMatTurma.CodMat,4,1) = 'I'
Order by Nome

