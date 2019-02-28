select distinct 
	DATAVENCIMENTO, STATUSLAN,
	flan.Idlan, 
	flan.CODCFO, (Select NOMEFANTASIA from FCFO where FCFO.CODCFO = FLAN.CODCFO) as Nome,
	Flan. DataBaixa, VALORORIGINAL - VALOROP1,
	 valor, IDFAT,PERLETIVO, PARCELA, NFOUDUP
from Flan 
inner join FLANCONT (NoLock) on (FLANCONT.IDLAN = FLAN.IDLAN)
Where STATUSLAN = 0
and DATAVENCIMENTO between '09/01/2009' and '12/31/2010'
and FLANCONT.CODCONTA = '1.1.02.001.0001.0001'
ORDER BY Nome
compute Sum(Valor)
