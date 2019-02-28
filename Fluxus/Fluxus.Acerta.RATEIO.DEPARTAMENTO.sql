

DECLARE @DataBaixa as datetime

Set @DataBaixa = '01/03/2010'


DECLARE tnames_cursor CURSOR

FOR (Select idfat, Idlan from Flan where PagRec = 1
and NFoudup = 2 and DataPrevBaixa >= @DataBaixa and idlan not in (Select idlan from FLanRatDep)
and Statuslan = 0 and Codtdo = '000016');

OPEN tnames_cursor;

DECLARE @IDFat sysname;
DECLARE @IDLan sysname;

FETCH NEXT FROM tnames_cursor INTO @IDFat, @IDLAN;
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   

	insert FLanRatDep 
	Select CodColigada, @IDLan, CodFilial, right(codtdo,4), Sum(ValorOriginal) from Flan 
	where idfat = @IDFat and DataPrevBaixa >= @DataBaixa and Statuslan = 0 and Codtdo != '000016' and NFoudup != 2 
	Group by right(codtdo,4), CodColigada, CodFilial
	
   END;
   FETCH NEXT FROM tnames_cursor INTO @IDFat, @IDLan;
END;
CLOSE tnames_cursor;
DEALLOCATE tnames_cursor;