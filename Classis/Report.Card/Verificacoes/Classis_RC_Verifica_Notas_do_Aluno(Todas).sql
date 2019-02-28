Select 
	(Select Nome from Ealunos where Matricula = MatAluno) Nome, CodTur,
	CodMat,
	(Select Materia from Umaterias where Umaterias.CodMat = UMatAlun.CodMat),
	a1, 
	a2, 
	a3, 
	a4, 
	a5, 
	a6, 
	a7, 
	a8, 
	a9, 
	a10,
	a0
from UMatAlun
where Perletivo = '06/07'
and MatAluno = 00211


/*
update UMatAlun
set a0 ='69.00' 
where Perletivo = '06/07'
and MatAluno = 00211
and CodMat ='301Eng'
*/