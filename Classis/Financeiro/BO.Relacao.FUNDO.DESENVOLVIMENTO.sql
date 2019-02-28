select	
	Mataluno, NOME, 
	Case 
		When TIPOALUNO = 1 then 'Local'		
		When TIPOALUNO = 2 then 'Temporario'
		When TIPOALUNO = 3 then 'Corpore'
		When TIPOALUNO = 4 then 'Corpore'
		When TIPOALUNO = 5 then 'Staff'
		When TIPOALUNO = 6 then 'Scholarship'
	end as tipo,

		(select EACOMPL.A_DATAENTRADAISC from EACOMPL where EACOMPL.MATRICULA = EALUNOS.MATRICULA)

from 
	UMATRICPL
inner join EALUNOS (Nolock) on (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
where PERLETIVO = '13/14'
and UMATRICPL.STATUS in ('01','07','04','14')
and MATALUNO not in (

select MATALUNO from EDESCLAN where PERLETIVO = '13/14' and TIPOLANC = '7')