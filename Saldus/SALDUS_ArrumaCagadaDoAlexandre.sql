
/* Para contas de Credito */
/*
begin tran
--CREDITO
insert into CRateioLC (CodColigada, LCTREF, Data, CodConta, CodGerencial,VlrCredito, CodColConta, CodColGerencial, Codlote)
Select  CodColigada, lctRef, Data, Credito, CodCCusto, Valor, 1,1,codlote from ClctLote
where codlote = 1300 and Codccusto is not null and Data >= '07/01/2008' and data <='07/31/2008'
and lctref not in (Select lctref from CRateioLC where codlote =1300) and Credito is not null
commit

DEBITO

insert into CRateioLC (CodColigada, LCTREF, Data, CodConta, CodGerencial,VlrCredito, CodColConta, CodColGerencial, Codlote)
Select  CodColigada, lctRef, Data, DEBITO, CodCCusto, Valor, 1,1,codlote from ClctLote
where codlote = 1300 and Codccusto is not null and Data >= '07/01/2008' and data <='07/31/2008'
and lctref not in (Select lctref from CRateioLC where codlote =1300) and DEBITO is not null

*/

Select top 10 CodColigada, LCTREF, Data, CodConta, CodGerencial,VlrCredito, CodColConta, CodColGerencial, Codlote from CRateioLC
--insert into CRateioLC (CodColigada, LCTREF, Data, CodConta, CodGerencial,VlrCredito, CodColConta, CodColGerencial, Codlote)
Select  CodColigada, lctRef, Data, Credito, CodCCusto, Valor, 1,1,codlote from ClctLote
where codlote = 1300 and Codccusto is not null and Data >= '07/01/2008' and data <='07/31/2008'
and lctref not in (Select lctref from CRateioLC where codlote =1300) and Credito is not null

Select  * from ClctLote
where codlote = 1300 and Codccusto is not null and Data >= '07/01/2008' and data <='07/31/2008'
and lctref not in (Select lctref from CRateioLC where codlote =1300)

Select CodConta, Debito, Credito, * from CRateioLc, ClCtlote  where 
CRateioLc.Lctref = CLCtlote.LCTRef and
CRateioLc.CodLote = CLCtlote.CodLote and
CRateioLc.codlote =1301

Update CRateioLc
Set  VLRDebito = null
from CRateioLc, ClCtlote  where 
CRateioLc.Lctref = CLCtlote.LCTRef and
CRateioLc.CodLote = CLCtlote.CodLote and
CRateioLc.codlote =1301
and VLRCREDITO = '0.00'


Select CodConta ,Credito,*
from CRateioLc, ClCtlote  where 
CRateioLc.Lctref = CLCtlote.LCTRef and
CRateioLc.CodLote = CLCtlote.CodLote and
CRateioLc.codlote =1301


and lctref in (Select lctref from CLCtLote where codlote =1301)