Select 
	CConta.CodConta,
	CConta.Descricao,
	--ISNULL((Select sum(Valor)from CLanca left join GCCusto (NoLock) on (GCCusto.CodCCusto = CLanca.CodCCusto) where CLanca.Debito = CConta.CodConta and Clanca.Data >='08/01/2006' and CLanca.Data <='08/31/2006' and GCCusto.Codreduzido like '11IE%'), 0) , ISNULL((Select sum(Valor) from CLanca left join GCCusto (NoLock) on (GCCusto.CodCCusto = CLanca.CodCCusto) where CLanca.Credito = CConta.CodConta and Clanca.Data >='08/01/2006' and CLanca.Data <='08/31/2006'), 0) as SFIH --1
	(Select VLRDebito - VLRCredito from CRateiolc left join GCCusto (NoLock) on (GCCusto.CodCCusto = CRateiolc.CodCCusto) where CRateiolc.CodConta = CConta.CodConta and CRateiolc.Data >='08/01/2006' and CRateiolc.Data <='08/31/2006' and GCCusto.Codreduzido like '11IE%')
from 	CConta 
Where	CConta.Analitica = '1'
and	CConta.CodConta = '3.1.01.001.0002.0001'



Select CLanca.CodCCusto, *
from CLanca 
left join GCCusto (NoLock) on (GCCusto.CodCCusto = CLanca.CodCCusto)
where CLanca.Credito = '3.1.01.001.0002.0001' and Clanca.Data >='08/01/2006' and CLanca.Data <='08/31/2006' -- and GCCusto.Codreduzido like '11IE%'



Select sum(VLRDebito - VLRCredito) from CRateiolc left join GCCusto (NoLock) on (GCCusto.CodCCusto = CRateiolc.CodGerencial) where CRateiolc.CodConta = '3.1.01.001.0001.0001' and CRateiolc.Data >='08/01/2006' and CRateiolc.Data <='08/31/2006' and GCCusto.CodReduzido like '11IH%'