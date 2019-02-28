Select 
	DLAF.CodCFO,
	DLAF.UFMunicipioServ,
	FCFO.CodETD,
	DLAF.CodMunicipioServ,
	FCFO.CodMunicipio
from DLAF, FCFO
where DLAF.CodCFO = FCFO.CodCFO

Update DLAF
set DLAF.UFMunicipioServ = FCFO.CodETD,
	DLAF.CodMunicipioServ = FCFO.CodMunicipio
from DLAF, FCFO
where DLAF.CodCFO = FCFO.CodCFO

