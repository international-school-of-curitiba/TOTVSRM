/*
Delete UDataAval
Delete UMatTurma
Delete UprofMatTurSl
Delete UProfMatTurma
Delete UmatTurSL
Delete Umatalun
Delete UmatTurma
Delete UGrade
Delete Umaterias
*/
Select * from Disciplinas
-- Drop Table Disciplinas
update Disciplinas set codmat = 'WHA' where Codmat = '101WHA'
update Disciplinas set VALORAULA=null, POSHIST=null, DECIMAIS= null, NAULASSEM= null, NUMCREDITOS= null, CREDTES= null, VALORCREDITO= null, DECIMAISPROVA= null

Insert into Umaterias Select * from Disciplinas

Select * from umaterias


