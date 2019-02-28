

Select 
	CodMat,
	(Select Materia from UMaterias where UMaterias.CodMat = UGrade.CodMat) as Nome,
	CodMatG, 
	Case 
		When CodCur = 1 and CodPer = 1 and Periodo = 1 then 'Toddler'
		When CodCur = 1 and CodPer = 1 and Periodo = 2 then 'Nursery'
		When CodCur = 1 and CodPer = 1 and Periodo = 3 then 'Pre-K'
		When CodCur = 1 and CodPer = 1 and Periodo = 4 then 'Kinder'
		When CodCur = 2 and CodPer = 1 and Periodo = 1 then 'Grade 1'
		When CodCur = 2 and CodPer = 1 and Periodo = 2 then 'Grade 2'
		When CodCur = 2 and CodPer = 1 and Periodo = 3 then 'Grade 3'
		When CodCur = 2 and CodPer = 1 and Periodo = 4 then 'Grade 4'
		When CodCur = 2 and CodPer = 1 and Periodo = 5 then 'Grade 5'
		When CodCur = 2 and CodPer = 2 and Periodo = 6 then 'Grade 6'
		When CodCur = 2 and CodPer = 2 and Periodo = 7 then 'Grade 7'
		When CodCur = 2 and CodPer = 2 and Periodo = 8 then 'Grade 8'
		When CodCur = 3 and CodPer = 1 and Periodo = 9 then 'Grade 9'
		When CodCur = 3 and CodPer = 1 and Periodo = 10 then 'Grade 10'
		When CodCur = 3 and CodPer = 1 and Periodo = 11 then 'Grade 11'
		When CodCur = 3 and CodPer = 1 and Periodo = 12 then 'Grade 12'
	end
from UGrade
where CodMatG is not null
order By CodMat