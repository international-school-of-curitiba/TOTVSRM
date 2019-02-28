Select 
	UPMT.CodPerLet, UPMT.CodMat ,
	UPMT.CodTur, CodPer, CodCur, UPMT.CodProf, Apelido
from UMatTurma UMT
join UProfMatTurma UPMT (NoLock) on ( UMT.CodPerlet = UPMT.CodPerLet and UMT.CodMat = UPMT.CodMat and UMT.CodTur = UPMT.CodTur) 
join Eprofes (NoLock) on (Eprofes.CodProf = UPMT.CodProf)
join PPessoa (Nolock) on (Eprofes.CodPessoa = PPessoa.codigo)
where UMT.CodPerLet = '09/10'
and TIPOPROF = 'T'
Order by CodCur, CodPer, UPMT.CodTur

