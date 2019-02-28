


Update IBem
set Chapafuncatual = (select Ibem.Chapafuncatual from Ibem where Ibem.CodBem = INossa.agregado),
CodLocalAtual = (select Ibem.CodlocalAtual from Ibem where Ibem.CodBem = INossa.agregado)
from ibem INossa
Where
INossa.codbem like '07.%'
and INossa.agregado is not null
