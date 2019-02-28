Select GRUPO, DESCRICAO from ZDRE WHERE CONTADOGRUPO = 0 and Grupo = 3

Select DISTINCT ContaDoGrupo, DESCRICAO
from ZDRE Where Grupo = 4
And ContadoGrupo <> 0

-- DRE - CUSTO DOS SERVIÇOS PRESTADOS -- 

Select 
CodConta,
CASE WHEN 374 = '374' THEN SUBSTRING(CodConta,1,4) +'03.9999'
ELSE CODCONTA + '.9999' END
from CConta Where Reduzido = 374

select * from CGERENCIA

Select  
	cconta.DESCRICAO, 
--   - sum(ISNULL(VlrDebito, 0) - ISNULL(VlrCredito, 0))
	crateiolc.CODCONTA, cgerencia.DESCRICAO, VLRCREDITO, VLRDEBITO, DATA
 from CRateioLC 
	join CGERENCIA on CGERENCIA.CODCONTA = CRATEIOLC.CODGERENCIAL
	join CCONTA on cconta.CODCONTA = crateiolc.CODCONTA 
 where 
CRateioLC.CODCONTA >= '4.1.01' and CRateioLC.CODCONTA <= '4.1.01.9999'
and (data >= '20170101' and Data <= '20171231')
and ((CodGerencial = '1.01.01.07.05.1000') or (CodGerencial = '1.01.01.07.05.1001')	
or (CodGerencial = '1.01.01.07.01.1000') or (CodGerencial = '1.01.01.07.01.1001')	
or (CodGerencial = '1.01.01.07.02.1000') or (CodGerencial = '1.01.01.07.02.1001') 	
or (CodGerencial = '1.01.01.07.06.1000') or (CodGerencial = '1.01.01.07.06.1001')	
or (CodGerencial = '1.01.01.07.03.1000') or (CodGerencial = '1.01.01.07.03.1001')	
or (CodGerencial = '1.01.01.07.08.1000') or (CodGerencial = '1.01.01.07.08.1001')	
or (CodGerencial = '1.01.01.07.08.1002') or (CodGerencial = '1.01.01.07.08.1003')	
or (CodGerencial = '1.01.01.07.08.1004') or (CodGerencial = '1.01.01.07.11.1000')	
or (CodGerencial = '1.01.01.07.09.1000') or (CodGerencial = '1.01.01.07.07.1000')	
or (CodGerencial = '1.01.01.07.07.1001'))
and codlote = 0
and LCTREF not in (select LctRef from Clanca where CodHistp in (select CodHistp from Chistp where HistFecha = 1))

compute sum(VLRCREDITO)
compute sum(VLRDEBITO)