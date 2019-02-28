select 
	IDFAT, 
	DATAVENCIMENTO, 
	VALORORIGINAL, VALORADIANTAMENTO,
	DATEDIFF(DD,DATAVENCIMENTO, '10/01/2012')AS DD_ATRASADO,
	Round((VALORORIGINAL - VALORADIANTAMENTO) * 0.02, 2) AS MULTA,
	Round((VALORORIGINAL - VALORADIANTAMENTO) * 0.00033, 2) * DATEDIFF(DD,DATAVENCIMENTO, '10/01/2012') AS Juros,
	STATUSLAN, NFOUDUP from FLAN 
where	
	FLAN.CODCFO = 'C01045'
AND FLAN.STATUSLAN != 1
AND FLAN.NFOUDUP = 2
AND DATAVENCIMENTO <= '10/01/2012'
 