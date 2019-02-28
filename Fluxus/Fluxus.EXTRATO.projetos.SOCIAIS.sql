
Select top 1
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '2.1.01.005.0001.0032' and Clanca.Data < '08/01/2012') --and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
-	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '2.1.01.005.0001.0032' and Clanca.Data < '08/01/2012') --and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
,
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='2.1.01.005.0001.0032' and Clanca.Data >= '08/01/2012' and Clanca.Data <= '08/31/2012' and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) ,		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '2.1.01.005.0001.0032' and Clanca.Data >= '08/01/2012' and Clanca.Data <= '08/31/2012' and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as PTA
	
from 
	GLOGIN
	
	
Select codcfo ,HISTORICO, VALORBAIXADO * -1 from FLAN where
CODTDO = '000145'
and DATABAIXA between '08/01/2012' and '08/31/2012'
and PAGREC = 1


Select codcfo ,HISTORICO, VALORBAIXADO from FLAN where
CODTDO = '000145'
and DATABAIXA between '08/01/2012' and '08/31/2012'
and PAGREC = 2