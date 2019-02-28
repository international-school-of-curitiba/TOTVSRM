Select 
	chapa, Nome, Dataadmissao as Data_$, 
	Case 
		when datepart(M,Dataadmissao) = 7 then
			(select top 1 OBS from EPerlet where DTInicio <= Dataadmissao + 10 and DTFim >= Dataadmissao + 10)
		else	
			(select OBS from EPerlet where DTInicio <= Dataadmissao and DTFim >= Dataadmissao)
	End SchoolYear,
	(Select Nome from PFuncao where PFuncao.Codigo = CodFuncao) as Funcao,
	(PFunc.Jornadamensal/60) as Jornada,
	(Select Round(PFFinanc.Valor/PFFinanc.Ref,2) from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0003') as SalarioHora,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0003') as SalarioTotal,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento in ('0026','0022')) as Antecipacao,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0118') as DSR,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0218') as HoraAtividade,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0225') as Quinquenio,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0101') as Abono,
	(Select PFFinanc.Valor from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento = '0123') as Habitacao,
	(Select Sum(PFFinanc.Valor) from PFFinanc where PFFinanc.Chapa = PFunc.Chapa and MesComp = 9 and anocomp = 2009 and CodEvento in (Select Codigo from PEvento where ProvDescBase = 'P')) as TotalProvento

from PFunc where CodRecebimento = 'H' and codSituacao = 'A' and CodTipo = 'N' and PFunc.CodFuncao not in('0012200', '00122100')
and dataadmissao >= '08/01/2000' and dataadmissao <= '07/31/2001'
Order by DataAdmissao, Funcao

--Select OBS, DTinicio, DTFim from EPerlet order by DTInicio

--Select * from Z_SchoolCalendar order by AugustBegin 