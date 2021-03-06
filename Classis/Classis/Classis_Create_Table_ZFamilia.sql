--Drop Procedure dbo.Familias
-- CREATE Procedure dbo.Familias AS
-- DROP TABLE ZFamilia
CREATE TABLE dbo.ZFAMILIA
( 	NOME		Char(100), 
  	PESSOA1 	Varchar(25),
	CLASS_PESSOA1 	Char(25),
  	PESSOA2		Varchar(25),
  	CLASS_PESSOA2 	Varchar(25),
	LINGUA		Char(25),
	--RecebeEMail	Char(3),
	--Publica	Char(3),
	--Propaganda	Char(3),
	MATRICULA	Varchar(10),
	PERLETIVO	Varchar(6),
	STATUS		Varchar(2),
	DATA 		AS getdate()
)

Select * from ZFamilia
-- Insert into ZFamilia (Nome, Pessoa1,Class_Pessoa1, Pessoa2, Class_Pessoa2, Matricula, Perletivo, Status)
-- Values ('Rocco', '0001','Pai', '0002', 'Mae', '00101', '05/06', '01')

DELETE ZFamilia
Insert into ZFamilia (Nome, Pessoa1,Class_Pessoa1, Pessoa2, Class_Pessoa2, Lingua, Matricula, Perletivo, Status) --RecebeEMail, Publica, Propaganda,
(Select
	EACompl.A_Familia as Familia, 
	Case 
	When EACompl.A_Pessoa1= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa1= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa1= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa1= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa1,
	EACompl.A_Pessoa1 as Class_Pessoa1,
	Case
	When EACompl.A_Pessoa2= 'Pai' then Ealunos.Pai
	When EACompl.A_Pessoa2= 'M�e' then Ealunos.Mae
	When EACompl.A_Pessoa2= 'Respons�vel Financeiro' then Ealunos.Respons
	When EACompl.A_Pessoa2= 'Respons�vel Acad�mico' then Ealunos.RespAcad
	Else '0'
	End as Pessoa2,
	EACompl.A_Pessoa2 as Class_Pessoa2,
	EAcompl.A_EmailIng as Lingua,
	--EAcompl.A_RecebeEMail as RecebeEMail,
	--EAcompl.A_Publica as Publica,
	--EACompl.A_Propaganda as Propaganda, 
	EACompl.Matricula as Matricula,
	UMatricPL.Perletivo As Perletivo,
	UMatricPL.Status
from 	EAcompl (Nolock), Ealunos (nolock), UMatricPL (Nolock)
where	EAcompl.matricula = Ealunos.matricula
	and UMatricPL.Mataluno = Ealunos.matricula
	and UMatricPL.status in ('01','07')
	and EACompl.A_Familia is not Null
)


