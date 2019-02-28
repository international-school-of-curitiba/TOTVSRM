Select Zfamilia.Nome, Count(Zfamilia.Matricula) as "NumFilhos", Zfamilia.Pessoa1, Zfamilia.Pessoa2, Zfamilia.Matricula, Eacompl.A_Companhia
from Zfamilia
inner Join Ealunos (nolock) on (Ealunos.Matricula = ZFamilia.Matricula)
inner Join Eacompl (nolock) on (EAcompl.Matricula = ZFamilia.Matricula)
where Zfamilia.perletivo = '06/07' and EAlunos.TipoAluno in ('3','4','6') 
Group by Zfamilia.Nome, Zfamilia.Pessoa1, Zfamilia.Pessoa2,  Zfamilia.Matricula, Eacompl.A_Companhia
Order by A_Companhia 
