Select distinct
	chapa, 
--	Nomecracha, 
	LANGUAGE, secLANGUAGE, thirdlang
	--Isnull((Select DESCRICAO from GCONSIST where CODTABELA = 'Language' and CODCLIENTE = LANGUAGE),'') + '/'+
	--Isnull((Select DESCRICAO from GCONSIST where CODTABELA = 'Language' and CODCLIENTE = SECLANGUAGE),'') + '/' +
	--Isnull((Select DESCRICAO from GCONSIST where CODTABELA = 'Language' and CODCLIENTE = THIRDLANG),'')
	from PFCOMPL
where CHAPA in (
Select CHAPA from PFUNC where CODSITUACAO = 'A' and CODTIPO <> 'A')
order by 
	LANGUAGE, secLANGUAGE, thirdlang
