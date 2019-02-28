Select top 1 
	isnull((Select cast(C1 as Varchar) from UMatAlun where UMatAlun.PerLetivo ='06/07' and UMatAlun.CodMat like '%ART' and UMatAlun.Mataluno='00007'), '-') as NotaQ1,
	isnull((Select cast(C2 as Varchar) from UMatAlun where UMatAlun.PerLetivo ='06/07' and UMatAlun.CodMat like '%ART' and UMatAlun.Mataluno='00007'), '-') as NotaQ2,
	isnull((Select cast(C6 as Varchar) from UMatAlun where UMatAlun.PerLetivo ='06/07' and UMatAlun.CodMat like '%ART' and UMatAlun.Mataluno='00007'), '-') as NotaQ3,
	isnull((Select cast(C7 as Varchar) from UMatAlun where UMatAlun.PerLetivo ='06/07' and UMatAlun.CodMat like '%ART' and UMatAlun.Mataluno='00007'), '-') as NotaQ4,
	isnull((Select Top 1 Apelido from PPessoa, EProfes, UProfMatTurma where PPessoa.Codigo = EProfes.CodPessoa and EProfes.CodProf = UprofMatTurma.CodProf 
		and UprofMatTurma.CodMat like  '%PED' and PPessoa.Apelido is not null and UProfMatTurma.CodTur = '2B'), '-') as Teacher
From UdataAval
