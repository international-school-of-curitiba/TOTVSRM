Select distinct	Flan.codcfo, FcFo.Nome, Ealunos.matricula, Ealunos.nome, datavencimento
from 	FLan
	left join FcFo (NoLock) on (FcFo.CodCFO = Flan.CodCFO)
	left Join Ealunos (NoLock) on (Ealunos.Respons = Flan.CodCFO)
where 	codtdo = '000016' 
and datavencimento in 
	(Select distinct datavencimento from FLan
	where  codtdo = '000016' and datavencimento between '02/01/2006' and '02/28/2006')
order by Flan.datavencimento,Flan.CodCfo