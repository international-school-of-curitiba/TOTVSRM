Select 
	LCTREF,
	CLanca.Valor,
	CodHistp,
	Complemento, --substring(Complemento,1,6), substring(Complemento,8,255), substring(Complemento,7,1),
	Documento, Clanca.IntegraChave,
	substring(Complemento,0,18) + (Select historico from FCFO (Nolock) where FCFO.CODCFO = FLAN.CODCFO),
	(Select historico from FCFO (Nolock) where FCFO.CODCFO = FLAN.CODCFO), Data
from CLanca (NoLock)
Right join  Flan (NoLock) on (cast(FLan.idlan as varchar)= substring(Clanca.IntegraChave,2,8)) 
where Complemento like '%Salário%'  AND  --len(Complemento) =  7 
data >= '08/01/2007'
and CodHistp = 007
and Debito = '1.1.03.001.0001.0003'
order by lctref


/*


Update Clanca --Complemento + ' ' + Documento +' '+ (Select Nome from FCFO where FCFO.CODCFO = FLAN.CODCFO)
Set Complemento = 	substring(Complemento,0,18) + (Select historico from FCFO (Nolock) where FCFO.CODCFO = FLAN.CODCFO)
from CLanca
Right join  Flan (NoLock) on (cast(FLan.idlan as varchar)= substring(Clanca.IntegraChave,2,8)) 
where Complemento like '%Salário%'  AND  --len(Complemento) =  7 
data >= '08/01/2007'
and CodHistp = 007
and len(Complemento) = 25
and Debito = '1.1.03.001.0001.0003'

*/

--Select * from CLanca where lctref = '39776'
--Select Codcfo,* from FLan where idlan = '23697'