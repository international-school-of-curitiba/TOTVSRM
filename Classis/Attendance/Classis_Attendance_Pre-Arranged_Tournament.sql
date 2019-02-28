/*
Insert into EAluOcor 
	(CodColigada, 
	CodPerlet, 
	MatAluno, 
	Data,
	NumOcorrencia,
	codocorrencia, 
	codgrpocor, 
	Observacao, 
	usuario, 
	Status, 
	C, 
	dtalt, 
	hralt, 
	etapa)
Select 
	'1',		--CodColigada, 
	'08/09',	--CodPerlet, 
	MatAluno, 
	'10/06/2006', 
	NumOcorrencia,
	codocorrencia, 
	codgrpocor, 
	'Pre-Arranged Excused (Tournament)', 
	usuario, 
	Status, 
	C, 
	Getdate(), 
	Getdate(), 
	etapa
from EAluOcor
where mataluno in(
00301, 00254, 00291)
and data = '10/02/2006'

*/
Insert into EAluOcor 
	(CodColigada, 
	CodPerlet, 
	MatAluno, 
	Data,
	NumOcorrencia,
	codocorrencia, 
	codgrpocor, 
	Observacao, 
	usuario, 
	Status, 
	C, 
	dtalt, 
	hralt, 
	etapa)
select 
	1, --CodColigada
	'08/09', --CodPerlet, 
	Matricula, 
	'10/27/2008', 
	(Select ValAutoInc + 1  from GautoInc where codSistema = 'E' and CodAutoInc = 'NUMOCORALUNO'), --NumOcorrencia,
	'2', --codocorrencia, QUARTER
	'1', --codgrpocor, 
	'Skipped School', 
	'Fabio.Rocco',  --usuario, 
	'A', --Status, 
	'S', --C, 
	Getdate(), 
	Getdate(), 
	'2' --etapa
from Ealunos where Matricula in (00332)

