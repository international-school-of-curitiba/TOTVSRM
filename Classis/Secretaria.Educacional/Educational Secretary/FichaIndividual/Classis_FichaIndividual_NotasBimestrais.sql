Select
	SUBSTRING(UMaterias.Materia, 0, (LEN(UMaterias.Materia)- (PATINDEX('%#%', REVERSE(UMaterias.Materia))-1))),
	UGrade.CargaHoraria,
	UGrade.OrdemHist,
	Cast(Notas.A1 as int) A1, isnull(Notas.F1,'0') F1, Notas.AD1,	/* 1Bimestre */
	Cast(Notas.A2 as int) A2, isnull(Notas.F2,'0') F2, Notas.AD2,	/* 2Bimestre */
	Cast(Notas.A3 as int) A3,										/* MS1 */
    Cast(Notas.A4 as int) A4,										/* 1Recuperacao */
	Cast(Notas.A5 as int) A5,										/* MS1 Final - Pós Recuperacao */
	Cast(Notas.A6 as int) A6, isnull(Notas.F6,'0') F6, Notas.AD6,   /* 3Bimestre */
	Cast(Notas.A7 as int) A7, isnull(Notas.F7,'0') F7, Notas.AD7,   /* 4Bimestre */
	Cast(Notas.A8 as int) A8,										/* MS2 */
	Cast(Notas.A9 as int) A9,									    /* 2Recuperacao */
	Cast(Notas.A10 as int) A10,										/* MS2 Final - Pós Recuperacao */
	Cast(Notas.A0 as int) A0,										/* Média Final */
	UMaterias.PosHist,
	UMaterias.CargaHoraria,
	UGrade.NAulasSem,
	UGrade.NumCreditos,
	UGRade.GrupoMateria
from
	UMatAlun Notas
inner join UGrade (NoLock) on (UGrade.CodCur = Notas.CodCur and UGrade.CodPer = Notas.CodPer and UGrade.Grade = Notas.Grade and UGrade.CodMat = Notas.CodMat)
inner join UMaterias (Nolock) on (UMaterias.CodMat = Notas.CodMat and UMaterias.SegundoNome = 'BR')
where
	Notas.Perletivo = '06/07'
and	Notas.MatAluno = 00296
and UGRade.GrupoMateria in ('1','2') /* 1 = Base Nucleo Comum 2 = Parte Diversificada*/ 
order by
	UGrade.OrdemHist