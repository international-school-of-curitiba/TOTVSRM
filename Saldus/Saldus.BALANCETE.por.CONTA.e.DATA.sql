Declare @EndDate nvarchar(10);

Set @EndDate = '03/03/2012'


Select 
	CConta.CodConta, Descricao, Reduzido, @EndDate,
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < @EndDate) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < @EndDate ) as SaldoAnt, 		

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Debito, 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Credito, 		

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Movimentacao, 		

	((Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < @EndDate) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < @EndDate ) ) +		

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @EndDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as saldofinal 		
from 
	CConta
WHERE CODCONTA = '1.1.01.001.0001.0002'
order by CODCONTA
--Where 	CConta.Analitica = '1' 