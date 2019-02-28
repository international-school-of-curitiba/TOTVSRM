/* 
Select 
	GFilial.Rua, 
	GFilial.Numero, 
	GFilial.Bairro, 
	GFilial.Cidade, 
	GFilial.Cep, 
	'(' + Substring(GFilial.Telefone,1,2) + ')(' + Substring(GFilial.Telefone,4,2) + ')' + Substring(GFilial.Telefone,6,12),
	'(' + Substring(GFilial.Fax,1,2) + ')(' + Substring(GFilial.Fax,4,2) + ')' + Substring(GFilial.Fax,6,12), 
	'isc@iscbrazil.com', 
	'www.iscbrazil.com',
	GColigada.Nome
 from GFilial,  GColigada
where GFilial.CodColigada = GColigada.CodColigada
and CodFilial = 1

*/

Select 
	Ealunos.Nome,
	Ealunos.Sexo,
	Ealunos.CedIdent,
	isnull(Ealunos.UFEmisCI, '-') UFCI,
	Ealunos.DTNasc,
	Ealunos.CNDistrito +'/'+ Ealunos.CNComarca,
	isnull(CNUF, '-') as CNUF,
	(Select Descricao from PCodNacao where PCodNacao.CodInterno = Ealunos.Nacional) as Nacionalidade,
	(Select Nome from PPessoa where PPessoa.Codigo = Ealunos.Pai),
	(Select Nome from PPessoa where PPessoa.Codigo = Ealunos.Mae),
	Case 
		when (EAlunos.CompenDAl = null) then 
			EAlunos.EndAluno + ', ' + EAlunos.NumenDAlun 
		else
			EAlunos.EndAluno + ', ' + EAlunos.NumenDAlun + ' - ' + EAlunos.CompenDAl
	end as Endereco, 
	EAlunos.TelAluno, 
	Case 
		when 
			UMatricPL.CodCur = 1 and UMatricPL.CodPer = 1 then 'Toddler'
		when
			UMatricPL.CodCur = 1 and UMatricPL.CodPer = 2 then 'Nursery' 
		when
			UMatricPL.CodCur = 2 then UMatricPL.Periodo
		when
			UMatricPL.CodCur = 3 then UMatricPL.Periodo - 8 
	end as Serie,
	(Select top 1 Case when len(UMatALun.CodTur) = 2 then substring(UMatALun.CodTur,2,1) else Substring(UMatALun.CodTur,3,1) end from UMatAlun where UMatAlun.MatAluno = EAlunos.Matricula and UMatAlun.Perletivo ='06/07' Group by UMatAlun.CodPer, UMatAlun.CodCur, UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
	'Integral' as Turno,
	(Select Cast(year(DTInicio) as varchar) + '/' + Cast(year(DTFim) as varchar) from EPerlet where EPerLet.CodPerLet= UMatricpl.Perletivo)
from Ealunos
Inner Join UMatricPL (NoLock) on (UMatricpl.MatAluno = EAlunos.Matricula)
Where Matricula = 00296
and UMatricpl.Perletivo ='06/07' 

/*
Select
	SUBSTRING(UMaterias.Materia, 0, (LEN(UMaterias.Materia)- (PATINDEX('%#%', REVERSE(UMaterias.Materia))-1))),
	UGrade.CargaHoraria,
	UGrade.OrdemHist,
	Cast(Notas.A1 as int) A1, isnull(Notas.F1,'0') F1, Notas.AD1,	/* 1Bimestre */
	Cast(Notas.A2 as int) A2, isnull(Notas.F2,'0') F2, Notas.AD2,	/* 2Bimestre */
	Cast(Notas.A3 as int) A3,										/* MS1 */
        Cast(Notas.A4 as int) A4,	                                /* 1Recuperacao */
	Cast(Notas.A5 as int) A5,	      									/* MS1 Final - Pós Recuperacao */
	Cast(Notas.A6 as int) A6, isnull(Notas.F6,'0') F6, Notas.AD6,   /* 3Bimestre */
	Cast(Notas.A7 as int) A7, isnull(Notas.F7,'0') F7, Notas.AD7,   /* 4Bimestre */
	Cast(Notas.A8 as int) A8,										/* MS2 */
	Cast(Notas.A9 as int) A9,									    /* 2Recuperacao */
	Cast(Notas.A10 as int) A10,										/* MS2 Final - Pós Recuperacao */
	Cast(Notas.A0 as int) A0,										/* Média Final */
	UMaterias.PosHist,
	UMaterias.CargaHoraria,
	UGrade.NAulasSem,
	UGrade.NumCreditos
from
	UMatAlun Notas
inner join UGrade (NoLock) on (UGrade.CodCur = Notas.CodCur and UGrade.CodPer = Notas.CodPer and UGrade.Grade = Notas.Grade and UGrade.CodMat = Notas.CodMat)
inner join UMaterias (Nolock) on (UMaterias.CodMat = Notas.CodMat and UMaterias.SegundoNome = 'BR')
where
	Notas.Perletivo = '06/07'
and	Notas.MatAluno = 00296
order by
	UGrade.OrdemHist

*/