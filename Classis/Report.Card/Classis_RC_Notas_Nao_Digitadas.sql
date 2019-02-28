Select distinct 
	Mataluno, 
	(Select A_NomeReduzido from Eacompl where matricula = MatAluno),
	CodMat, 
	(Select Materia from UMaterias where UMAterias.Codmat = UMAtAlun.CodMat),
	A1, C1, F1 from UMatAlun
where Perletivo = '07/08'
and A1 is null
and len(Codmat) = 6
and CodCur = 3
and CodPer = 1
and CodFilial = 1 
and Status in ('01', '07')
and Codmat not in ('303EES','304EES')
