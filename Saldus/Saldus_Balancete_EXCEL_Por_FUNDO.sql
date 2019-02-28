Declare @BeginDate nvarchar(10);
Declare @EndDate nvarchar(10);
Declare @Account nvarchar(10);

Set @BeginDate = '08/01/2007'
Set @EndDate = '04/30/2008'
Set @Account = '489'

Select 
	 '1 & 2'as Fundo,
	CConta.CodConta, Reduzido, Descricao, 
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate) as SaldoAnt, 	
	
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Debito, 	

	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Credito, 		

	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)) 
	+ 
	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)  	
	-
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '11' or substring(GCCusto.CodReduzido,1,2) = '22')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)) as Saldo_Atual 		
from 
	CConta
Where 	CConta.Analitica = '1' and CodConta in (Select CodConta from CConta where rateio = 1)
AND REDUZIDO like  @Account 

UNION -- '3 & 4' as Fundo,

Select 
	'3 & 4' as Fundo,
	CConta.CodConta, Reduzido, Descricao, 
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate) as SaldoAnt, 	
	
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Debito, 	

	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Credito, 		

	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)) 
	+ 
	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)  	
	-
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '31' or substring(GCCusto.CodReduzido,1,2) = '32'
		or substring(GCCusto.CodReduzido,1,2) = '41' or substring(GCCusto.CodReduzido,1,2) = '42')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)) as Saldo_Atual 	
from 
	CConta
Where 	CConta.Analitica = '1' and CodConta in (Select CodConta from CConta where rateio = 1)
AND REDUZIDO like  @Account 
 
UNION -- '7'

Select 
	 '7'as Fundo,
	CConta.CodConta, Reduzido, Descricao, 
(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate) as SaldoAnt, 	
	
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Debito, 	

	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Credito, 		

	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)) 
	+ 
	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)  	
	-
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '71' or substring(GCCusto.CodReduzido,1,2) = '72')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)) as Saldo_Atual 		
from 
	CConta
Where 	CConta.Analitica = '1' and CodConta in (Select CodConta from CConta where rateio = 1)
AND REDUZIDO like  @Account 

UNION -- '8'

Select 
	 '8' as Fundo,
	CConta.CodConta, Reduzido, Descricao, 
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate) as SaldoAnt, 	
	
	(Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Debito, 	

	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate) as Credito, 		

	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)
	- 
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data < @BeginDate)) 
	+ 
	((Select IsNull(sum(vlrdebito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)  	
	-
	(Select IsNull(sum(vlrcredito),0) from CRateioLC
	Join GCcusto (NoLock) on (CRateioLC.CodGerencial = GCcusto.CODCCUSTO)
	where (substring(GCCusto.CodReduzido,1,2) = '81' or substring(GCCusto.CodReduzido,1,2) = '82')
    and	CRateioLC.CodConta = CConta.CodConta and CRateioLC.Data >= @BeginDate and CRateioLC.Data <= @EndDate)) as Saldo_Atual 		
from 
	CConta
Where 	CConta.Analitica = '1' and CodConta in (Select CodConta from CConta where rateio = 1)
AND REDUZIDO like  @Account 

UNION -- 'TOTAL'

Select 'Total' as Fundo,
	CConta.CodConta, Reduzido, Descricao, 
	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < @BeginDate ) - 		
	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < @BeginDate) as SaldoAnt, 			

	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @BeginDate and Clanca.Data <= @EndDate) as Debito, 		

	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @BeginDate and Clanca.Data <= @EndDate) as Credito, 		

   ((Select isnull(Sum(Valor), 0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data < @BeginDate ) - 		
	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data < @BeginDate))
	+	
	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Debito = CConta.CodConta and Clanca.Data >= @BeginDate and Clanca.Data <= @EndDate) -
	(Select isnull(Sum(Valor), 0) from CLanca where Clanca.Credito = CConta.CodConta and Clanca.Data >= @BeginDate and Clanca.Data <= @EndDate)
	
	as Saldo_Atual 		
from 
	CConta
Where 	CConta.Analitica = '1'  and CodConta in (Select CodConta from CConta where rateio = 1)
AND REDUZIDO like  @Account 
order by reduzido

