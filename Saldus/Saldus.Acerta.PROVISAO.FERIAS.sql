declare @Funcionario as varchar(250);
declare @NovoValor as money;


Set @Funcionario = 'WILLIAM EARL BUSH'
set @NovoValor = 66.84



UPDATE CPARTIDA 
	SET VALOR = @NovoValor
where
	CPARTIDA.COMPLEMENTO like '%'+ @Funcionario +'%' and DATA = '08/29/2014' and CODHISTP = 153


UPDATE CRATEIOLC
SET VLRDEBITO = @NovoValor
where 
	CRATEIOLC.IDPARTIDA in ( select IDPARTIDA from CPARTIDA where CPARTIDA.COMPLEMENTO like '%'+ @Funcionario +'%' and DATA = '08/29/2014' and CODHISTP = 153)


select
	IDPARTIDA, IDLANCAMENTO, LCTREF, DATA,	DEBITO, CREDITO, VALOR, COMPLEMENTO
from 
	CPARTIDA
where
	CPARTIDA.COMPLEMENTO like '%'+ @Funcionario +'%' and DATA = '08/29/2014' and CODHISTP = 153

select 
	LCTREF, DATA, CODCONTA, CODGERENCIAL, VLRDEBITO, VLRCREDITO	
from 
	CRATEIOLC
where 
	CRATEIOLC.IDPARTIDA in ( select IDPARTIDA from CPARTIDA where CPARTIDA.COMPLEMENTO like '%'+ @Funcionario +'%' and DATA = '08/29/2014' and CODHISTP = 153)
