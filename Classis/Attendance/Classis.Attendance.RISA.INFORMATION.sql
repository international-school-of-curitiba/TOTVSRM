Declare @Date nvarchar(10);
Declare @SchoolYear nVarchar(5);
Declare @Periodo nVarchar(5);

Set @Date = '09/06/2009'
Set @SchoolYear = '08/09'
Set @Periodo = '01'

Select Top 1
	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo >= '6' 
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalSEC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor 
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data = @Date
	and EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo = @SchoolYear
	and UMatricpl.Periodo >= '6'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesSEC_QUEComem,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '5' and Umatricpl.CodCur = '2'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalELEM_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '2'
	and UMatricpl.Periodo <= '5'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesELEM_QUEComem,

	Case 
		when (Select datepart(dw,@Date)) = 2 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Segunda = 1)
		when (Select datepart(dw,@Date)) = 3 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Terca = 1)
		when (Select datepart(dw,@Date)) = 4 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Quarta = 1)
		when (Select datepart(dw,@Date)) = 5 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Quinta = 1)
		when (Select datepart(dw,@Date)) = 6 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Sexta = 1)
		else
			0
	End as FuncSanta,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '4' and Umatricpl.CodCur = '1'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalECC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '1'
	and UMatricpl.Periodo <= '4'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesECC_QueComem,
	Case 
		when (Select datepart(dw,@Date)) = 2 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Segunda = 1)
		when (Select datepart(dw,@Date)) = 3 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Terca = 1)
		when (Select datepart(dw,@Date)) = 4 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Quarta = 1)
		when (Select datepart(dw,@Date)) = 5 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Quinta = 1)
		when (Select datepart(dw,@Date)) = 6 then  
			(Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Sexta = 1)
		else
			0
	End as FuncVilaSchaffer
from Glogin

/*
Select Top 1
	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo >= '6' 
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalSEC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor 
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data = @Date
	and EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo = @SchoolYear
	and UMatricpl.Periodo >= '6'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesSEC_QUEComem,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '5' and Umatricpl.CodCur = '2'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalELEM_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '2'
	and UMatricpl.Periodo <= '5'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesELEM_QUEComem,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '4' and Umatricpl.CodCur = '1'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalECC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '1'
	and UMatricpl.Periodo <= '4'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesECC_QueComem
from Glogin
*/
/* 
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Segunda = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Terca = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Quarta = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Quinta = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 1 and Sexta = 1

Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Segunda = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Terca = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Quarta = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Quinta = 1
Select sum(Almoco) from Z_AlmocoFunc where codFilial = 2 and Sexta = 1
*/

/*
SELECT DISTINCT UMATRICPL.MATALUNO, UMatricpl.codcur as AlunosNAOalmocam
FROM UMATRICPL 
INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
WHERE UMATRICPL.PERLETIVO = @SchoolYear 
AND UMATRICPL.STATUS IN ('01', '07') 
AND UMATRICPL.MATALUNO NOT IN (SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N')
*/
/*
Select Top 1
	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo >= '6') as TotalSec,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo >= '6' 
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalSEC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor 
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data = @Date
	and EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo = @SchoolYear
	and UMatricpl.Periodo >= '6') as AusentesSEC,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor 
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data = @Date
	and EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo = @SchoolYear
	and UMatricpl.Periodo >= '6'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesSEC_QUEComem,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '5' and Umatricpl.CodCur = '2') as Elementary,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '5' and Umatricpl.CodCur = '2'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalELEM_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '2'
	and UMatricpl.Periodo <= '5') as AusentesELEM,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A', 'AE','P', 'PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '2'
	and UMatricpl.Periodo <= '5'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesELEM_QUEComem,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '4' and Umatricpl.CodCur = '1') as ECC,

	(Select Count(MatAluno) from Umatricpl (Nolock) where Umatricpl.Perletivo =@SchoolYear and UMatricpl.Status in ('01','07') and Umatricpl.Periodo <= '4' and Umatricpl.CodCur = '1'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as TotalECC_QUEComem,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '1'
	and UMatricpl.Periodo <= '4') as AusentesECC,

	(Select count(distinct Ealuocor.mataluno) from EAluOcor
	inner Join UMatricPL (Nolock) on (UmatricPL.MatAluno =  EAluOcor.MatAluno)
	where EAluOcor.Data =@Date
	and  EAluOcor.Status in ('A','AE','P','PE') 
	and UMatricpl.PerLetivo =@SchoolYear
	and UMatricpl.CodCur = '1'
	and UMatricpl.Periodo <= '4'
	and UMatricpl.MatAluno not in (
	SELECT DISTINCT UMATRICPL.MATALUNO as AlunosNAOalmocam FROM UMATRICPL 
	INNER JOIN EALUNOS (NOLOCK) ON (EALUNOS.MATRICULA = UMATRICPL.MATALUNO)
	WHERE UMATRICPL.PERLETIVO = @SchoolYear AND UMATRICPL.STATUS IN ('01', '07') AND UMATRICPL.MATALUNO NOT IN 
	(SELECT EALUSERV.MATALUNO FROM EALUSERV WHERE EALUSERV.PERLETIVO = @SchoolYear AND EALUSERV.PLANO LIKE 'ALMOCO%' AND STATUS = 'N'))) as AusentesECC_QueComem
from Glogin

*/