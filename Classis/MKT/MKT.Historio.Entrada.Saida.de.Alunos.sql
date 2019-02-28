select 
	Count(UMatricpl.MatAluno) as Total,
	UTABTIPO.Descricao,
	UMATRICPL.CODCUR, UMATRICPL.CODPER
	 
from UMATRICPL
inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
inner join EALUNOS (NoLock) on (EALUNOS.Matricula = UMatricpl.MatAluno)
inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
inner join UTABTIPO (NoLock) on (EALUNOS.TIPOALUNO = UTABTIPO.CODTIPO)
where UMATRICPL.PERLETIVO ='12/13'
and (UMATRICPL.STATUS in ('02','03','14','04','01','07','06') or (select Top 1 STATUS from UALUCURSO where UALUCURSO.MATALUNO = UMatricpl.MatAluno order by CODCUR desc, CODPER desc, GRADE desc) in ('02','03','14','06'))
and (A_DATASAIDAISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
or  A_LEFTISC_2 >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
and (A_DATASAIDAISC between '12/01/2012' and '12/31/2012'
or A_LEFTISC_2 between '12/01/2012' and '12/31/2012')
group by UTABTIPO.Descricao , 	UMATRICPL.CODCUR, UMATRICPL.CODPER
order by 	UMATRICPL.CODCUR, UMATRICPL.CODPER