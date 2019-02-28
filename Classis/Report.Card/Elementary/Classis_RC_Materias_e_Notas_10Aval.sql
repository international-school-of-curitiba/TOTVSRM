Select distinct
	UDataAval.CodMat, 
        UDataAval.NumProva,
	UDataAval.Descricao,
	cast(Case when UDataAval.NumProva = '1' then 
		(Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' then 
		(Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3' then 
		(Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4' then 
		(Select case when P4 = '0' then 'NA' else Substring(cast(P4 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5' then 
		(Select case when P5 = '0' then 'NA' else Substring(cast(P5 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' then 
		(Select case when P6 = '0' then 'NA' else Substring(cast(P6 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' then 
		(Select case when P7 = '0' then 'NA' else Substring(cast(P7 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  then 
		(Select case when P8 = '0' then 'NA' else Substring(cast(P8 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  then 
		(Select case when P9 = '0' then 'NA' else Substring(cast(P9 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  then 
		(Select case when P10 = '0' then 'NA' else Substring(cast(P10 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	end as varchar) as NotaQ1,
	cast(Case when UDataAval.NumProva = '2' then 
		(Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' then 
		(Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3' then 
		(Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4' then 
		(Select case when P4 = '0' then 'NA' else Substring(cast(P4 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5' then 
		(Select case when P5 = '0' then 'NA' else Substring(cast(P5 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' then 
		(Select case when P6 = '0' then 'NA' else Substring(cast(P6 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' then 
		(Select case when P7 = '0' then 'NA' else Substring(cast(P7 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  then 
		(Select case when P8 = '0' then 'NA' else Substring(cast(P8 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  then 
		(Select case when P9 = '0' then 'NA' else Substring(cast(P9 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  then 
		(Select case when P10 = '0' then 'NA' else Substring(cast(P10 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	end as varchar) as NotaQ2,
	cast(Case when UDataAval.NumProva = '2' then 
		(Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' then 
		(Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3' then 
		(Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4' then 
		(Select case when P4 = '0' then 'NA' else Substring(cast(P4 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5' then 
		(Select case when P5 = '0' then 'NA' else Substring(cast(P5 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' then 
		(Select case when P6 = '0' then 'NA' else Substring(cast(P6 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' then 
		(Select case when P7 = '0' then 'NA' else Substring(cast(P7 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  then 
		(Select case when P8 = '0' then 'NA' else Substring(cast(P8 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  then 
		(Select case when P9 = '0' then 'NA' else Substring(cast(P9 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  then 
		(Select case when P10 = '0' then 'NA' else Substring(cast(P10 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	end as varchar) as NotaQ3,
	cast(Case when UDataAval.NumProva = '1' then 
		(Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '2' then 
		(Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '3' then 
		(Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '4' then 
		(Select case when P4 = '0' then 'NA' else Substring(cast(P4 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '5' then 
		(Select case when P5 = '0' then 'NA' else Substring(cast(P5 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '6' then 
		(Select case when P6 = '0' then 'NA' else Substring(cast(P6 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '7' then 
		(Select case when P7 = '0' then 'NA' else Substring(cast(P7 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '8'  then 
		(Select case when P8 = '0' then 'NA' else Substring(cast(P8 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '9'  then 
		(Select case when P9 = '0' then 'NA' else Substring(cast(P9 as varchar),0,2) End From EAlunoTPR where	EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	     when UDataAval.NumProva = '10'  then 
		(Select case when P10 = '0' then 'NA' else Substring(cast(P10 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodTur = UDataAval.CodTur and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1)
	end as varchar) as NotaQ4
from UDataAval
Right join EAlunoTPR (NoLock) on (EAlunoTPR.Perletivo = UDataAval.CodPerlet and EAlunoTPR.CodMat = UDataAval.CodMat and EAlunoTPR.CodEtp = UDataAval.CodEtapa and EAlunoTPR.CodTur = UDataAval.CodTur )
Inner Join EAlunos (nolock) on (Ealunos.Matricula = EalunoTPR.Mataluno)
Where EALUNOTPR.Mataluno=:Espelho#2 and EALUNOTPR.Perletivo=:Espelho#1
and UDataAval.CodMat =:Espelho#3 