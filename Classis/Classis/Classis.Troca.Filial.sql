
ALTER TABLE Umatalun NoCHECK CONSTRAINT fkumatalun_umatricpl
ALTER TABLE UMATRICPLLIVRE NoCHECK CONSTRAINT fkumatricpllivre_umatricpl
ALTER TABLE Uprofmatturma NoCHECK CONSTRAINT fkuprofmatturma_umatturma
ALTER TABLE UPROFMATTURSL NoCHECK CONSTRAINT fkuprofmattursl_uprofmatturma
ALTER TABLE UMATTURSL NoCHECK CONSTRAINT fkumattursl_umatturma
ALTER TABLE UMATALUN NoCheck Constraint fkumatalun_umatturma
ALTER TABLE UPLANOAULA NoCheck Constraint fkuplanoaula_umatturma 
ALTER TABLE ULISTAPRESENCA NoCheck Constraint fkulistapresenca_umatalun

update UMatricpl set codfilial = 1 where Perletivo = '09/10' and CodCur = 1 and CodPer = 1
Update UMATRICPLLIVRE set codfilial = 1 where Perletivo = '09/10' and CodCur = 1 and CodPer = 1
update Uprofmatturma set codfilial = 1 where CodPerLet = '09/10' and codfilial =2
update UMatTurma set codfilial = 1 where CodPerLet = '09/10' and codcur = 1 and codper = 1
update UMatAlun set codfilial = 1 where Perletivo = '09/10' and codcur = 1 and codper = 1
update Ugrupomod set codfilial = 1 where codperlet = '09/10' and codcur = 1 and codper = 1
update EAluServ set codfilial = 1 where Perletivo = '09/10' and codcur = 1 and codper = 1
update Ulistapresenca set codfilial = 1 where Perletivo = '09/10' and codcur = 1 and codper = 1

ALTER TABLE ULISTAPRESENCA Check Constraint fkulistapresenca_umatalun
ALTER TABLE UPLANOAULA Check Constraint fkuplanoaula_umatturma
ALTER TABLE UMATALUN Check Constraint fkumatalun_umatturma
ALTER TABLE UMATTURSL CHECK CONSTRAINT fkumattursl_umatturma
ALTER TABLE UPROFMATTURSL CHECK CONSTRAINT fkuprofmattursl_uprofmatturma
ALTER TABLE Uprofmatturma CHECK CONSTRAINT fkuprofmatturma_umatturma
ALTER TABLE UMATRICPLLIVRE CHECK CONSTRAINT fkumatricpllivre_umatricpl
ALTER TABLE Umatalun CHECK CONSTRAINT fkumatalun_umatricpl