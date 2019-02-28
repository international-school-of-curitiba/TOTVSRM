Select 	Clctlote.LCTREF, 
	Clctlote.DATA, 
	Clctlote.DEBITO,
 	CConta.descricao,
	Clctlote.CREDITO,
	CConta.descricao, 	
	Clctlote.VALOR, 
	CHistP.Descricao, 	
	Clctlote.CodCCusto, 
	GCCusto.Nome
from 	CLCTLOTE
	left join CConta (nolock) on (Clctlote.debito = CConta.codconta or Clctlote.Credito = CConta.codconta)
	Left join Chistp (nolock) on (Clctlote.codhistp = chistp.codhistp)
	Left join GCcusto (nolock) on (Clctlote.CodCCusto = GCCusto.CodCCusto)
Where Clctlote.DEBITO is not null and Clctlote.codlote = '2' -- and GCcusto.codCCusto = '1.01.01.02.03.1003'
order by 
	Clctlote.LCTREF






