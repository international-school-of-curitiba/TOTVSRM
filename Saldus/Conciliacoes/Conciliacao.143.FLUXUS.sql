Select 
	IDLAN,
	CODCFO,
	(Select Nome from FCFO where FCFO.CODCFO = Flan.CODCFO) as NOME,
	VALORORIGINAL,
	DATABAIXA, *
from 
	FLAN
Where
	Flan.databaixa between '11/01/2015' and '11/30/2015'
and Flan.PagRec = 1
and Flan.CODTDO = '000044'
and FLAN.CLASSIFICACAO != 8
	
union 

Select 
	IDLAN,
	CODCFO,
	(Select Nome from FCFO where FCFO.CODCFO = Flan.CODCFO)as NOME,
	VALORORIGINAL,
	DATABAIXA, *
from 
	FLAN
Where
	Flan.databaixa between '11/01/2015' and '11/30/2015'
and Flan.DATABAIXA < Flan.DATAVENCIMENTO								
and (DATEPART(YY,Flan.DATABAIXA) <= DATEPART(YY,Flan.DATAVENCIMENTO) and DATEPART(MM,Flan.DATABAIXA) < DATEPART(MM,Flan.DATAVENCIMENTO))
and Flan.PagRec = 1
and NFOUDUP != 2
and FLAN.CLASSIFICACAO != 8
Order By
	NOME, Flan.DATABAIXA
compute sum(VALORORIGINAL)


Select 
	FLAN.IDLAN,
	FLAN.CODCFO,
	(Select Nome from FCFO where FCFO.CODCFO = Flan.CODCFO)as NOME,
	FLAN.VALORADIANTAMENTO,
	FLAN.DATABAIXA
from 
	FLAN
Where
	Flan.databaixa between '11/01/2015' and '11/30/2015'
and Flan.PagRec = 1
and Flan.VALORADIANTAMENTO > 0
and FLAN.CLASSIFICACAO != 8

Union 

Select 
	FLAN.IDLAN,
	FLAN.CODCFO,
	(Select Nome from FCFO where FCFO.CODCFO = Flan.CODCFO)as NOME,
	FLAN.VALORORIGINAL,
	FLAN.DATABAIXA
from 
	FLAN
	Inner Join FLANCONT (NoLock) on (FLANCONT.IDLAN = FLAN.IDLAN and FLANCONT.TIPO = 1 and FLANCONT.CODCONTA = '2.1.01.004.0001.0001')
Where
	Flan.databaixa between '11/01/2015' and '11/30/2015'
and Flan.PagRec = 2
and Flan.CODTDO = '000093'
and FLAN.CLASSIFICACAO != 8
Order By
	NOME, Flan.DATABAIXA


Compute sum(VALORADIANTAMENTO)