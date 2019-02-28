select Sum(Valor) from CLanca 
		where Clanca.Debito  >= '4.1.02' and Clanca.Debito  <= '4.1.02.9999' 
		and Clanca.Data >= '09/01/2006' and Clanca.Data <= '09/30/2006'

Select sum(valor) from CLanca 
        where Clanca.Credito >= '4.1.02' and Clanca.Credito <= '4.1.03.9999' 
        and Clanca.Data >= '08/01/2006' and Clanca.Data <= '09/30/2006'

Select sum(vlrDebito) from CRateioLC where 
			CodConta >= '4.1.02' and CodConta <= '4.1.03.9999'
			and data >= '08/01/2006' and Data <= '09/30/2006'

Select sum(vlrCredito) from CRateioLC where 
			CodConta >= '4.1.02' and CodConta <= '4.1.03.9999'
			and data >= '08/01/2006' and Data <= '09/30/2006'