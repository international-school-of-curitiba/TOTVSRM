select 
	Upper(Substring(SUBSTRING(PPessoa.Email, 0, (LEN(PPessoa.Email)- (PATINDEX('%@%', REVERSE(PPessoa.Email))-1))), (PATINDEX('%.%', PPessoa.Email) +1 ), PATINDEX('%.%', REVERSE(SUBSTRING(PPessoa.Email, 0, (LEN(PPessoa.Email)- (PATINDEX('%@%', REVERSE(PPessoa.Email))-1)))))-1)) as Last_Name,
	Upper(Substring(SUBSTRING(PPessoa.Email, 0, (LEN(PPessoa.Email)- (PATINDEX('%@%', REVERSE(PPessoa.Email))-1))), 0 ,(PATINDEX('%.%', PPessoa.Email)))) AS FIRST_NAME,
	PPessoa.Email as Email,
	(Select Materia from UMaterias UMat where UMat.CodMat = UprofMatturma.Codmat) as Course,
	UprofMatturma.CodTur as Grade,
	substring(codmat, 1,1) as CodCur,
	substring(codmat, 3,1) as CodPer
from UprofMatturma
join EProfes (NoLock) on (EProfes.CodProf = UProfMatturma.CodProf)
join PPessoa (NoLock) on ( PPessoa.Codigo=EProfes.Codpessoa)
join PFunc (NoLock) on (PFunc.CodPessoa = PPessoa.Codigo)
where UprofMatturma.CODPERLET = '08/09'
and Codsituacao != 'D'
order by Last_Name