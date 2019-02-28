Select 
	IBEM.CODIGOBARRA, IBem.Descricao, IBem.DtAquisicao, 
	(Select NomeFantasia from Gfilial where Gfilial.CodFilial = Ibem.Codfilial) as Filial,
	Case when (Select PATINDEX('% - %', REVERSE(NOME)) from Ilocal where CodLocal = CodLocalAtual) = 0 then
		(Select NOME from Ilocal where CodLocal = CodLocalAtual)
	Else
		(Select SUBSTRING (NOME , 0, (LEN(NOME) - PATINDEX('% - %', REVERSE(NOME)))) from Ilocal where CodLocal = CodLocalAtual)
	End as 'Localização',
	(Select GConsist.Descricao from GConsist where GConsist.Codinterno = IBCompl.Classificacaobem and GConsist.CodTabela = '0001' and GConsist.Aplicacao = 'I') As Classificacao
from IBem
left join IBCompl (noLock) on (IBCompl.CodBem = Ibem.CodBem)
where DtAquisicao >= '08/01/2001'
--and IBem.codbem like '07.%'
and IBem.Ativo = 1 
and IBem.Descricao like '%'
Order by IBem.DESCRICAO
