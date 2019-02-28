Declare @FROMschoolYear as varchar(5)
Declare @TOschoolYear as varchar(5)


Set @FROMschoolYear = '08/09'
set @TOschoolYear = '09/10' 


Insert into 
corpore.dbo.UdataAval (
	CodColigada,
	CodFilial,
	CodPerLet,
	Codmat,
	CodTur,
NumProva,
PontConc,
Pontnum,
AulasPrevistas,
AulasDadas,
TotalTurma,
UsuarDigNotas,
TotalFaltas,
UsuarDigFaltas,
NotaFalta,
CodEtapa,
MediaProva,
Descricao)

Select 
	CodColigada,
	CodFilial,
	@TOschoolYear,
	Codmat,
	CodTur,
NumProva,
PontConc,
Pontnum,
AulasPrevistas,
AulasDadas,
TotalTurma,
UsuarDigNotas,
TotalFaltas,
UsuarDigFaltas,
NotaFalta,
CodEtapa,
MediaProva,
Descricao 
from corpore_teste.dbo.UDataAval 
where codperlet = @FROMschoolYear
and codtur in (Select distinct Codtur from UMatTurma where CodPerlet = @TOschoolYear)


--Select  CODPERLET, CODMAT, CODTUR from UMatTurma where CodPerlet = '09/10' and codtur = '4B'

/*
and Codtur <>'1A'
and CodMat like '300%'
and substring(codmat,1,1) = 3
and substring(codmat,3,1) = 6
and substring(CodTur,3,1) = 'A'
*/