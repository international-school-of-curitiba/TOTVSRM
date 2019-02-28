

Select Distinct 
	CODCUR, 
	CODPER,
	Case 
		when CODCUR = 1 and CODPER = 1 then 'ECC'
		when CODCUR = 2 and CODPER = 1 then 'ELEM'
		when CODCUR = 2 and CODPER = 2 then 'MS'
		when CODCUR = 3 and CODPER = 1 then 'HS'
	end as Division,

	(Select sum(valor1) From
		EDESCLAN inner join EACOMPL (Nolock) on (EACOMPL.MATRICULA = EDESCLAN.MATALUNO)
	where
		EACOMPL.A_DATAENTRADAISC > (select AugustBegin from Z_SchoolCalendar where CodPerlet = '14/15')
	And EDESCLAN.MATALUNO not in (Select Distinct MATALUNO from UMATRICPL where PERLETIVO < '14/15')
	and EDESCLAN.TIPOLANC = 1
	and EDESCLAN.CODCUR = UMATRICPL.CODCUR
	and EDESCLAN.CODPER = UMATRICPL.CODPER
	Group by Codcur, CODPER, TIPOLANC
	) as Anuidade,

		(Select sum(valor1) From
		EDESCLAN inner join EACOMPL (Nolock) on (EACOMPL.MATRICULA = EDESCLAN.MATALUNO)
	where
		EACOMPL.A_DATAENTRADAISC > (select AugustBegin from Z_SchoolCalendar where CodPerlet = '14/15')
	And EDESCLAN.MATALUNO not in (Select Distinct MATALUNO from UMATRICPL where PERLETIVO < '14/15')
	and EDESCLAN.TIPOLANC = 7
	and EDESCLAN.CODCUR = UMATRICPL.CODCUR
	and EDESCLAN.CODPER = UMATRICPL.CODPER
	Group by Codcur, CODPER, TIPOLANC
	) as Fundo,

		(Select sum(valor1) From
		EDESCLAN inner join EACOMPL (Nolock) on (EACOMPL.MATRICULA = EDESCLAN.MATALUNO)
	where
		EACOMPL.A_DATAENTRADAISC >  (select AugustBegin from Z_SchoolCalendar where CodPerlet = '14/15')
	And EDESCLAN.MATALUNO not in (Select Distinct MATALUNO from UMATRICPL where PERLETIVO < '14/15')
	and EDESCLAN.TIPOLANC = 8
	and EDESCLAN.CODCUR = UMATRICPL.CODCUR
	and EDESCLAN.CODPER = UMATRICPL.CODPER
	Group by Codcur, CODPER, TIPOLANC
	) as Reserva


from 
	UMATRICPL 
where 
	PERLETIVO = '14/15'