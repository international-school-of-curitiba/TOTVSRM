Select	
	DATA,
	( Select 
	((Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < ISC.dbo.attseccalendar.data) - 		
	 (Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < ISC.dbo.attseccalendar.data ) ) +		
 	 (Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= ISC.dbo.attseccalendar.data and Clanca.Data <= ISC.dbo.attseccalendar.data and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	 (Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= ISC.dbo.attseccalendar.data and Clanca.Data <= ISC.dbo.attseccalendar.data and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as saldofinal 		
from 
	CConta
WHERE CODCONTA = '1.1.01.001.0001.0002')
From
	ISC.dbo.attseccalendar
Where ISC.dbo.attseccalendar.data between '02/29/2012' and '03/01/2012'
Order by ISC.dbo.attseccalendar.data
