Declare @IDPARTIDA nvarchar(8);
Set @IDPARTIDA = '1166916' 



--Select * from CPARTIDA where IDPARTIDA = @IDPARTIDA
--CCONT where IDPARTIDA = @IDPARTIDA

Delete CCONTRAT where IDCONT in (Select IDCONT from CCONT where IDPARTIDA = @IDPARTIDA)
Delete CLCOMPL where IDPARTIDA = @IDPARTIDA 
Delete CCONT where IDPARTIDA = @IDPARTIDA 
Delete CRATEIOLC where IDPARTIDA = @IDPARTIDA
Delete CPARTIDA where IDPARTIDA = @IDPARTIDA


/* para apagar o estorno é necessario tirar a referencia do estorno


update CCONT 
set IDESTORNOCONT = null
where IDOPERACAO = (select IDOPERACAO from CCONT where IDPARTIDA = 1166917 ) and IDESTORNOCONT is not null


*/