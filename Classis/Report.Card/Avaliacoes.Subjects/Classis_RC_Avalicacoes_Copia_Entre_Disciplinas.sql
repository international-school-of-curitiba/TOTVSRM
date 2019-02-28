
/*
-- CODETAPA 1 IS THE 1st QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '208HEA', '8A', NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = '8A' AND CODETAPA = '1' and CodMat = '208PED' and CodPerlet = '07/08'
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '208HEA', '8A', NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = '8A' AND CODETAPA = '2' and CodMat = '208PED' and CodPerlet = '07/08'
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '208HEA', '8A', NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = '8A' AND CODETAPA = '6' and CodMat = '208PED' and CodPerlet = '07/08'
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet, '208HEA', '8A', NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = '8A' AND CODETAPA = '7' and CodMat = '208PED' and CodPerlet = '07/08'

*/
Declare @CodMateria varchar(8)
Declare @CodTurma varchar (16)
Declare @CodMateria2 varchar(8)
Declare @CodTurma2 varchar (16)

Set @CodMateria = '303ILP'  --Destino
Set @CodTurma = '11A'		--Destino
Set @CodMateria2 = '304PED' --Fonte
Set @CodTurma2 = '12A'		--Fonte

-- CODETAPA 1 IS THE 1st QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet,  @CodMateria, @CodTurma, NumProva, PontConc, PontNum, Notafalta, '1', Descricao, MediaProva  from UDataAval where codtur = @CodTurma2 AND CODETAPA = '1' and CodMat = @CodMateria2 and CodPerlet = '11/12' --and NUMPROVA in('1','2','3')
-- CODETAPA 2 IS THE 2ND QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet,  @CodMateria, @CodTurma, NumProva, PontConc, PontNum, Notafalta, '2', Descricao, MediaProva  from UDataAval where codtur = @CodTurma2 AND CODETAPA = '2' and CodMat = @CodMateria2 and CodPerlet = '11/12' --and NUMPROVA in('1','2','3')
-- CODETAPA 6 IS THE 3RD QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet,  @CodMateria, @CodTurma, NumProva, PontConc, PontNum, Notafalta, '6', Descricao, MediaProva  from UDataAval where codtur = @CodTurma2 AND CODETAPA = '6' and CodMat = @CodMateria2 and CodPerlet = '11/12' --and NUMPROVA in('1','2','3')
-- CODETAPA 7 IS THE 4TH QUARTER
Insert into UDataAval (Codcoligada, Codfilial,Codperlet, CodMat, CodTur, NumProva, PontConc, PontNum, Notafalta, CodEtapa, Descricao, MediaProva) 
Select   Codcoligada, Codfilial,Codperlet,  @CodMateria, @CodTurma, NumProva, PontConc, PontNum, Notafalta, '7', Descricao, MediaProva  from UDataAval where codtur = @CodTurma2 AND CODETAPA = '7' and CodMat = @CodMateria2 and CodPerlet = '11/12' --and NUMPROVA in('1','2','3')



select * from UMatTurma where codperlet = '11/12' and codmat not in(
select  codmat from UDataAval where codperlet = '11/12' and UDATAAVAL.CODTUR = UMATTURMA.CODTUR)
and len(Codmat) =6
and CodCur != 1
and ((CodCur = 2 and codper =1) or codcur =3)
and CODMAT not like '%POR'
and CODMAT not like '%LAR'
and CODMAT not like '%RSO'