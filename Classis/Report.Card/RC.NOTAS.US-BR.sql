select a1,a2,a6,a7,UMatAlun.status, codmat, UMatAlun.dtaltstsist,UMatricpl.datamat, * from UMatAlun
inner join UMatricpl (NoLock) on (UMatricpl.Perletivo = UMatAlun.Perletivo and UMatricpl.Mataluno= UMatAlun.Mataluno) 
where UMatAlun.Perletivo = '09/10'
and UMatAlun.codcur = 3
and UMatAlun.codper = 1
and (a7 is null or a6 is null or a2 is null or a1 is null)
and len(Codmat)> 6
and UMatAlun.status <> 14
and UMatAlun.status <> 15
/*
select * from UMatAlun where mataluno = '00701' and perletivo = '09/10'


Update UMatAlun 
set f1 = 0
where perletivo = '10/11' and a1 is not null and f1 is null


*/