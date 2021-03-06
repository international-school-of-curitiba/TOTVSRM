Select 
	UMATRICPL.MATALUNO,
	(Select nome from EALUNOS where EALUNOS.MATRICULA = UMATRICPL.MATALUNO)as Nome,
	UMATRICPL.PERIODO

from UMATRICPL
where
	UMATRICPL.MATALUNO in (select MATRICULA from EACOMPL where A_ATUALIZACAO is not null)
and UMATRICPL.PERLETIVO = '12/13'
and (UMATRICPL.CODCUR = 2 and CODPER = 2 or CODCUR = 3)
order by PERIODO, Nome
