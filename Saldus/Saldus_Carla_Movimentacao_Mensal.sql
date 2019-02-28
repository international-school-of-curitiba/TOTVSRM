Select 	CodConta,
	Descricao
from CConta
where Analitica = 1 and CodConta > '3'



Select 
	CLanca.DEBITO,
 	(Select CConta.descricao from CConta where CConta.codconta = Clanca.debito) as Debito,
	sum(CLanca.VALOR),
	GCCusto.CodReduzido, 
	GCCusto.Nome
from
	CLanca
	left join CConta (nolock) on (Clanca.debito = CConta.codconta)
	Left join GCcusto (nolock) on (Clanca.CodCCusto = GCCusto.CodCCusto)
Where 	CLanca.Data >= '08/01/2006'
and 	CLanca.Data <= '08/31/2006'
--and	debito = '4.1.01.001.0002.0003'
and     Debito in (Select CodConta from CConta where Analitica = 1 and CodConta > '3')
and	GCCusto.CodReduzido is not null
Group by CLanca.DEBITO, GCCusto.CodReduzido, GCCusto.Nome 
Order by CLanca.DEBITO

Select 
	CLanca.Credito,
 	(Select CConta.descricao from CConta where CConta.codconta = Clanca.Credito) as credito,
	sum(CLanca.VALOR),
	GCCusto.CodReduzido, 
	GCCusto.Nome
from
	CLanca
	left join CConta (nolock) on (Clanca.Credito = CConta.codconta)
	Left join GCcusto (nolock) on (Clanca.CodCCusto = GCCusto.CodCCusto)
Where 	CLanca.Data >= '08/01/2006'
and 	CLanca.Data <= '08/31/2006'
--and	Credito = '4.1.01.001.0002.0003'
and     credito in (Select CodConta from CConta where Analitica = 1 and CodConta > '3')
Group by CLanca.Credito, GCCusto.CodReduzido, GCCusto.Nome 
Order by CLanca.Credito














/*
Select 
	CLanca.Data,
	CLanca.DEBITO,
 	(Select CConta.descricao from CConta where CConta.codconta = Clanca.debito) as Debito,
	CLanca.CREDITO,
	(Select CConta.descricao from CConta where CConta.codconta = Clanca.Credito) as Credito, 	
	CLanca.VALOR, 
	CHistP.Descricao, 	
	CLanca.CodCCusto, 
	GCCusto.Nome
from
	CLanca
	left join CConta (nolock) on (Clanca.Credito = CConta.codconta)
	Left join Chistp (nolock) on (Clanca.codhistp = chistp.codhistp)
	Left join GCcusto (nolock) on (Clanca.CodCCusto = GCCusto.CodCCusto)
Where 	CLanca.Data >= '08/01/2006'
and 	CLanca.Data <= '08/31/2006'
and	Credito = '1.1.02.001.0001.0001'
Order by CLanca.DEBITO, CLanca.CodCCusto
compute sum(Valor)
*/