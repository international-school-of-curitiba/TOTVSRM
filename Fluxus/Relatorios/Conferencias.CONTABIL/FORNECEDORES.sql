Select 
    TMOV.CODTMV,
	tmov.idmov,
	TMOVCONT.valor
from TMOVCONT
inner join tmov (nolock) on (tmov.IDMOV = TMOVCONT.IDMOV)
where 
	tmov.DATAEMISSAO between '07/01/2015' and '07/31/2015' 
and TMOVCONT.TIPO = 2 and CODCONTA = '2.1.01.001.0001.0001'
order by valor 




