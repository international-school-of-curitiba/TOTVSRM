
Select distinct 
'(Select Sum(VLRDebito) - Sum(VLRCredito) from CRateiolc where CRateiolc.CodConta = CConta.CodConta and CRateiolc.Data >= *08/01/2006* and CRateiolc.Data  <= *07/31/2007*  and CRateiolc.CodGerencial = *' + CodGerencial +'*) as *'+GCCusto.CodReduzido +'*,'
from CRateioLC
inner Join GCCusto on (CRateioLC.CodGerencial = GCCusto.CodCCusto)
Where CRateioLC.data >= '08/01/2006' and CRateioLC.data <='07/31/2007' 
and Substring(GCCusto.CodReduzido,3,1) = 'A'


Select 
	CConta.CodConta, CConta.Reduzido,
	CConta.Descricao,
	(Select Sum(VLRDebito) - Sum(VLRCredito) from CRateiolc where CRateiolc.CodConta = CConta.CodConta and CRateiolc.Data >= '08/01/2006' and CRateiolc.Data  <='07/31/2007'  and CRateiolc.CodGerencial = '1.01.01.01.01') as '11IH'
From 	CConta 
Where	CConta.Analitica = '1'
Order by  CodConta
