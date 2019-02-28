/* Contas que contem rateio */
Select CodConta from CConta where rateio = '1'  

select * from crateiolc where CodLote = '91204'



/* Contas Debito que contem Rateio */
Select * from CLCTLOTE 
where CodLote = '91204' 
and Debito in (Select CodConta from CConta where rateio = '1')  -- Contas que contem rateio


/* Contas Credito que contem Rateio */
Select * from CLCTLOTE 
where CodLote = '91204' 
and Credito in (Select CodConta from CConta where rateio = '1')



/*
Select CodColigada, Lctref, Data, CodConta, CodGerencial, 
	VlrCredito, Codlote, CodColGerencial, CodColconta 
from Crateiolc where codlote = '91204'


Select CodColigada, LCTREF, Data, Credito, 
	'1.01.01.01.01', Valor, codlote, 1, 1
from CLCTLOTE where CLCTLOTE.Credito = '3.1.01.001.0001.0001'

*/ 

insert into CRateioLC 
	(CodColigada, 	Lctref, Data, CodConta, CodGerencial, VlrCredito, Codlote, CodColGerencial, CodColconta)
Select  CodColigada, 	LCTREF, Data, Credito, '1.01.01.01.01', Valor, codlote, 1, 1
	from CLCTLOTE where CLCTLOTE.Credito = '3.1.01.001.0001.0001' 
	and LCTREF not in (select LCTREF from crateiolc where codlote = 91204)

insert into CRateioLC 
	(CodColigada, 	Lctref, Data, CodConta, CodGerencial, VlrCredito, Codlote, CodColGerencial, CodColconta)
Select  CodColigada, 	LCTREF, Data, Credito, '1.01.01.01.02', Valor, codlote, 1, 1
	from CLCTLOTE where CLCTLOTE.Credito = '3.1.01.001.0003.0004' 
	and LCTREF not in (select LCTREF from crateiolc where codlote = 91204)

/*
select * from crateiolc
--delete crateiolc
where
codcoligada = 1
and lctref = 1
and codconta = '3.1.01.001.0001.0001'
and codgerencial = '1.01.01.01.01'
and codlote = 91204

*/

