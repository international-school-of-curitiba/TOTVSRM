/* ATUALIZA AS DATAS DOS RATEIOS IGUAL AS DATAS DO LANCAMENTO */ 

update 
	CRateiolc 
set 	
	CRateiolc.data = clanca.data 
FROM 	clanca 
	inner join CRateiolc on (Clanca.LCTREF = CRateiolc.LCTREF)
where clanca.data <> CRateiolc.data
