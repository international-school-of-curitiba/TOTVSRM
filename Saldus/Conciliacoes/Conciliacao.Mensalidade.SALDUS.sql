Select 
	LCTREF, DATA, COMPLEMENTO, valor 
from CLANCA 
where 
	Credito = '1.1.02.001.0001.0001'
and DATA between '01/01/2011' and '01/31/2011'
Order by Valor
compute sum(valor)