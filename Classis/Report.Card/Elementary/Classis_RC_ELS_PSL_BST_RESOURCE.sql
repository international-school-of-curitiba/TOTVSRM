Select top 1 
    CASE WHEN (Select Count(*) from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2 ) = 0 or  (Select a1 from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) is null then 'NA' 
         ELSE (Select substring(cast(A1 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ1,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0  or  (Select a2 from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) is null then 'NA'
         ELSE (Select substring(cast(A2 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ2,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0  or  (Select a6 from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) is null then 'NA' 
         ELSE (Select substring(cast(A6 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ3,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0  or  (Select a7 from UMatAlun where perletivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) is null then 'NA'
         ELSE (Select substring(cast(A7 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ4,
	isnull((Select Top 1 Apelido from PPessoa, EProfes, UProfMatTurma, UMatAlun where PPessoa.Codigo = EProfes.CodPessoa and EProfes.CodProf = UprofMatTurma.CodProf and UprofMatTurma.CodMat like  '%RSO' and PPessoa.Apelido is not null and UProfMatTurma.CodTur =:Espelho#3 and UProfMatTurma.CodPerLet =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2), ' ') as Teacher
From UdataAval


/*
Select top 1 
    CASE WHEN (Select Count(*) from UMatAlun where perletivo = :Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2 ) = 0 then 'NA '
         ELSE (Select substring(cast(A1 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ1,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo = :Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0 then 'NA'
         ELSE (Select substring(cast(A2 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ2,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo = :Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0 then 'NA' 
         ELSE (Select substring(cast(A6 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ3,
    CASE WHEN (Select Count(*) from UMatAlun where perletivo = :Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) = 0 then 'NA'
         ELSE (Select substring(cast(A7 as Varchar),1,1) from UMatAlun where UMatAlun.PerLetivo =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2) END as NotaQ4,
	isnull((Select Top 1 Apelido from PPessoa, EProfes, UProfMatTurma, UMatAlun where PPessoa.Codigo = EProfes.CodPessoa and EProfes.CodProf = UprofMatTurma.CodProf and UprofMatTurma.CodMat like  '%RSO' and PPessoa.Apelido is not null and UProfMatTurma.CodTur =:Espelho#3 and UProfMatTurma.CodPerLet =:Espelho#1 and UMatAlun.CodMat like '%RSO' and UMatAlun.Mataluno=:Espelho#2), ' ') as Teacher
From UdataAval


*/