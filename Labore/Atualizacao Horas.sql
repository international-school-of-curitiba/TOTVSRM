/* Atualização das Horas x Referências no Evento de Horas Extra do Labore */

select floor(Ref *60),* 
from 	pffinanc 
where 	AnoComp > '2004' 
and 	CodEvento IN ('0007','0104','0102','0127','0250')


-- Criacao de uma tablea temporaria para transacao das informacoes

Create Table ImpHoras(
	Chapa Int,
	MesComp Int,
	Hora int)

-- Insere os valores da Tabela PfFinanc na ImpHoras 
Insert into ImpHoras 
	select PfFinanc.Chapa, PfFinanc.MesComp, floor(Ref *60) 
	from pffinanc where AnoComp > '2004' and CodEvento IN ('0007','0104','0102','0127','0250')

-- Verifica os inserts 128 linhas afetadas ImpHoras
select * from ImpHoras


-- Atualiza o Campo Horas da PfFinanc com os valores da tabela ImpHoras
update 	PfFinanc set PfFinanc.Hora = ImpHoras.Hora 
From ImpHoras, PfFinanc
Where  	PfFinanc.Chapa = ImpHoras.Chapa
And	PfFinanc.MesComp = ImpHoras.MesComp
and 	PfFinanc.AnoComp > '2004' 
and 	PfFinanc.CodEvento IN ('0007','0104','0102','0127','0250')

-- Verifica os inserts 128 linhas afetadas na PfFinanc 
Select * from PfFinanc where AnoComp > '2004' and CodEvento IN ('0007','0104','0102','0127','0250')

-- Apagar a Tabela temporária de Importaca ImpHoras
Drop Table ImpHoras