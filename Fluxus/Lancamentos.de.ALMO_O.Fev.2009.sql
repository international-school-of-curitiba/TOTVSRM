Select 
	codcfo,
	(Select NomeFantasia from FCFO where fcfo.CodCFO = flan.codcfo) as nome,
	cast(sum(valorbaixado) as money),
	case
		when statuslan = 0 then 'Aberto'
		when statuslan = 1 then 'Baixado'
	else 'Acordo' 
	end status, 
	DataVencimento,	
	databaixa
from Flan
where datavencimento = '02/05/2009'
and Historico like 'ALMOCO%'
and Statuslan <> 2
Group by CODCFO, DataVencimento, databaixa, statuslan