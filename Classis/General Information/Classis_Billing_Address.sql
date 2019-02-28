Select Distinct	
	NomeFantasia, 
	CASE WHEN (FCFO.ComplementoPGTO is null) THEN FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO
	ELSE FCFO.RuaPGTO + ', ' + FCFO.NumeroPGTO + ' - ' + FCFO.ComplementoPGTO End as Endereco1,
	FCFO.BairroPGTO + ' - ' + FCFO.CidadePGTO + ' - ' + FCFO.CodEtd,
	FCFO.CEP
from FCFO
Where FCFO.CODCFO = 'C00001'