Select 
	IBem.CodBem,
	IBem.CodigoBarra,
	IBem.Descricao,
	IBem.DtAquisicao,
	Datediff(yy, dtAquisicao, getdate()) as Anos,
	IBem.VrAquisicao, Depreciacao,
	(IBem.VrAquisicao - Depreciacao) as ValorAtual,
	PFunc.Nome,
	ILocal.Nome,
	IBem.CodFilial
from IBem
left Join PFunc (NoLock) on (IBem.ChapaFuncAtual = PFunc.Chapa)
left Join ILocal (NoLock) on (IBem.CodLocalAtual = ILocal.CodLocal)
where IBem.CodBem between '07' and '08.9999'
and Datediff(yy, IBem.dtAquisicao, getdate()) >= 0
and IBem.Ativo = 1
and IBem.DESCRICAO like '%hyt%'
Order by Datediff(yy, IBem.dtAquisicao, getdate()) desc