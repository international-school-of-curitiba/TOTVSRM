Select 
	IDPARTIDA, IDLANCAMENTO, DATA, VALOR,
	(SELECT SUM(CRATEIOLC.VLRDEBITO) FROM CRATEIOLC WHERE CRATEIOLC.IDPARTIDA = CPARTIDA.IDPARTIDA) 
from 
	CPARTIDA
where
	CPARTIDA.DATA between '10/01/2015' and '10/31/2015'
and CPARTIDA.DEBITO in (Select CCONTA.CODCONTA from CCONTA where CCONTA.RATEIO = 1) 



Select 
	IDPARTIDA, IDLANCAMENTO, DATA, VALOR,
	(SELECT SUM(CRATEIOLC.VLRCREDITO) FROM CRATEIOLC WHERE CRATEIOLC.IDPARTIDA = CPARTIDA.IDPARTIDA) 
from 
	CPARTIDA
where
	CPARTIDA.DATA between '10/01/2015' and '10/31/2015'
and CPARTIDA.CREDITO in (Select CCONTA.CODCONTA from CCONTA where CCONTA.RATEIO = 1) 



--rateio sem lct
Select * from CRateioLC where 
data >= '10/01/2015' and Data <= '10/31/2015'
and CODCONTA >= '4'
and CRATEIOLC.LCTREF not in (

Select LCTREF from 
CPARTIDA where data >= '10/01/2015' and Data <= '10/31/2015'
and ((DEBITO between '4' and '5') or (Credito between '4' and '5') ))



-- lct sem rateio
select * from CPARTIDA
where data >= '09/01/2015' and Data <= '10/31/2015'
and ((DEBITO between '4' and '5') or (Credito between '4' and '5') )
and lctref not in(
Select LCTREF from CRateioLC where 
data >= '09/01/2015' and Data <= '10/31/2015'
and CODCONTA >= '4')
