SELECT TOP 1
	UMATALUN.A1, UMATALUN.F1, UMATALUN.AD1, UMATALUN.C1,
	UMATALUN.A2, UMATALUN.F2, UMATALUN.AD2, UMATALUN.C2,
	UMATALUN.A3, UMATALUN.F3, UMATALUN.AD3, UMATALUN.C3,
	UMATALUN.A4, UMATALUN.F4, UMATALUN.AD4, UMATALUN.C4,
	UMATALUN.A5, UMATALUN.F5, UMATALUN.AD5, UMATALUN.C5,
	UMATALUN.A6, UMATALUN.F6, UMATALUN.AD6, UMATALUN.C6,
	UMATALUN.A7, UMATALUN.F7, UMATALUN.AD7, UMATALUN.C7,
	UMATALUN.A8, UMATALUN.F8, F8, UMATALUN.AD8, UMATALUN.C8,
	UMATALUN.A9, UMATALUN.F9, UMATALUN.AD9, UMATALUN.C9,
	UMATALUN.A10, UMATALUN.F10, UMATALUN.AD10, UMATALUN.C10,
	UMATALUN.A0, UMATALUN.F0, UMATALUN.AD0, UMATALUN.C0
FROM 
	UMATALUN
	INNER JOIN UGRADE ON (UMATALUN.CODCUR = UGRADE.CODCUR
				AND UMATALUN.CODPER = UGRADE.CODPER
				AND UMATALUN.GRADE = UGRADE.GRADE
				AND UMATALUN.CODMAT = UGRADE.CODMAT)
WHERE
	UMATALUN.PERLETIVO ='09/10'
	AND UMATALUN.MATALUNO ='00143' 
	AND UMATALUN.CODMAT IN 
	(Case 
	     When '301ARTE'='301ARTE'  then (Select TOP 1 Codmat from UmatAlun where Perletivo ='09/10' and status in ('01','07','04') and MATALUNO ='00143'  and CodTur = 'HS_Elective' and A1 is not null)
	     When '302ARTE'='301ARTE'  then (Select TOP 1  Codmat from UmatAlun where Perletivo ='09/10' and status in ('01','07','04') and MATALUNO ='00143'  and CodTur = 'HS_Elective' and A1 is not null)
	     When '303ARTE'='301ARTE'  then (Select TOP 1 Codmat from UmatAlun where Perletivo ='09/10' and status in ('01','07','04') and MATALUNO ='00143'  and CodTur = 'HS_Elective' and A1 is not null)
	     When '303LEME'='301ARTE'  then (Select TOP 1 Codmat from UmatAlun where Perletivo ='09/10' and status in ('01','07','04') and MATALUNO ='00143'  and CodTur = 'HS_Elective' and A1 is not null)
             Else
                 (Select CODMAT from UMATERIAS where MATERIAPAI ='301ARTE'  and CODMAT in (Select Codmat from UmatAlun where Perletivo ='09/10' and status in ('01','07','04') and MATALUNO ='00143' and A1 is not null )) End)
ORDER BY
	UGRADE.ORDEMHIST