Select
	A2 = null,
	c2 = null,	
	A6 = null,
	c6 = null,
	A7 = null,
	c7 = null
From	UMatAlun
Where
	Perletivo = '06/07'

	
Update 
	UMatAlun
set
	A2 = null,
	c2 = null,	
	A6 = null,
	c6 = null,
	A7 = null,
	c7 = null
Where
	Perletivo = '06/07'



Update
	EAlunoTPR
Set	
	p1 = null, p2 = null, p3 = null, p4 = null, p5 = null,
	p6 = null, p7 = null, p8 = null, p9 = null, p10 = null,
	p11 = null, p12 = null, p13 = null, p14 = null, p15 = null,
	p16 = null, p17 = null,  p18 = null, p19 = null, p20 = null 
Where
	Perletivo = '06/07'
and CodEtp <> '1'

	
Select * from EAlunoTPR where p1 is not null