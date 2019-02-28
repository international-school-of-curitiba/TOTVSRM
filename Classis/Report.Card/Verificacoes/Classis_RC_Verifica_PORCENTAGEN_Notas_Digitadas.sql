Select top 1 100 - 
	case 
    when (Select top 1 CodEtapa from UEtapas where datainicio <= getdate() and datatermino >= getdate() -7) = 1 then 
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1' and A1 is null) as Decimal)/
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1') as Decimal) * 100
	When (Select top 1 CodEtapa from UEtapas where datainicio <= getdate() and datatermino >= getdate() -7) = 2 then 
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1' and A2 is null) as Decimal)/
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1') as Decimal) * 100
	When (Select top 1 CodEtapa from UEtapas where datainicio <= getdate() and datatermino >= getdate()-7)= 8 then 
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1' and A6 is null) as Decimal)/
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1') as Decimal) * 100
	When (Select top 1 CodEtapa from UEtapas where datainicio <= getdate() and datatermino >= getdate()-7)= 7 then 
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1' and A7 is null) as Decimal)/
	cast((Select Count(*) from Umatalun (Nolock) where perletivo = '08/09' and status in ('01', '07', '04') and CodMat in (select codmat from UMaterias where segundonome = 'us') and Codcur <> '1') as Decimal) * 100
	end 
from Ealunos

