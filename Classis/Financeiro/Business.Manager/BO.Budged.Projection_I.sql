
--Create view Z_BudgedProjection AS
Select 
	EAluServ.PerLetivo,
	EAluServ.MatAluno,
	EAluServ.Plano,
	EmodConCT.Parcela, EmodConCT.DtVencimento,
	EmodConCT.Servico,
EmodConCT.ValorDevido,
Case When TipoDesc = 'V' then Ealubolsa.PercDesc else (Ealubolsa.PercDesc/100)*
(select sum(valor) from EmodConpC EmodConpC_I 
Inner Join EmodContr (NoLock) on ( EmodContr.CodMod = EmodConpC_I.Modelo and EmodContr.CodPerlet = EmodConpC_I.CodPerlet) 
inner Join EaluServ (NoLock) on (EaluServ.PerLetivo = EmodConpC_I.CodPerlet and EaluServ.MatAluno = Ealubolsa.MatAluno and EaluServ.Plano = EmodConpC_I.Modelo) 
Inner Join Z_SchoolCalendar (NoLock) on (Ealubolsa.Perletivo = Z_SchoolCalendar.CodPerlet) 
where EmodConpC_I.CodPerlet = Ealubolsa.perletivo and EmodConpC_I.CodServ = Ealubolsa.CodServico and EmodConpC_I.Parcela= EmodConCT.Parcela) end AS Desconto,
EmodConCT.ValorDevido -
Case When TipoDesc = 'V' then Ealubolsa.PercDesc else (Ealubolsa.PercDesc/100)*
(select sum(valor) from EmodConpC 
Inner Join EmodContr (NoLock) on ( EmodContr.CodMod = EmodConpC.Modelo and EmodContr.CodPerlet = EmodConpC.CodPerlet)
inner Join EaluServ (NoLock) on (EaluServ.PerLetivo = EmodConpC.CodPerlet and EaluServ.MatAluno = Ealubolsa.MatAluno and EaluServ.Plano = EmodConpC.Modelo)
 Inner Join Z_SchoolCalendar (NoLock) on (Ealubolsa.Perletivo = Z_SchoolCalendar.CodPerlet) 
where EmodConpC.CodPerlet = Ealubolsa.perletivo and EmodConpC.CodServ = Ealubolsa.CodServico and EmodConpC.Parcela= EmodConCT.Parcela) end AS AReceber

from  EAluServ
Inner Join EmodConCT (NoLock) on (EmodConCT.CodPerLet = EAluServ.Perletivo and EAluServ.Plano = EmodConCT.Modelo) 
Inner Join Ealubolsa (NoLock) on (Ealubolsa.MatAluno = EALuServ.MatAluno and Ealubolsa.Perletivo = EAluServ.Perletivo and Ealubolsa.CodServico = EmodConCT.Servico)
Inner Join EACompl (NoLock) on (Eacompl.Matricula = Ealubolsa.MatAluno)
where EAluServ.Perletivo = '09/10'
and EALuServ.MatAluno = 00700
and EAluServ.Status = 'N' and EAluServ.DataCancelamento is null
--and EmodConCT.DtVencimento between '09/01/2009' and '09/30/2009'

Union

Select 
	EAluServ.PerLetivo,
	EAluServ.MatAluno,
	EAluServ.Plano,
	EmodConCT.Parcela, EmodConCT.DtVencimento,
	EmodConCT.Servico,
	EmodConCT.ValorDevido, 0 as Desconto,
	EmodConCT.ValorDevido as APagar,DataCancelamento
from  EAluServ
Inner Join EmodConCT (NoLock) on (EmodConCT.CodPerLet = EAluServ.Perletivo and EAluServ.Plano = EmodConCT.Modelo) 
Inner Join EACompl (NoLock) on (Eacompl.Matricula = EALuServ.MatAluno)
where EAluServ.Perletivo = '09/10'
and EALuServ.MatAluno = 00700
EAluServ.Status = 'N' and EAluServ.DataCancelamento is null
--and EmodConCT.DtVencimento between '09/01/2009' and '09/30/2009'
and EmodConCT.Servico not in (
Select Ealubolsa.CodServico from EAluBolsa where Ealubolsa.MatAluno = EALuServ.MatAluno and Ealubolsa.Perletivo = EAluServ.Perletivo)



Validar a data de saida do aluno para projecao
Adicionar o adiantamento