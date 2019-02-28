/* Report Card Middle School */

Select 
	UMaterias.PosHist,
	UMaterias.materia,
    (select top 1 PPessoa.Apelido from UprofMatturma, PPessoa, EProfes where EProfes.CodProf = UProfMatturma.CodProf and PPessoa.Codigo=EProfes.Codpessoa and UProfMatturma.Codmat =UMatAlun.CodMat and UProfMatturma.TipoProf = 'T' and UProfMatturma.CodPerlet = UMatAlun.Perletivo and Uprofmatturma.codtur = UmatAlun.Codtur),	
	Case When A1 = 1 then 'INC' when C1 = 'P' then C1 when C1 = 'F' then C1 else isnull(SUBSTRING(cast(UMatAlun.A1 as varchar), 0, (LEN(UMatAlun.A1) - (PATINDEX('%.%', REVERSE(UMatAlun.A1))-1))), '-') end as Q1,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ1,
	Case When A2 = 1 then 'INC' when C2 = 'P' then C2 when C2 = 'F' then C2 else isnull(SUBSTRING(cast(UMatAlun.A2 as varchar), 0, (LEN(UMatAlun.A2) - (PATINDEX('%.%', REVERSE(UMatAlun.A2))-1))), '-') end as Q2,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ2,
	CASE
	    WHEN (UMATERIAS.TIPONOTA = 0 AND A3 > 0) THEN isnull(SUBSTRING(cast(UMatAlun.A3 as varchar), 0, (LEN(UMatAlun.A3) - (PATINDEX('%.%', REVERSE(UMatAlun.A3))-1))), '-') 
		WHEN (UMATERIAS.TIPONOTA = 1 AND A3 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A3 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A3 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A3 = 0) THEN '-'
		 WHEN A3 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A3 as varchar), 0, (LEN(UMatAlun.A3) - (PATINDEX('%.%', REVERSE(UMatAlun.A3))-1))), '-') END as Sem1_Avg,
	CASE 
		WHEN (UMATERIAS.TIPONOTA = 0 AND A5 > 0) THEN isnull(SUBSTRING(cast(UMatAlun.A5 as varchar), 0, (LEN(UMatAlun.A5) - (PATINDEX('%.%', REVERSE(UMatAlun.A5))-1))), '-')
		WHEN (UMATERIAS.TIPONOTA = 1 AND A5 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A5 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A5 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A5 = 0) THEN '-'
		 WHEN A5 = 1 then 'INC'
		 ELSE  isnull(SUBSTRING(cast(UMatAlun.A5 as varchar), 0, (LEN(UMatAlun.A5) - (PATINDEX('%.%', REVERSE(UMatAlun.A5))-1))), '-') 
		 END as Sem1_Avg_AR,
	Case When A6 = 1 then 'INC' when C6 = 'P' then C6 when C6 = 'F' then C6 else isnull(SUBSTRING(cast(UMatAlun.A6 as varchar), 0, (LEN(UMatAlun.A6) - (PATINDEX('%.%', REVERSE(UMatAlun.A6))-1))), '-') end as Q3,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ3,
	Case When A7 = 1 then 'INC' when C7 = 'P' then C7 when C7 = 'F' then C7 else isnull(SUBSTRING(cast(UMatAlun.A7 as varchar), 0, (LEN(UMatAlun.A7) - (PATINDEX('%.%', REVERSE(UMatAlun.A7))-1))), '-') end as Q4,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ4,
	Case
		WHEN (UMATERIAS.TIPONOTA = 0 AND A8 > 0 ) THEN isnull(SUBSTRING(cast(UMatAlun.A8 as varchar), 0, (LEN(UMatAlun.A8) - (PATINDEX('%.%', REVERSE(UMatAlun.A8))-1))), '-')
		WHEN (UMATERIAS.TIPONOTA = 1 AND A8 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A8 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A8 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A8 = 0) THEN '-'
		 When A8 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A8 as varchar), 0, (LEN(UMatAlun.A8) - (PATINDEX('%.%', REVERSE(UMatAlun.A8))-1))), '-') END as Sem2_Avg,
	Case 
		WHEN (UMATERIAS.TIPONOTA = 0 AND A10 > 0) THEN isnull(SUBSTRING(cast(UMatAlun.A0 as varchar), 0, (LEN(UMatAlun.A0) - (PATINDEX('%.%', REVERSE(UMatAlun.A0))-1))), '-')
		WHEN (UMATERIAS.TIPONOTA = 1 AND A10 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A10 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A10 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A10 = 0) THEN '-'
         WHEN A10 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A10 as varchar), 0, (LEN(UMatAlun.A10) - (PATINDEX('%.%', REVERSE(UMatAlun.A10))-1))), '-') END as Sem2_Avg_AR,
	Case When A0 = 1 then 'INC' when C0 = 'P' then C0 when C0 = 'F' then C0 else isnull(SUBSTRING(cast(UMatAlun.A0 as varchar), 0, (LEN(UMatAlun.A0) - (PATINDEX('%.%', REVERSE(UMatAlun.A0))-1))), '-') END as Final,
        UMaterias.CodMat
