Select * 
from ZFamilia
Inner Join EACompl (NoLock) on (EAcompl.Matricula = ZFamilia.Matricula and ZFamilia.Perletivo = '06/07' and EACompl.A_Publica = 'YES')