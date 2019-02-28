Create View Emails AS
(Select Ealunos.nome,
	Ealunos.mae, 
	(Select Ppessoa.Email from Ppessoa where Ppessoa.codigo = Ealunos.mae) as Email_Mae, 
	Ealunos.pai,
	(Select Ppessoa.Email from Ppessoa where Ppessoa.codigo = Ealunos.pai) as Email_Pai, 
	Ealunos.respacad,
	(Select Ppessoa.Email from Ppessoa where Ppessoa.codigo = Ealunos.Respacad) as Email_responsavel 
from Ealunos
	inner join Young (NoLock) on (Ealunos.matricula = Young.matricula)
	inner join Ppessoa (Nolock) on (Ppessoa.codigo = Ealunos.mae)
)
GO
Select * from Emails where Email_Mae = Email_Pai
select * from Emails where Email_Mae = Email_Responsavel
select * from Emails where Email_pai = Email_Responsavel

drop view Emails