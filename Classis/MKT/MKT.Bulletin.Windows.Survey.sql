select 
	PERLETIVO, 	M_WINDOW, M_THEBULLETIN, 
	Case
		When CODCUR = 1 and CODPER = 1 then 'ECC'
		When CODCUR = 2 and CODPER = 1 then 'Elementary'
		When CODCUR = 2 and CODPER = 2 then 'MS'
		When CODCUR = 3 and CODPER = 1 then 'HS'
	end as Division
from 
	UMATRICPLLIVRE
where 
	PERLETIVO = '12/13'
and MATALUNO in (Select MATALUNO from UMATRICPL where UMATRICPL.PERLETIVO = '12/13' and STATUS not in ('09', '18'))


select * from EITEMTLIV where CODTABLIVRE = '28'


Select distinct STATUS from UMATRICPL where UMATRICPL.PERLETIVO = '13/14'