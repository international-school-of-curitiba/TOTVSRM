Select * from Ocupacao

--

Insert into ETabOcup (CodCliente, CodInterno,Descricao, CBO) 
select Distinct cast(Codigo as int), cast(Codigo as int), SUBSTRING(Descricao,0,50), Cast(CBO as Int) from Ocupacao
