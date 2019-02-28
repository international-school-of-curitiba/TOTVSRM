Select 	Distinct Ealunos.matricula, 
	Ealunos.Nome, 
	UmatricPl.PerLetivo, 
	UmatricPl.CodCur, 
	UmatricPl.Periodo, 
	UmatricPl.Status, 
	UmatricPl.DataMat,
	UMatAlun.CodTur
from 	Ealunos
	Inner Join UMatricPl(NoLOCK) on (UmatricPl.MatAluno = Ealunos.Matricula)
	inner Join UMatAlun (NoLock) on (UmatAlun.MatAluno = Ealunos.Matricula)
Order by 
	UmatricPl.CodCur, 
	UmatricPl.Periodo,
	UMatAlun.CodTur,
	Ealunos.Nome


Select Mataluno, CodTur from Umatalun
