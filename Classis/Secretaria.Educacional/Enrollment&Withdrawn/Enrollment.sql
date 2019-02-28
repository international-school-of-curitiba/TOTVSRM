select 
	Matricula,
	A_NOMEREDUZIDO,
  	Case 
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is null then rtrim(EACompl.A_Nacional1)
		When EACompl.A_Nacional3 is null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2)
		When EACompl.A_Nacional3 is not null and EACompl.A_Nacional2 is not null then rtrim(EACompl.A_Nacional1) + '/'+ rtrim(EACompl.A_Nacional2) + '/' + rtrim(Eacompl.A_Nacional3)
	end as Nationality,

	(Select top 1 UMATALUN.CODTUR from UMatAlun where UMatAlun.MatAluno = EACompl.Matricula and UMatAlun.Perletivo =UMatricpl.Perletivo Group by UMatAlun.CodTur Order by count(UMatAlun.CodTur) desc) as Grade_Level, 

	Case when A_RETURNEDTOISC is null then A_DATAENTRADAISC else A_RETURNEDTOISC end as DataEntrada,
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 9 and EITEMTLIV.CODITEMTAB = M_ENTACORDO) as Contract,
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 9 and EITEMTLIV.CODITEMTAB = M_ENTFORMULARIOFINANCEIRO) as Financial,
	(Select CampoLivre from EITEMTLIV where EITEMTLIV.CODTABLIVRE = 9 and EITEMTLIV.CODITEMTAB = M_ATESTADOMEDICO) as Atestado,
    Case when datepart(MM,(Case when A_RETURNEDTOISC is null then A_DATAENTRADAISC else A_RETURNEDTOISC end)) >= '08' then '1' else '2' end as Quebra$$

from UMATRICPL
inner Join EACOMPL (NoLock) on (EAcompl.Matricula = UMatricpl.MatAluno)
inner Join UMATRICPLLIVRE (NoLock) on (UMATRICPLLIVRE.PERLETIVO = UMATRICPL.PERLETIVO and UMATRICPLLIVRE.MATALUNO = UMATRICPL.MATALUNO and UMATRICPLLIVRE.GRADE= UMATRICPL.GRADE)
where UMATRICPL.PERLETIVO ='10/11'
and UMATRICPL.STATUS in ('01','07')
and (A_DATAENTRADAISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) 
or  A_RETURNEDTOISC >= (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) )

and (A_DATAENTRADAISC between (case when 2 = 1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 2 = 1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end)
or A_RETURNEDTOISC between (case when 2 = 1 then (Select AugustBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JanuaryBegin from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end) and (case when 2 = 1 then (Select DecemberEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) else  (Select JulyEnd from Z_SchoolCalendar where Z_SchoolCalendar.CodPerlet = UMATRICPL.PERLETIVO) end))

--or datepart(MM,A_DATAENTRADAISC) <= (case when 2 = 2 then '08' else '13' end))
--and (A_DATAENTRADAISC ) or A_RETURNEDTOISC ))

Order By Quebra$$, a_NomeReduzido