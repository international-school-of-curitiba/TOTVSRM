Select 
 CRateioLC.LCTRef,
sum(VlrCredito) valorCredito,
Sum(VlrDebito) valorDebito,
Sum(Valor) valorRateio,
Case 
	when CLCTLOTE.Credito is null then 
		Sum(VlrDebito) - Sum(Valor)
	else
		sum(VlrCredito) - Sum(Valor)
end as Diferenca
from CLCTLOTE 
left join CRateioLC (NoLock) On (CRateioLC.LCTRef = CLCTLote.LCTRef and CLCTLOTE.codlote = CRateioLC.Codlote)
where CLCTLOTE.codlote = 112008
and Debito not like '1.1%'
and Debito not like '2.1%'
Group by CRateioLC.LCTRef, CLCTLOTE.Credito
having Sum(VlrDebito) - Sum(Valor) > 0


Select * from CLCTLOTE where LCTRef = 1750
Select * from CRateioLc where LCTRef = 1750

/* UPDATE das Diferencas

Begin tran 
Update CRateioLC
set  VlrDebito = CLCTLOTE.Valor
from CLCTLOTE 
left join CRateioLC (NoLock) On (CRateioLC.LCTRef = CLCTLote.LCTRef and CLCTLOTE.codlote = CRateioLC.Codlote)
where CLCTLOTE.codlote = 112008
and Debito not like '1.1%'
and Debito not like '2.1%'
and VlrDebito != CLCTLOTE.Valor
Commit