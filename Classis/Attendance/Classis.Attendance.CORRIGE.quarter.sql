
Select data, codocorrencia, * from EAluOcor
where data >= (Select datainicio from UEtapas where codperlet = '08/09' and codetapa = 6)
and data <= (Select datatermino from UEtapas where codperlet = '08/09' and codetapa = 6)
and CodGRPOcor = 1
and codocorrencia != 6


/*
update EAluOcor
set codocorrencia = 7
where data >= (Select datainicio from UEtapas where codperlet = '08/09' and codetapa = 7)
and data <= (Select datatermino from UEtapas where codperlet = '08/09' and codetapa = 7)
and CodGRPOcor = 1
and codocorrencia != 7

*/