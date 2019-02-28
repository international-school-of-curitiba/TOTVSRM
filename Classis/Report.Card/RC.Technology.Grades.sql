DECLARE @SchoolYear varchar(5)
DECLARE @Quarter int
Declare @CodCur int
Declare @CodPer int
Declare @CodTur varchar(5)
Declare @CodMat varchar(6)

Set @SchoolYear = '10/11'
Set @Quarter = 7    /* Atualizar tambem o quarter do update dentro do FETCH */

DECLARE tnames_cursor CURSOR
FOR		(Select distinct tech.matricula from isc.dbo.techgrade tech where tech.nota is not null
		and tech.Perletivo = @SchoolYear and tech.Codetp = @Quarter ) ;
OPEN tnames_cursor;
DECLARE @Matricula sysname;
FETCH NEXT FROM tnames_cursor INTO @Matricula;
WHILE (@@FETCH_STATUS <> -1)
BEGIN
   IF (@@FETCH_STATUS <> -2)
   BEGIN   
	Set @CodCur = (select CodCur from UMatAlun where PerLetivo = @SchoolYear and MatAluno = @Matricula and UMatAlun.CodMat like '%tec')
	Set @CodPer = (select CodPer from UMatAlun where PerLetivo = @SchoolYear and MatAluno = @Matricula and UMatAlun.CodMat like '%tec')
	Set @CodTur = (select CodTur from UMatAlun where PerLetivo = @SchoolYear and MatAluno = @Matricula and UMatAlun.CodMat like '%tec')
	Set @CodMat = (select CodMat from UMatAlun where PerLetivo = @SchoolYear and MatAluno = @Matricula and UMatAlun.CodMat like '%tec')
	
	Insert into EalunoTPR (CodColigada, MatAluno, PerLetivo, CodFilial, CodCur, CodPer, CodTun, CodTur, CodMat,CodEtp, p1, p2)
	values (1,@Matricula,@SchoolYear,1, @CodCur, @CodPer, 3, @CodTur, @CodMat, @Quarter, 80,80)	
  
    update EalunoTPR set p1 = 80, p2 = 80 where EalunoTPR.MatAluno = @Matricula and EalunoTPR.Perletivo = @SchoolYear and EalunoTPR.CodCur = @CodCur and EalunoTPR.CodPer = @CodPer and EalunoTPR.CodMat = @Codmat and EalunoTPR.CodEtp = @Quarter

	update UMatAlun /* Atualizar tambem o quarter */
    set a7 = (Select Cast(Round(Avg(Cast(nota as Decimal)),0)as int) from isc.dbo.techgrade tech 
			  where tech.nota is not null and tech.Perletivo = UMatAlun.Perletivo
			  and tech.CodEtp = @Quarter and tech.Matricula = UMatAlun.MatAluno 
			  Group by tech.Matricula)
	where UMatAlun.Perletivo = @SchoolYear
	and UMatAlun.CodMat like '%tec'
	and UMatAlun.Status <> 14
	and UMatAlun.MatAluno = @Matricula

   END;

   FETCH NEXT FROM tnames_cursor INTO @Matricula;
END;
CLOSE tnames_cursor;
DEALLOCATE tnames_cursor;

