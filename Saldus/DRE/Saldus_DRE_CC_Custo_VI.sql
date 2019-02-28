Select * from Clanca
where LCTREF not in (
Select LCTREF, * from CRATEIOlc
where Codconta > '4')
and Debito is not null
and Debito >= '4.1.02'  and debito < '4.1.04'
and data between '09/01/2006' and '02/28/2007'
Compute sum(Valor)



Select * from Clanca
where LCTREF not in (
Select LCTREF from CRATEIOlc
where Codconta > '4')
and credito is not null
and credito >= '4.1.02'  and credito < '4.1.04'
and data between '08/01/2006' and '02/28/2007'
Compute sum(Valor)