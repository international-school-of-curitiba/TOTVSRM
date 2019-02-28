select 
	IBem.Patrimonio,
	Ibem.CodBem,
	IBem.Descricao,
--	IBem.Quantidade,
	IBEm.DtAquisicao,
	IBEm.DATAALTERACAO,
	IBEM.NumeroDocumento,
	IBem.VrAquisicao -
	IBEM.depreciacao,
	(Select Nome from PFunc where PFunc.Chapa = IBem.ChapaFuncAtual) as Responsavel,
	IBem.CodLocalAtual,
	(Select Nome from ILocal where ILocal.CodLocal = IBem.CodLocalAtual) as Localizacao,
	IBem.CodFilial
from  IBem
left join IBCompl (NoLock) on (IBCompl.CodBem = IBem.CodBem)
Where Len(IBem.CodBem)> 3
and IBem.Ativo = 1
and IBem.CodFilial in (1)
and Ibem.Codbem < '98'
--and IBEm.DtAquisicao >= '08/01/2008'
Order by Ibem.CodFilial, IBem.CodBem

