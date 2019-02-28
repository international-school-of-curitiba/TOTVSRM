Select	
	IBem.CodBem, 
	IBem.Patrimonio, 
	(Select ILocal.Nome from Ilocal where ILocal.CodLocal = IBem.CodLocalAtual) as Local, 
	IBem.Descricao,
	IBCompl.NomeDoBem,
	IBCompl.IP,
	(Select GConsist.Descricao from GConsist where GConsist.Codinterno = IBCompl.Classificacaobem and GConsist.CodTabela = '0001' and GConsist.Aplicacao = 'I') As Classificacao,
	(Select GConsist.Descricao from GConsist where GConsist.Codinterno = IBCompl.SistemaOP and GConsist.CodTabela = '0002' and GConsist.Aplicacao = 'I') as OS
from
	IBem
	left Join IBCompl (Nolock) on (IBCompl.CodBem = Ibem.CodBem)
Where	IBem.Agregado is null
and     IBem.CodBem >= '07'
and     IBem.CodBem <  '08'
Order by IBem.Descricao