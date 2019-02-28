declare @Quarter as varchar
declare @SY as varchar(5)

set @Quarter = '4'
set @SY = '10/11'

Select distinct
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')
and case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else codmat end is not null) as Total,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 85) as Honor,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') 
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 90) as HighHonor,
	@SY, @Quarter,
	'High Honor Roll',
	UMAL.MatAluno, 
	(Select A_NomeReduzido from EAcompl where Matricula = UMAL.MatAluno) as name,
    (Select top 1 UMAT2.CODTUR from UMatAlun UMAT2 where UMAT2.MatAluno = UMAL.MatAluno and UMAT2.Perletivo =UMAL.perletivo Group by UMAT2.CodTur Order by count(UMAT2.CodTur) desc) as Grade_Level, 
	UMAL.CodCur, UMAL.CodPer, UMPL.Periodo
from UMatAlun UMAL
inner join  UMatricpl UMPL (NoLock) on (UMPL.Perletivo = UMAL.perletivo and UMPL.MatAluno = UMAL.MatAluno)
where UMAL.perletivo =@SY
and ((UMAL.codcur = 2 and UMAL.codper = 2) or (UMAL.codcur = 3 and UMAL.codper = 1))
and UMAL.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMAL.STATUS in ( '01', '07', '04')
Group by UMAL.PERLETIVO, UMAL.CODCUR, UMAL.CODPER, UMAL.MATALUNO, UMPL.Periodo
having 	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')
and case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else codmat end is not null) <=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 90)
--order by UMAL.CodCur, UMAL.CodPer, UMPL.Periodo, Grade_Level, Name

Union

Select distinct
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US') and UMA.STATUS in ( '01', '07', '04')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')
and case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else codmat end is not null) as Total,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 85) as Honor,
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04') 
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 90) as HighHonor,
	@SY, @Quarter,
	'Honor Roll',
	UMAL.MatAluno, 
	(Select A_NomeReduzido from EAcompl where Matricula = UMAL.MatAluno) as name,
    (Select top 1 UMAT2.CODTUR from UMatAlun UMAT2 where UMAT2.MatAluno = UMAL.MatAluno and UMAT2.Perletivo =UMAL.perletivo Group by UMAT2.CodTur Order by count(UMAT2.CodTur) desc) as Grade_Level, 
	UMAL.CodCur, UMAL.CodPer, UMPL.Periodo
from UMatAlun UMAL
inner join  UMatricpl UMPL (NoLock) on (UMPL.Perletivo = UMAL.perletivo and UMPL.MatAluno = UMAL.MatAluno)
where UMAL.perletivo =@SY
and (UMAL.codcur = 2 and UMAL.codper = 2 or UMAL.codcur = 3 and UMAL.codper = 1)
and UMAL.codmat in (Select codmat from Umaterias where segundonome = 'US')
and UMAL.STATUS in ( '01', '07', '04')
Group by UMAL.PERLETIVO, UMAL.CODCUR, UMAL.CODPER, UMAL.MATALUNO, UMPL.Periodo
having 	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU')
and case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else codmat end is not null) <=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 85)
and
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04')
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 85) !=
	(Select Count(*) from UMatAlun UMA where UMA.perletivo = UMAL.perletivo
and (UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper or UMA.codcur = UMAL.codcur and UMA.codper = UMAL.codper)
and UMA.MatAluno = UMAL.MatAluno and UMA.codmat in (Select codmat from Umaterias where segundonome = 'US')  and UMA.STATUS in ( '01', '07', '04') 
and UMA.codmat not in ('208WRI','207WRI','206WRI','208REA','207REA','206REA','208SSK','207SSK','206SSK','208LSL','207LSL','206LSL','206ADV', '207ADV', '208ADV','301ADV', '302ADV', '303ADV', '304ADV', '303EES', '304EES', '303CAS', '304CAS','303JSU') and 
case when 1 =@Quarter then UMA.a1 when 2 =@Quarter then UMA.a2 when 3 =@Quarter then UMA.a6 when 4 =@Quarter then UMA.a7 else 0 end >= 90)
order by UMAL.CodCur, UMAL.CodPer, UMPL.Periodo, Grade_Level, Name