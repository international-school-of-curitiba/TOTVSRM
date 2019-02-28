

Select 
	(Select Nome from Ealunos where Matricula = MatAluno) Nome, CodTur,
	(Select Materia from Umaterias where Umaterias.CodMat = UMatAlun.CodMat),
	a1, 
	a2, 
--	a3, 
--	a4, 
--	a5, 
	a6, 
	a7, 
--	a8, 
--	a9, 
--	a10,
	a0
from UMatAlun
where Perletivo = '06/07'
--and CodCur = '3'
--and Codtur = '12A'
and UMatAlun.CodMat in (Select Codmat from UProfmatturma where codprof = 1332) --(Select CodMat from UMaterias where SegundoNome = 'US')
Order by UMatAlun.CodMat, Nome

Select Codmat from UProfmatturma where codprof = 1332