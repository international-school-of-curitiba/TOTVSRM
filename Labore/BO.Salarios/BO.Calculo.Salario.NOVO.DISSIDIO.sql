Declare @Dissidio as float

set @Dissidio = 6.36

Select 
	CHAPA,
	NOME, 
	SALARIO,
	isnull(JORNADA/60,JORNADAMENSAL/60),
	Cast(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) , 2 )as money) ValorHora,
	Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60)) ,2) as Money) as NovoSalario ,
	Cast(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)) , 2) as money) as NovoVH,
	Cast(Round((- (Select Valor from PFFINANC where MESCOMP = '03' and ANOCOMP = 2011 and CODEVENTO in ('0022', '0026') and PFFINANC.CHAPA = PFUNC.CHAPA) +
	((Select Valor from PFFINANC where MESCOMP = '03' and ANOCOMP = 2011 and CODEVENTO in ('0022', '0026') and PFFINANC.CHAPA = PFUNC.CHAPA) * 6.36) / 5) * 4 ,2) as money)  as DifDissidio,
	

	Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) as Money) as NovoDSR ,
       
	Cast(Round((Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) +
   (Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)) * (isnull(JORNADA/60,JORNADAMENSAL/60)),2))) * 0.12, 2) as Money)  AS NovoHAT,
		
	
	Cast(Round((Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60)) ,2) as Money) +
	Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) as Money) + 
    Cast(Round((Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) +
   (Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)) * (isnull(JORNADA/60,JORNADAMENSAL/60)),2))) * 0.12 ,2) as Money)) * 0.05,2) as money) as NovoAntecipacao,
	
	CODSITUACAO, CODTIPO
from 
	PFUNC
where CODSITUACAO not in('D','U') and CODTIPO <> 'A'
order by NOME

