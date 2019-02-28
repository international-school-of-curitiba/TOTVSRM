Select 
	distinct MatAluno, 
	(Select A_NomeReduzido from Eacompl where Eacompl.Matricula = UMatAlun.Mataluno),
	CodTur 
from UMatAlun
where PerLetivo = '08/09'
and CodTur = 'Toddler A'

Select 
	distinct UMatAlun.MatAluno as MatAluno$$, 
	(Select A_NomeReduzido from Eacompl where Eacompl.Matricula = UMatAlun.Mataluno),
        UMatAlun.CodTur,
        Photo
from UMatAlun
Inner Join isc.dbo.report_card_photo Photo (NoLock) on (Photo.Matricula = UMatAlun.MatAluno and Photo.PerLetivo = UMatAlun.PerLetivo and Photo.CodEtp = '1')
where UMatAlun.PerLetivo ='08/09'
and UMatAlun.CodTur ='Toddler A'
and UMatAlun.MatAluno like '%'


Select Photo 
from isc.dbo.report_card_photo Photo
where Photo.Matricula = 00646
and Photo.CodEtp = '1'

Select 
	RCecc.CodMat,
	UMaterias.Materia as Subject,
	(Select Apelido from PPessoa where PPessoa.Codigo = EProfes.CodPessoa) as Teacher,
	Comment 
from isc.dbo.report_card_ecc as RCecc
Inner Join UMaterias (NoLock) on (UMaterias.CodMat = RCecc.CodMat)
inner join UProfMatTurma UPMT (NoLock) on (UPMT.CodMat = RCecc.CodMat and UPMT.CodTur = RCecc.CodTur and UPMT.CodPerLet = RCecc.PerLetivo and UPMT.TipoProf = 'T')
Inner Join Eprofes (NoLock) on (EProfes.CodProf = UPMT.CodProf)
where RCecc.PerLetivo = '08/09'
and RCecc.CodEtp = 1
and RCecc.Matricula = 00646
Order by UMaterias.PosHist, RCecc.CodMat