select 
	Matricula,
	A_NOMEREDUZIDO,
  	Case 
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then rtrim(EACompl.A_Nacional1)
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2)
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2) + '/' + rtrim(Eacompl.A_Nacional3)
	end as Nationality,

	(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = EACompl.Matricula and UMatAlun.Perletivo =UMatricpl.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level, 
	M_DataRequisicaoSaida,
	A_DATASAIDAISC , A_LEFTISC_2,
	Case when A_LEFTISC_2 is null then A_DATASAIDAISC else A_LEFTISC_2 end as DataSaida,
	
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 2 and EITEMTLIV.CODITEMTAB = M_BrazilianDocs) as BrazilianDocs,
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 2 and EITEMTLIV.CODITEMTAB = M_AmericanDocs) as AmericanDocs,
	
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 3 and EITEMTLIV.CODITEMTAB = M_STATUSTRANSFERENCIA) as DeliveryStatus,
	M_DATAENTREGADOCS  as DeliveryDate,
	
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 4 and EITEMTLIV.CODITEMTAB = M_MotivoSaida) as Reason,

	M_MotivoAdicional as Reason2

from UMATRICPL
inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
where UMATRICPL.PERLETIVO ='10/11'
and UMATRICPL.STATUS in ('02','03','14', '01','07')
and (A_DATASAIDAISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
or  A_LEFTISC_2 >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )
Order By DataSaida
