Select Matricula from EAlunos
where Ealunos.RESPONS in 
(Select 
	Distinct FLAN.CODCFO 
from FLAN
where 
	FLAN.PAGREC = 1
and FLAN.NFOUDUP = 2
--and FLAN.CODCFO = 'F02198'
and FLAN.STATUSLAN != 1 
and datepart(YEAR,DATAVENCIMENTO)= '2011')
