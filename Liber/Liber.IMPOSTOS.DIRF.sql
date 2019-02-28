/* Impostos IRFR PJ*/

Select 
	DLAF.DATAEMISSAO,
	DLAF.CODCFO, 
	(Select Nome from FCFO where FCFO.CODCFO = DLAF.CODCFO ) as Fornecedor,
	(Select CGCCFO from FCFO where FCFO.CODCFO = DLAF.CODCFO ) as Cnpj,
	CODTRB, 
	BASETRB, 
	VALORTRB,
	CODRETENCAO
from 
	DTRBLAF 
Inner Join DLAF (NoLock) on (DTRBLAF.IDLAF = DLAF.IDLAF)
Inner Join TITMMOV (Nolock) on (TITMMOV.IDMOV = DLAF.IDMOV)
where 
	CODTRB in ('IRRFPJ')
and DLAF.DATAEMISSAO between '01/01/2016' and '12/31/2016'
and DTRBLAF.VALORTRB > 0
order by DLAF.DATAEMISSAO