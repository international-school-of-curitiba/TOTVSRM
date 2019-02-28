Select distinct
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')) as Total,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 85) as Honor,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 90) as HighHonor,
	'Honor Roll',
	UMAL.MatAluno, 
	(Select A_NomeReduzido from EAcompl where Matricula = UMAL.MatAluno) as name,
    (Select top 1 UMAT2.CODTUR from UMatAlun UMAT2 where UMAT2.MatAluno = UMAL.MatAluno and UMAT2.Perletivo =UMAL.perletivo Group by UMAT2.CodTur Order by count(UMAT2.CodTur) desc) as Grade_Level, 
	UMAL.CodCur, UMAL.CodPer, UMPL.Periodo
from UMatAlun UMAL
inner join  UMatricpl UMPL (NoLock) on (UMPL.Perletivo = UMAL.perletivo and UMPL.MatAluno = UMAL.MatAluno)
where UMAL.perletivo = '08/09'
and (UMAL.codcur = 2 and UMAL.codper = 2 or UMAL.codcur = 3 and UMAL.codper = 1)
and UMAL.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMAL.STATUS in ( '01', '07', '04')
Group by UMAL.PERLETIVO, UMAL.CODCUR, UMAL.CODPER, UMAL.MATALUNO, UMPL.Periodo
having 	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')) <=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 85)
and
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 85) !=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 90)
order by UMAL.CodCur, UMAL.CodPer, UMPL.Periodo, Grade_Level, Name


Select distinct
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')) as Total,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 85) as Honor,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 90) as HighHonor,
	'High Honor Roll',
	UMAL.MatAluno, 
	(Select A_NomeReduzido from EAcompl where Matricula = UMAL.MatAluno) as name,
    (Select top 1 UMAT2.CODTUR from UMatAlun UMAT2 where UMAT2.MatAluno = UMAL.MatAluno and UMAT2.Perletivo =UMAL.perletivo Group by UMAT2.CodTur Order by count(UMAT2.CodTur) desc) as Grade_Level, 
	UMAL.CodCur, UMAL.CodPer, UMPL.Periodo
from UMatAlun UMAL
inner join  UMatricpl UMPL (NoLock) on (UMPL.Perletivo = UMAL.perletivo and UMPL.MatAluno = UMAL.MatAluno)
where UMAL.perletivo = '08/09'
and (UMAL.codcur = 2 and UMAL.codper = 2 or UMAL.codcur = 3 and UMAL.codper = 1)
and UMAL.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMAL.STATUS in ( '01', '07', '04')
Group by UMAL.PERLETIVO, UMAL.CODCUR, UMAL.CODPER, UMAL.MATALUNO, UMPL.Periodo
having 	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')) <=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =:ESPELHO#2 then UMA.a1 when 2 =:ESPELHO#2 then UMA.a2 when 3 =:ESPELHO#2 then UMA.a6 when 4 =:ESPELHO#2 then UMA.a7 else 0 end >= 90)

/*and
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and UMA.a1 >= 85) !=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and UMA.a1 >= 90)
*/
order by UMAL.CodCur, UMAL.CodPer, UMPL.Periodo, Grade_Level, Name


*/