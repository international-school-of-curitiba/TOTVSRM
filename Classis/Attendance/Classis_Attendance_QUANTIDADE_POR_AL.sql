
Select Distinct
		(Select A_NomeReduzido from EAcompl where EACompl.Matricula = Umatricpl.Mataluno) as Nome,
		(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = Umatricpl.Mataluno and UMatAlun.Perletivo = UMatricPL.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level,
		(Select Count(*) from EAluOcor Where CodPerLet = Umatricpl.PerLetivo and Mataluno = Umatricpl.Mataluno and  EAluOcor.Status in ('A','P') and EAluOcor.CodOcorrencia >= '1') as Quantidade,
		Codcur, Codper
	from Umatricpl
	Where Umatricpl.PerLetivo = '06/07'
	and UmatricPl.Status in ('01', '07')
	and ((Codcur = 2 and codper = 2) or (Codcur = 3 and codper = 1))
Order by Quantidade, Grade_level
