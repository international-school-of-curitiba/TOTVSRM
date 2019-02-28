Select 
	CodContas,
	(Select Descricao from IGRPCONT where CODGRUPO = CodContas) as Grupo,
	CodigoBarra, 
	CodBem, 
	RTrim(descricao) as Descricao,
	VrAquisicao, 
(Select Nome from Pfunc where chapa = chapafuncatual) as Responsavel,
CodLocalAtual,
(Select Nome from Ilocal where codlocal = CodLocalAtual) as Local,
codFilial,
Quantidade,
dtaquisicao,
NumeroDocumento,
(SELECT TOP 1 SALDORESIDUAL FROM ICALCULORAZAO WHERE ICALCULORAZAO.IDPATRIMONIO = IBEM.PATRIMONIO ORDER BY DATA DESC )
from Ibem
Where Ibem.Ativo = 1
and substring(codbem,1,2) like '%'
and len(codbem)= 7
Order by CodContas, DESCRICAO, Codigobarra desc