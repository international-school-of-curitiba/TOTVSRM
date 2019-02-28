Select DataMAT, Status, 
	IsNull((Select Nome +' ('+ CodPerLet+')' from UEtapas Where DataInicio <= DataMat and DataTermino >= DataMat and CodEtapa in (1,2,6,7)),
	(Select Top 1 Nome +' ('+ CodPerLet+')' from UEtapas Where DataInicio >= DataMat)) as Descricao,
	IsNull((Select CodEtapa from UEtapas Where DataInicio <= DataMat and DataTermino >= DataMat and CodEtapa in (1,2,6,7)),
	(Select Top 1 CodEtapa from UEtapas Where DataInicio >= DataMat)) as CodEtapa, CodMat,
	a1,a2,a6,a7, *
from UMatAlun
Where Perletivo = '08/09' 
and a2 is null
and Status not in (14, 02, 04)
and CodCur >= 2

order By CodEtapa

--Select * from UEtapas where CodPerlet = '08/09' and 