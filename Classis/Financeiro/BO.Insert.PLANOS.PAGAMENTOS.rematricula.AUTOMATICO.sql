DECLARE @SchoolYear varchar(5)
DECLARE @DataContrato as datetime
DECLARE @Contador int
Declare @CodCur int
Declare @CodPer int
Declare @CodTun int
Declare @CodMat varchar(6)
Declare @Plano as varchar(10)

Set @SchoolYear = '10/11'
Set @CodCur = 3
Set @CodPer = 1
Set @CodTun = 3 -- 1 = ECC, 2 = ELEMENTARY, 3 = SECONDARY
Set @DataContrato = '08/04/2010'
Set @Plano = 'ALMOCO'

DECLARE tnames_cursor CURSOR
FOR		(Select MatAluno from UMatricpl where Perletivo = @SchoolYear and CodCur =@CodCur  and codPer =@CodPer  and Status in ('01','07') );
OPEN tnames_cursor;
DECLARE @Matricula sysname;
FETCH NEXT FROM tnames_cursor INTO @Matricula;
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   
   
   Set @Contador = (SELECT VALAUTOINC FROM GAUTOINC WHERE CODCOLIGADA = 1 AND CODSISTEMA = 'U' AND CODAUTOINC = 'CONTRATO')
   
   
   INSERT INTO EALUSERV (CODCOLIGADA ,CODFILIAL ,PERLETIVO ,MATALUNO ,CONTRATO ,PLANO ,CATIVO ,CODCUR ,CODPER ,CODTUN ,ASSINADO ,STATUS ,DATACONTRATO ,DTASSINATURA ,DIAFIXO ) VALUES (1, 1, @SchoolYear, @Matricula, @Contador, @Plano, 'S', @CodCur, @CodPer, @CodTun, 'N', 'N', @DataContrato,@DataContrato, 'N')

   Select @Matricula, @Contador

   UPDATE GAUTOINC SET VALAUTOINC=@Contador + 1 WHERE CODCOLIGADA=1 AND CODSISTEMA='U' AND CODAUTOINC='CONTRATO' AND VALAUTOINC=@Contador

   END;

   FETCH NEXT FROM tnames_cursor INTO @Matricula;
END;
CLOSE tnames_cursor;
DEALLOCATE tnames_cursor;

