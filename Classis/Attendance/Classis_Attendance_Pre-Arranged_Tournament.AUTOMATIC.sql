Declare @SchoolYear nvarchar(10);
Declare @Date nvarchar(10);
--Declare @Matricula nvarchar(6);
Declare @Quarter nvarchar(15);
Declare @Observacao nvarchar(150);
Declare @User nvarchar(20);
Declare @Status nvarchar(3);

Set @SchoolYear = '10/11'
Set @Date = '10/07/2010'
Set @Quarter = '1'
Set @Observacao = 'Participating on the ISSL Tournament'
Set @User = 'Tania.Jaskolowski'
Set @Status = 'PE'

DECLARE Matricula_cursor CURSOR                     -- ATUALIZAR A LISTA COM AS MATRICULAS A SEREM ADICIONADAS NO ATTENDANCE
FOR (Select matricula from Ealunos where Matricula in (00134, 00515, 00619, 00173, 00568, 00288, 00989, 00189, 00936, 00569, 00683, 00781, 00719, 00783, 00095, 00602, 00064, 00881, 00501, 00133, 00826, 00078, 00387, 00916, 00882, 00945, 00757, 00077, 01019)) ;
OPEN Matricula_cursor;
DECLARE @Matricula sysname;
FETCH NEXT FROM Matricula_cursor INTO @Matricula;
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   

		Update UListaPresenca set Status = 'N' where Perletivo = @SchoolYear and Dataaula = @Date and MatAluno = @Matricula

		Insert into EAluOcor 
		(CodColigada, CodPerlet, MatAluno, Data, NumOcorrencia, codocorrencia, codgrpocor, Observacao, usuario, Status, C, dtalt, hralt, etapa)
		select 
			1, 
			@SchoolYear,
			Matricula, 
			@Date, 
			(Select ValAutoInc + 1  from GautoInc where codSistema = 'E' and CodAutoInc = 'NUMOCORALUNO'), 
			@Quarter,
			'1', -- ATTENDANCE
			@Observacao, 
			@User, 
			@Status, --Status, 
			'S', --C, 
			Getdate(), 
			Getdate(), 
			@Quarter
		from Ealunos where Matricula = @Matricula;
		
		Update GautoInc set ValAutoInc = ValAutoInc + 1 where codSistema = 'E' and CodAutoInc = 'NUMOCORALUNO'
   END;
   FETCH NEXT FROM Matricula_cursor INTO @Matricula;
END;
CLOSE Matricula_cursor;
DEALLOCATE Matricula_cursor;



