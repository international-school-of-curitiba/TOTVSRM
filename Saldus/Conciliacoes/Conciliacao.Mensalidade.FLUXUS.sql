SELECT distinct	1,
 (Select NomeFantasia from FCFO where FCFO.CODCFO = Flan1.CODCFO) as Quebra$, 
 flan1.databaixa,
 Case 
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 1 then 'Jan'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 2 then 'Fev'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 3 then 'Mar'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 4 then 'Abr'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 5 then 'Mai'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 6 then 'Jun'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 7 then 'Jul'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 8 then 'Ago'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 9 then 'Set'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 10 then 'Out'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 11 then 'Nov'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 12 then 'Dec'	
 end + '/' + Cast(DATEPART(YY,Flan1.DATAVENCIMENTO)as CHAR) ,

 EDESC.PARCELA,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 1 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) 
- Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0001'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2)),0) Anuidade,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc in (2) AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) 
- Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0002'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2)),0) TaxasEscolares,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 9 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) TaxasAssociacao,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 4 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) ESL,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 19 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) 
- Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0006'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2)),0) HorExt,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 8 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) ReservaCorp,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc in (13,6)AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) 
- Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0008'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2)),0) ClarineteFlauta,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 10 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 0) Avaliacao,
(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 7 AND FLan.StatusLan <> 2 AND Flan.classificacao <> 15 AND EDescLan.CodLanc = FLan.IdLan AND EDescLan.PerLetivo= EDESC.PERLETIVO AND Flan.StatusLan = 0) FUNDODES,
Flan1.CODCFO
FROM
EDescLan EDESC 
Left Join EACompl (NoLock) on (EACOMPL.MATRICULA = EDESC.MATALUNO)
Left join FLan Flan1 (NoLock) on (Flan1.idLan = EDesc.CodLanc)
Left Join UMatricpl (NoLock) on (UMatricpl.MatAluno = EDESC.MatAluno and UMatricpl.Perletivo = EDesc.Perletivo)
Left Join UMatAlun (Nolock) on (UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMatAlun.PERLETIVO = EDESC.PERLETIVO AND UMatricPL.Status in ('01', '07','04'))
Left Join EAlunos (NoLock) on (EDESC.MATALUNO = EAlunos.Matricula)
Left Join UTabTipo (Nolock) on (Ealunos.TipoAluno = UTabTipo.CodTipo)
WHERE
	Flan1.DATAVENCIMENTO <='02/28/2011'
and Flan1.pagrec = 1
and Flan1.statuslan = '0'

Union

SELECT distinct 2,
 (Select NomeFantasia from FCFO where FCFO.CODCFO = Flan1.CODCFO) as Quebra$, 
  flan1.databaixa,
 Case 
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 1 then 'Jan'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 2 then 'Fev'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 3 then 'Mar'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 4 then 'Abr'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 5 then 'Mai'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 6 then 'Jun'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 7 then 'Jul'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 8 then 'Ago'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 9 then 'Set'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 10 then 'Out'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 11 then 'Nov'
	when DatePart(MM,Flan1.DATAVENCIMENTO) = 12 then 'Dec'	
 end + '/' + Cast(DATEPART(YY,Flan1.DATAVENCIMENTO)as CHAR) ,
 
EDESC.PARCELA,

 Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0001'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011')),0) 
 -Isnull((select Isnull(VALOR,0)  from FLANCONT where FlanCont.CODCONTA = '3.1.03.002.0001.0002' and FlanCont.Tipo = 1 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa >'02/28/2011')),0)
 - (Case when Flan1.CODCFO = 'C00487' and DatePart(MM,flan1.DATAVENCIMENTO) = '02' and DATEPART(YY,flan1.DATAVENCIMENTO) = '2011' then '2358.83' else '0' end)
 - (Case when Flan1.CODCFO = 'C00840' and DatePart(MM,flan1.DATAVENCIMENTO) = '02' and DATEPART(YY,flan1.DATAVENCIMENTO) = '2011' then '2987.00' else '0' end) Anuidade,


(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc in (2) AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 1) 
- Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0002'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2  and flan3.databaixa < '02/28/2011')),0)
 - (Case when Flan1.CODCFO = 'C00487' and DatePart(MM,flan1.DATAVENCIMENTO) = '02' and DATEPART(YY,flan1.DATAVENCIMENTO) = '2011' then '162.40' else '0' end) TaxasEscolares,

(SELECT SUM(Flan.ValorOriginal) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 9 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 1 and flan.databaixa = Flan1.DATABAIXA) -
(SELECT isnull(SUM(Flan.VALORBAIXADO),0) FROM EDescLan, FLan WHERE EDescLan.Parcela =EDESC.Parcela AND Flan1.DATAVENCIMENTO = Flan.DATAVENCIMENTO AND Flan.CODCFO = flan1.CODCFO AND EDescLan.TipoLanc = 9 AND EDescLan.CodLanc = FLan.IdLan AND FLan.StatusLan <> 2 AND EDescLan.PerLetivo= EDESC.PERLETIVO  AND Flan.StatusLan = 1 and flan.databaixa < '02/28/2011') TaxasAssociacao,

Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0004'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011')),0) ESL,
Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0006'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011' )),0) HorExt,
Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0007'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011' )),0) ReservaCorp,
Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0008'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011' )),0) ClarineteFlauta,
Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '1.1.02.001.0001.0009'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011' )),0) Avaliacao,
Isnull((select Isnull(VALOR,0) from FLANCONT where FlanCont.CODCONTA = '2.3.01.002.0001.0002'  and FlanCont.Tipo = 2 and FlanCont.IDLAN = (Select top 1 FLAN3.idlan from FLAN Flan3 where FLAN3.CODCFO = flan1.CODCFO and Flan3.IDFAT = Flan1.IDFAT and Flan3.STATUSLAN = 1 and FLAN3.NFOUDUP = 2 and flan3.databaixa > '02/28/2011' )),0) FUNDODES,
Flan1.CODCFO

FROM
EDescLan EDESC 
Left Join EACompl (NoLock) on (EACOMPL.MATRICULA = EDESC.MATALUNO)
Left join FLan Flan1 (NoLock) on (Flan1.idLan = EDesc.CodLanc)
Left Join UMatricpl (NoLock) on (UMatricpl.MatAluno = EDESC.MatAluno and UMatricpl.Perletivo = EDesc.Perletivo)
Left Join UMatAlun (Nolock) on (UMatAlun.MATALUNO = EACOMPL.MATRICULA and UMatAlun.PERLETIVO = EDESC.PERLETIVO AND UMatricPL.Status in ('01', '07','04'))
Left Join EAlunos (NoLock) on (EDESC.MATALUNO = EAlunos.Matricula)
Left Join UTabTipo (Nolock) on (Ealunos.TipoAluno = UTabTipo.CodTipo)
WHERE
	Flan1.DATAVENCIMENTO <='02/28/2011'
and flan1.databaixa > '02/28/2011'
and Flan1.pagrec = 1
and flan1.statuslan <> '2'

Order by Quebra$,  EDESC.PARCELA