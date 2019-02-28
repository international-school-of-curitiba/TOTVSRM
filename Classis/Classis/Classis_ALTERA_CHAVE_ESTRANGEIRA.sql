Select * from Umate


ALTER TABLE UMATALUN NoCHECK CONSTRAINT fkumatalun_umatturma 
update UMatAlun set codmat = '204INFO' where codmat like '%INDO'
ALTER TABLE UMATALUN CHECK CONSTRAINT fkumatalun_umatturma 

ALTER TABLE Umatturma NOCHECK CONSTRAINT fkumatturma_ugrade
Update Umatturma set Codmat = '204INFO' where codmat like '%INDO'
ALTER TABLE Umatturma CHECK CONSTRAINT fkumatturma_ugrade

ALTER TABLE ugrade NOCHECK CONSTRAINT fkugrade_umaterias
Update ugrade set CodMat = '204INFO' where CodMat = '204INDO'
ALTER TABLE ugrade CHECK CONSTRAINT fkugrade_umaterias

ALTER TABLE Umaterias NOCHECK CONSTRAINT fkumaterias_umaterias
update Umaterias set Codmat = '204INFO' where codmat like '%INDO'
ALTER TABLE Umaterias CHECK CONSTRAINT fkumaterias_umaterias

