/* Dasboard Contábil extração de dados -- MELHORAR PARA TROCAR COM A ATUAL --*/
select z_dim_tempo.data, CCONTA.CODCONTA,
	(
		isnull((select sum(VALOR) from CPARTIDA where CPARTIDA.DATA = z_dim_tempo.data AND
		CPARTIDA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1) 
		and CPARTIDA.CREDITO = CCONTA.CODCONTA ),0) -
		isnull((select sum(VALOR) from CPARTIDA where CPARTIDA.DATA = z_dim_tempo.data AND
		CPARTIDA.CODHISTP not in (Select CODHISTP from CHISTP where HISTFECHA = 1) 
		and CPARTIDA.DEBITO = CCONTA.CODCONTA),0)
	) AS MOV_DIARIA
	from  CCONTA
	join dbo.z_dim_tempo on z_dim_tempo.data >= '07/01/2015' and z_dim_tempo.data <= GETDATE()
	JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
where 
	--CCONTA.REDUZIDO IN(202, 267,448,464,426,376,395,401,409,414,437,479,492,487)
	CPCCOMPL.ORCAMENTO = '01' -- AND CCONTA.CODCONTA >= '3' AND CCONTA.CODCONTA < '5'
order by
	dbo.z_dim_tempo.data, cconta.CODCONTA



/*
SELECT * FROM CPARTIDA where CPARTIDA.DATA >= '08-01-2016'
*/