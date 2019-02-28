begin tran

Declare @Dissidio as float

set @Dissidio = 6.36

Update PFCODFIX
set	VALOR =
	(Select Cast(Round((Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60)) ,2) as Money) +
	Cast(Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) as Money) + 
    Cast(Round((Round(Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)),2) * (isnull(JORNADA/60,JORNADAMENSAL/60))/6 ,2) +
   (Round((SALARIO/(isnull(JORNADA/60,JORNADAMENSAL/60))) * (1 + (@Dissidio/100)) * (isnull(JORNADA/60,JORNADAMENSAL/60)),2))) * 0.12 ,2) as Money)) * 0.05,2) as money) as NovoAntecipacao
	from  PFUNC where Pfunc.CHAPA = PFCODFIX.CHAPA)
where
CODEVENTO in(0026, 0022)
and CHAPA in (Select CHAPA from PFUNC where CODSITUACAO not in('D','U') and CODTIPO <> 'A' and CHAPA not in('000660','00589', '000538'))

Commit