From 
	UMatAlun, UMaterias, UGrade
Where UMatAlun.CodMat = UMaterias.CodMat
and UMatAlun.Perletivo = :Espelho#1_S
and UMatAlun.MatAluno = :Espelho#2_S
and UMatAlun.CodMat IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
and UMatAlun.CodMat not in ('206AD1', '206AD2', '206AD3', '206AD4')
and UMatAlun.CodMat not in ('207AD1', '207AD2', '207AD3', '207AD4')
and UMatAlun.CodMat not in ('208AD1', '208AD2', '208AD3', '208AD4')
and UMatAlun.CodMat not in ('206ADV', '207ADV', '208ADV')
and UMatAlun.CodMat not in ('206REA', '207REA', '208REA')
and UMatAlun.CodMat not in ('206WRI', '207WRI', '208WRI')
and UMatAlun.CodMat not in ('206LSL', '207LSL', '208LSL')
and UMatAlun.CodMat not in ('206SSK', '207SSK', '208SSK')
and UGrade.CodMat = UMatalun.CodMat
and UGrade.Grade = UMatalun.Grade
order by UGrade.GRUPOMATERIA, UMaterias.PosHist



/*

Select 
	UMaterias.PosHist,
	UMaterias.materia,
        (select top 1 PPessoa.Apelido from UprofMatturma, PPessoa, EProfes where EProfes.CodProf = UProfMatturma.CodProf and PPessoa.Codigo=EProfes.Codpessoa and UProfMatturma.Codmat =UMatAlun.CodMat and UProfMatturma.TipoProf = 'T' and UProfMatturma.CodPerlet = UMatAlun.Perletivo and Uprofmatturma.codtur = UmatAlun.Codtur),	
	Case When A1 = 1 then 'INC' when C1 = 'P' then C1 when C1 = 'F' then C1 else isnull(SUBSTRING(cast(UMatAlun.A1 as varchar), 0, (LEN(UMatAlun.A1) - (PATINDEX('%.%', REVERSE(UMatAlun.A1))-1))), '-') end as Q1,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ1,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '1' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ1,
	Case When A2 = 1 then 'INC' when C2 = 'P' then C2 when C2 = 'F' then C2 else isnull(SUBSTRING(cast(UMatAlun.A2 as varchar), 0, (LEN(UMatAlun.A2) - (PATINDEX('%.%', REVERSE(UMatAlun.A2))-1))), '-') end as Q2,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ2,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '2' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ2,
	CASE WHEN (UMATERIAS.TIPONOTA = 1 AND A3 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A3 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A3 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A3 = 0) THEN '-'
		 WHEN A3 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A3 as varchar), 0, (LEN(UMatAlun.A3) - (PATINDEX('%.%', REVERSE(UMatAlun.A3))-1))), '-') END as Sem1_Avg,
	CASE WHEN (UMATERIAS.TIPONOTA = 1 AND A5 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A5 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A5 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A5 = 0) THEN '-'
		 WHEN A5 = 1 then 'INC' ELSE  isnull(SUBSTRING(cast(UMatAlun.A5 as varchar), 0, (LEN(UMatAlun.A5) - (PATINDEX('%.%', REVERSE(UMatAlun.A5))-1))), '-') END as Sem1_Avg_AR,
	Case When A6 = 1 then 'INC' when C6 = 'P' then C6 when C6 = 'F' then C6 else isnull(SUBSTRING(cast(UMatAlun.A6 as varchar), 0, (LEN(UMatAlun.A6) - (PATINDEX('%.%', REVERSE(UMatAlun.A6))-1))), '-') end as Q3,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ3,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '6' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ3,
	Case When A7 = 1 then 'INC' when C7 = 'P' then C7 when C7 = 'F' then C7 else isnull(SUBSTRING(cast(UMatAlun.A7 as varchar), 0, (LEN(UMatAlun.A7) - (PATINDEX('%.%', REVERSE(UMatAlun.A7))-1))), '-') end as Q4,
	isnull((Select Case WHEN P1 = 50 then 'U' WHEN P1 = 60 then 'NI' WHEN P1 = 80 then 'M' WHEN P1 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as CQ4,
	isnull((Select Case WHEN P2 = 50 then 'U' WHEN P2 = 60 then 'NI' WHEN P2 = 80 then 'M' WHEN P2 = 100 then 'E' ELSE '-' END from EAlunoTPr where EAlunoTPr.CodEtp = '7' and EAlunoTPr.mataluno = UMatAlun.MatAluno and EAlunoTPr.codmat = UMatAlun.CodMat and EAlunoTPr.Perletivo = UMatAlun.Perletivo), '-') as EQ4,
	Case WHEN (UMATERIAS.TIPONOTA = 1 AND A8 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A8 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A8 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A8 = 0) THEN '-'
		 When A8 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A8 as varchar), 0, (LEN(UMatAlun.A8) - (PATINDEX('%.%', REVERSE(UMatAlun.A8))-1))), '-') END as Sem1_Avg,
	Case WHEN (UMATERIAS.TIPONOTA = 1 AND A10 > 0) THEN 'P' WHEN (UMATERIAS.TIPONOTA = 1 AND A10 = 0) THEN '-'
         WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A10 > 0) THEN 'P' WHEN (UMATALUN.TRANSFERENCIA = 'F' AND A10 = 0) THEN '-'
         WHEN A10 = 1 then 'INC' else isnull(SUBSTRING(cast(UMatAlun.A10 as varchar), 0, (LEN(UMatAlun.A10) - (PATINDEX('%.%', REVERSE(UMatAlun.A10))-1))), '-') END as Sem1_Avg_AR,
	Case When A0 = 1 then 'INC' when C0 = 'P' then C0 when C0 = 'F' then C0 else isnull(SUBSTRING(cast(UMatAlun.A0 as varchar), 0, (LEN(UMatAlun.A0) - (PATINDEX('%.%', REVERSE(UMatAlun.A0))-1))), '-') END as Final,
        UMaterias.CodMat
From 
	UMatAlun, UMaterias, UGrade
Where UMatAlun.CodMat = UMaterias.CodMat
and UMatAlun.Perletivo =:Espelho#1_S
and UMatAlun.MatAluno =:Espelho#2_S
and UMatAlun.CodMat IN (SELECT CODMAT FROM UMATERIAS WHERE SEGUNDONOME = 'US')
and UMatAlun.CodMat not in ('206AD1', '206AD2', '206AD3', '206AD4')
and UMatAlun.CodMat not in ('207AD1', '207AD2', '207AD3', '207AD4')
and UMatAlun.CodMat not in ('208AD1', '208AD2', '208AD3', '208AD4')
and UMatAlun.CodMat not in ('206ADV', '207ADV', '208ADV')
and UMatAlun.CodMat not in ('206REA', '207REA', '208REA')
and UMatAlun.CodMat not in ('206WRI', '207WRI', '208WRI')
and UMatAlun.CodMat not in ('206LSL', '207LSL', '208LSL')
and UMatAlun.CodMat not in ('206SSK', '207SSK', '208SSK')
and UGrade.CodMat = UMatalun.CodMat
and UGrade.Grade = UMatalun.Grade
order by UGrade.GRUPOMATERIA, UMaterias.PosHist


*/


/*SELECT codmat, a0, A1,A2,A3,A4,A5,A6,A7,A8,A9,A10 FROM UMATALUN
WHERE MATALUNO = 01673 AND PERLETIVO = '16/17'
and CODMAT = '300spa'*/