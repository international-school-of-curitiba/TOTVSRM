DECLARE @codcontaInicial as Varchar(40), @codcontaFinal as Varchar(40), @descricao as varchar(255)
Declare @dataInicial as date, @dataFinal as date

Set @dataInicial = '01-01-2017'
Set @dataFinal = '12-31-2017'

/*Cursor DRE*/

DECLARE contas CURSOR
	LOCAL
	FOR 
			Select DESCRICAO, CodConta, CodConta +'.9999' 
			from CConta Where Reduzido
			in ('267','374','477','490')
		
-- Abrir o Cursos para leitura
OPEN contas
-- Lendo a próxima linha
FETCH NEXT FROM contas INTO @descricao ,@codcontaInicial, @codcontaFinal

--Percorrendo o cursor
WHILE @@FETCH_STATUS = 0
BEGIN
	Select Top 1 @descricao, 
   Case when (
	Isnull((select Sum(Valor) from CLanca where Clanca.Debito  >= @codcontaInicial and Clanca.Debito  <= @codcontaFinal and Clanca.Data >= @dataInicial and Clanca.Data <= @dataFinal and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0) -		
	Isnull((Select Sum(Valor) from CLanca where Clanca.Credito >= @codcontaInicial and Clanca.Credito <= @codcontaFinal and Clanca.Data >= @dataInicial and Clanca.Data <= @dataFinal and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0)) = 0 then null 
   else 
	- (Isnull((select Sum(Valor) from CLanca where Clanca.Debito  >= @codcontaInicial and Clanca.Debito  <= @codcontaFinal and Clanca.Data >= @dataInicial and Clanca.Data <= @dataFinal and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0) -		
	Isnull((Select Sum(Valor) from CLanca where Clanca.Credito >= @codcontaInicial and Clanca.Credito <= @codcontaFinal and Clanca.Data >= @dataInicial and Clanca.Data <= @dataFinal and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0)) 
	end	
	from  CConta
	--Lendo a próxima linha
	FETCH NEXT FROM contas INTO @descricao, @codcontaInicial, @codcontaFinal
END

CLOSE contas
DEALLOCATE contas

/*
Select Top 1 
   Case when (
	Isnull((select Sum(Valor) from CLanca where Clanca.Debito  >= :Espelho#3 and Clanca.Debito  <= :Espelho#4 and Clanca.Data >= :DATA_INICIO and Clanca.Data <= :DATA_FIM and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0) -		
	Isnull((Select Sum(Valor) from CLanca where Clanca.Credito >= :Espelho#3 and Clanca.Credito <= :Espelho#4 and Clanca.Data >= :DATA_INICIO and Clanca.Data <= :DATA_FIM and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0)) = 0 then null 
   else 
	- (Isnull((select Sum(Valor) from CLanca where Clanca.Debito  >= :Espelho#3 and Clanca.Debito  <= :Espelho#4 and Clanca.Data >= :DATA_INICIO and Clanca.Data <= :DATA_FIM and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0) -		
	Isnull((Select Sum(Valor) from CLanca where Clanca.Credito >= :Espelho#3 and Clanca.Credito <= :Espelho#4 and Clanca.Data >= :DATA_INICIO and Clanca.Data <= :DATA_FIM and CodHistp not in (select CodHistp from Chistp where HistFecha = 1)), 0)) 
  end	
from  CConta
*/