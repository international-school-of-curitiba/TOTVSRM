Update UmatAlun
set AD1 = (Case 
				when UGrade.CargaHoraria = 200 then 47 
				when UGrade.CargaHoraria = 160 then 38
				when UGrade.CargaHoraria = 120 then 28
				when UGrade.CargaHoraria = 80 then 19
				when UGrade.CargaHoraria = 40 then 9
			end),
	AD2 = (Case 
				when UGrade.CargaHoraria = 200 then 46 
				when UGrade.CargaHoraria = 160 then 37
				when UGrade.CargaHoraria = 120 then 28
				when UGrade.CargaHoraria = 80 then 18
				when UGrade.CargaHoraria = 40 then 9
			end),
	AD6 = (Case 
				when UGrade.CargaHoraria = 200 then 52 
				when UGrade.CargaHoraria = 160 then 42
				when UGrade.CargaHoraria = 120 then 31
				when UGrade.CargaHoraria = 80 then 21
				when UGrade.CargaHoraria = 40 then 10
			end),
	AD7 = (Case 
				when UGrade.CargaHoraria = 200 then 55 
				when UGrade.CargaHoraria = 160 then 44
				when UGrade.CargaHoraria = 120 then 33
				when UGrade.CargaHoraria = 80 then 22
				when UGrade.CargaHoraria = 40 then 11
			end)
from UmatAlun, UGrade
where Perletivo = '09/10'
and UMatAlun.CodMat = UGrade.CodMat
and UGrade.CargaHoraria is not null
and UMatAlun.Status in ('01', '07','04')


