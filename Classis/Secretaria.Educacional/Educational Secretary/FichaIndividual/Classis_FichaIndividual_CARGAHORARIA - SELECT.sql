Select 
	UmatAlun.Perletivo,
	UmatAlun.CodMat,
	UGrade.CargaHoraria,
	cast(Round(UGrade.CargaHoraria * 0.2450,0) as int) AD1,
	AD1,
	Case 
		when UGrade.CargaHoraria = 160 then 43 
		when UGrade.CargaHoraria = 200 then 54
		else cast(Round(UGrade.CargaHoraria * 0.2750,0) as int) 
	end as AD2,
	AD2, 
	Case 
		when UGrade.CargaHoraria = 200 then 51 
		when UGrade.CargaHoraria = 160 then 41
		when UGrade.CargaHoraria = 120 then 31
		when UGrade.CargaHoraria = 80 then 21
		when UGrade.CargaHoraria = 40 then 10
	end as AD6,
	AD6,
	Case 
		when UGrade.CargaHoraria = 200 then 46 
		when UGrade.CargaHoraria = 160 then 37
		when UGrade.CargaHoraria = 120 then 27
		when UGrade.CargaHoraria = 80 then 17
		when UGrade.CargaHoraria = 40 then 09
	end as AD7,
	AD7
from UmatAlun, UGrade
where Perletivo = '09/10'
and UMatAlun.CodMat = UGrade.CodMat
and UGrade.CargaHoraria is not null

