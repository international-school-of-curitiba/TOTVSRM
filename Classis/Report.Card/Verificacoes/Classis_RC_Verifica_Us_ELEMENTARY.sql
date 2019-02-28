Select CodTur, Count(*)
from UMatAlun
where Perletivo = '06/07'
and codmat in (Select codmat from UMaterias where Segundonome ='US')
and C2 = 'U'
Group by CodTur