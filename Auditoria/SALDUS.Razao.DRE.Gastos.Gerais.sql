Select CRATEIOLC.DATA, 
	(Select REDUZIDO + ' - ' + CCONTA.DESCRICAO from CCONTA WHERE CCONTA.CODCONTA = CPARTIDA.CREDITO) AS CONTACREDITO,
	(Select REDUZIDO + ' - ' + CCONTA.DESCRICAO from CCONTA WHERE CCONTA.CODCONTA = CPARTIDA.DEBITO) AS CONTADEBITO,
	(select CODREDUZIDO from GCCUSTO WHERE CRATEIOLC.CODGERENCIAL = GCCUSTO.CODCCUSTO) AS CENTRO ,
CHISTP.DESCRICAO, CPARTIDA.COMPLEMENTO, VlrDebito, VlrCredito from CRateioLC 
inner join CPARTIDA (nolock) on (CPARTIDA.LCTREF = CRATEIOLC.LCTREF)
inner join CHISTP (nolock) on (CHISTP.CodHistp = CPARTIDA.CODHISTP) 
where 
CodConta >= '4.1.02' and CodConta <= '4.1.03.9999'
and CRateioLC.data >= '08/01/2013' and CRateioLC.Data <= '07/31/2014'
and( 
   (CodGerencial >= '1.01.01.01.01.1000' and CodGerencial <= '1.01.01.03.20.9999')
or (CodGerencial >= '1.02.01.01.04.1000' and CodGerencial <= '1.02.01.03.20.9999')
or (CodGerencial >= '1.03.01.01.01.1000' and CodGerencial <= '1.03.01.03.20.9999')
or (CodGerencial >= '1.03.02.01.04.1000' and CodGerencial <= '1.03.02.03.20.9999')
or (CodGerencial >= '1.04.01.01.01.1000' and CodGerencial <= '1.04.01.03.20.9999')
or (CodGerencial >= '1.04.02.01.04.1000' and CodGerencial <= '1.04.02.03.20.9999') 
or (CodGerencial >= '1.05.01.01.01.1000' and CodGerencial <= '1.05.01.03.20.9999')
or (CodGerencial >= '1.05.02.01.04.1000' and CodGerencial <= '1.05.02.03.20.9999')
or (CodGerencial >= '1.06.01.01.01.1000' and CodGerencial <= '1.06.01.03.20.9999')
or (CodGerencial >= '1.06.02.01.04.1000' and CodGerencial <= '1.06.02.03.20.9999')
or (CodGerencial >= '1.07.01.01.01.1000' and CodGerencial <= '1.07.01.03.20.9999')
or (CodGerencial >= '1.07.02.01.04.1000' and CodGerencial <= '1.07.02.03.20.9999')
or (CodGerencial >= '1.08.01.01.01.1000' and CodGerencial <= '1.08.01.03.20.9999')
or (CodGerencial >= '1.08.02.01.04.1000' and CodGerencial <= '1.08.02.03.20.9999')
or (CodGerencial >= '1.06.02.65.60.6000'))
and CRateioLC.CodLote = 0
and CRateioLC.LCTREF not in (select LctRef from Clanca where CodHistp in (select CodHistp from Chistp where HistFecha = 1))
order by crateiolc.DATA