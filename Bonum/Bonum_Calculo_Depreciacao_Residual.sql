select 
	IBem.CodBem,
	substring(IBem.Descricao,0,50),
	IBem.Dtaquisicao,
	IBem.VrAquisicao,
	IRazao.DeprecCorrigida,
	IRazao.VrBaseCorrigido - IRazao.DeprecCorrigida as VrResidual
from IRazao, IBem
WHERE IRazao.CodBem = IBem.CodBem
and IRazao.Data >= '07/01/2006'
and IRazao.Data <= '07/31/2006'

