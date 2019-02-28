Select
	(Select A_NomeReduzido from EAcompl where EACompl.Matricula = UMA.MatAluno), 
	isnull((Select cast(C1 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ1,
	isnull((Select cast(A1 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ1,
	isnull((Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP1Q1,
	isnull((Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP2Q1,
	isnull((Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '1' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP3Q1,
	isnull((Select cast(C2 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ2,
	isnull((Select cast(A2 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ2,
	isnull((Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP1Q2,
	isnull((Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP2Q2,
	isnull((Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '2' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP3Q2,
	isnull((Select cast(C6 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ3,
	isnull((Select cast(A6 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ3,
	isnull((Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP1Q3,
	isnull((Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP2Q3,
	isnull((Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '6' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP3Q3,
	isnull((Select cast(C7 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ4,
	isnull((Select cast(A7 as Varchar) from UMatAlun where UMatAlun.PerLetivo =UMA.PerLetivo and UMatAlun.CodMat like '%MUS' and UMatAlun.Mataluno=UMA.MatAluno), '-') as NotaQ4,
	isnull((Select case when P1 = '0' then 'NA' else Substring(cast(P1 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP1Q4,
	isnull((Select case when P2 = '0' then 'NA' else Substring(cast(P2 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP2Q4,
	isnull((Select case when P3 = '0' then 'NA' else Substring(cast(P3 as varchar),0,2) End From EAlunoTPR where EAlunoTPR.Perletivo =UMA.PerLetivo and EAlunoTPR.CodMat like '%MUS' and EAlunoTPR.CodEtp = '7' and EALUNOTPR.Mataluno=UMA.MatAluno and EALUNOTPR.CodTur=UMA.CodTur), '-') as NotaP3Q4
from UMatAlun UMA
where UMA.PerLetivo = '07/08'
and UMA.Status in ('01','07')
and UMA.CodMat like ('%MUS')
and UMA.CodCur = 2
and UMA.CodPer = 1
Order by UMA.CodMat