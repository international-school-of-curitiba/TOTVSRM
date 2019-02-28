Update UmatAlun
set AD1 = cast(Round(UGrade.CargaHoraria * 0.2450,0) as int),
	AD2 = (Case 
				when UGrade.CargaHoraria = 160 then 43 
				when UGrade.CargaHoraria = 200 then 54
				else cast(Round(UGrade.CargaHoraria * 0.2750,0) as int) 
			end),
	AD6 = (Case 
				when UGrade.CargaHoraria = 200 then 51 
				when UGrade.CargaHoraria = 160 then 41
				when UGrade.CargaHoraria = 120 then 31
				when UGrade.CargaHoraria = 80 then 21
				when UGrade.CargaHoraria = 40 then 10
			end),
	AD7 = (Case 
				when UGrade.CargaHoraria = 200 then 46 
				when UGrade.CargaHoraria = 160 then 37
				when UGrade.CargaHoraria = 120 then 27
				when UGrade.CargaHoraria = 80 then 17
				when UGrade.CargaHoraria = 40 then 09
			end)
from UmatAlun, UGrade
where Perletivo = '06/07'
and UMatAlun.CodMat = UGrade.CodMat
and UGrade.CargaHoraria is not null

