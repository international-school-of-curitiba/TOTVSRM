Select 
	DATAVENCIMENTO, *
From
	FLAN
where
	FLAN.CODCFO = 'C00750'
and Flan.STATUSLAN = 0
and Flan.DATAVENCIMENTO < '08/01/2011'