

--Declare :#Espelho#1_D nvarchar(10);
Declare @StartDate nvarchar(10);
Declare @EndDate nvarchar(10);

set @StartDate = '09/01/2015'
Set @EndDate = '09/30/2015'


Select 
	CConta.CodConta, Descricao, Reduzido,
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as SaldoAnt, 		

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @StartDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Debito, 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @StartDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Credito, 		

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @StartDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @StartDate and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Movimentacao 		
from 
	CConta
order by CODCONTA
--Where 	CConta.Analitica = '1' 


/*
Declare :#Espelho#1_D nvarchar(10);
Declare @EndDate nvarchar(10);

Set :#Espelho#1_D = '01/31/2011'



Select top 1
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0001' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0001' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0001' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0001' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Anuidade,
	
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0002' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0002' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0002' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0002' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as TaxasEscolares,


	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0003' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0003' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0003' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0003' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Associacao,

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0004' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0004' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0004' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0004' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as ESL,

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0006' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0006' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0006' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0006' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as HorExt,

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0007' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0007' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0007' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0007' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Reserva,

	 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0008' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0008' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0008' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0008' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as ClarineteFlauta,

	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito = '1.1.02.001.0001.0009' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) - 		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0009' and Clanca.Data < :#Espelho#1_D and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) 		
+
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Debito ='1.1.02.001.0001.0009' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) -		
	(Select isnull(Sum(Valor),0) from CLanca where Clanca.Credito = '1.1.02.001.0001.0009' and Clanca.Data >= :#Espelho#1_D and Clanca.Data <= @EndDate and CLANCA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1)) as Avaliacao
from 
	GLOGIN
*/