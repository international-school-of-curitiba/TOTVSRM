select 
	
	(Select Nome from Eprofes where Eprofes.codprof = EPMT.Codprof) as nome , CodTur,
	--EPMT.Codmat, 
	(Select Materia from Edisciplinas where Edisciplinas.CodMat = EPMT.codmat) as disc
	--EPMT.Codprof, 
from EPROFMATTURMA EPMT where codperlet = '07/08'
and codfilial = 1
order by Nome, codtur, disc

