select MATALUNO,
	CODMAT, A1, C1, A2,C2, A3,C3, A4,C4, a5,C5, A6,C6, A7,C7, A8,C8, A9,C9, A10,C10, A0, C0
from
	UMatAlun 
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6
order by MATALUNO



update UMatAlun 
set 
	A3 = Case 
			when A1 IS NOT NULL and A2 IS NOT NULL then (A1+A2)/2
			when A1 IS NOT NULL and A2 IS NULL then A1
			when A1 IS NULL and A2 IS NOT NULL then A2
		End,
	C3 = Case 
			when A3 between 3.6 and 4.00 then 'A'
			when A3 between 2.851 and 3.59 then 'B'
			when A3 between 2.5 and 2.85 then 'C'
			when A3 between 1.7 and 2.49 then 'D'
			when A3 between 0.1 and 1.69 then 'U'
			when A3 = 0 then 'NA'
		 End
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6

GO

update UMatAlun 
set 
	A5 = Case 
			when A4 IS NULL then A3
			when A4 IS NOT NULL then (A3 + A4)/ 2
		End,
		
	C5 = Case 
			when A5 between 3.6 and 4.00 then 'A'
			when A5 between 2.851 and 3.59 then 'B'
			when A5 between 2.5 and 2.85 then 'C'
			when A5 between 1.7 and 2.49 then 'D'
			when A5 between 0.1 and 1.69 then 'U'
			when A5 = 0 then 'NA'
		 End
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6

GO

update UMatAlun 
set 
	A8 = Case 
			when A6 IS NOT NULL and A7 IS NOT NULL then (A6+A7)/2
			when A6 IS NOT NULL and A7 IS NULL then A6
			when A6 IS NULL and A7 IS NOT NULL then A7
		End,
	C8 = Case 
			when A8 between 3.6 and 4.00 then 'A'
			when A8 between 2.851 and 3.59 then 'B'
			when A8 between 2.5 and 2.85 then 'C'
			when A8 between 1.7 and 2.49 then 'D'
			when A8 between 0.1 and 1.69 then 'U'
			when A8 = 0 then 'NA'
		 End
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6

GO

update UMatAlun 
set 
	A10 = Case 
			when A9 IS NULL then A8
			when A9 IS NOT NULL then (A8 + A9)/ 2
		End,
	C10 = Case 
			when A10 between 3.6 and 4.00 then 'A'
			when A10 between 2.851 and 3.59 then 'B'
			when A10 between 2.5 and 2.85 then 'C'
			when A10 between 1.7 and 2.49 then 'D'
			when A10 between 0.1 and 1.69 then 'U'
			when A10 = 0 then 'NA'
		 End
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6

GO

update UMatAlun 
set 
	A0 = Case 
			when A5 IS NOT NULL and A10 IS NOT NULL then (A5+A10)/2
			when A5 IS NOT NULL and A10 IS NULL then A5
			when A5 IS NULL and A10 IS NOT NULL then A10
		End,
	C0 = Case 
			when A0 between 3.6 and 4.00 then 'A'
			when A0 between 2.851 and 3.59 then 'B'
			when A0 between 2.5 and 2.85 then 'C'
			when A0 between 1.7 and 2.49 then 'D'
			when A0 between 0.1 and 1.69 then 'U'
			when A0 = 0 then 'NA'
		 End
where
	Perletivo ='10/11'
and	MatAluno in (select distinct mataluno from UMATALUN where CODCUR = 2 and CODTUR = '1A' and PERLETIVO = '10/11')
and len(CODMAT) > 6

	
update UMatAlun set A1 = null, C1 = null where Perletivo ='10/11' and A1 = 0
update UMatAlun set	A2 = null, C2 = null where Perletivo ='10/11' and A2 = 0
update UMatAlun set A3 = null, C3 = null where Perletivo ='10/11' and A3 = 0
update UMatAlun set	A4 = null, C4 = null where Perletivo ='10/11' and A4 = 0	
update UMatAlun set	A5 = null, C5 = null where Perletivo ='10/11' and A5 = 0	
