Select 
	(Select A_NomeReduzido from Eacompl where Matricula = MataLuno) as Nome$$,
	(Select Materia from UMaterias where UMaterias.CodMat = UMatAlun.CodMat) as Materia,
	CodTur,codmat,
	Case when a6 = 1 then 'Incomplete' else Cast(a6 as varchar) end as '3Quarter'
from UmatAlun
where perletivo = '09/10'
and ((codcur >= 2 and CodPer >=2) or (Codcur > =3))
and a6 <= 65
and CodMat not like ('%ADV')
and CodMat not like ('%REA')
and CodMat not like ('%WRI')
and CodMat not like ('%SSK')
and CodMat not like ('%LSL')
order by CodCur, codPer, CodTur, Nome$$