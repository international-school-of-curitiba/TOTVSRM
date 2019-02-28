Select 
	'Pre-Toddler A' as ProxTurma, 
	0 as Corporate, 
	(select COUNT(Ealunos.Matricula) from Ealunos 
			inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
			inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
	where 
			UMatricpl.Perletivo ='11/12'
		and UMatricpl.Status = '18'
		and Umatricpl.CODCUR = 1
		and Umatricpl.CODPER = 1
		and UMATRICPL.PERIODO = 0
		and Ealunos.TipoAluno in (3,4)) 
	as NewCorporate,
	0 as LocalTemp,
	(select COUNT(Ealunos.Matricula) from Ealunos 
			inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
			inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
	where 
			UMatricpl.Perletivo ='11/12'
		and UMatricpl.Status = '18'
		and Umatricpl.CODCUR = 1
		and Umatricpl.CODPER = 1
		and UMATRICPL.PERIODO = 0
		and Ealunos.TipoAluno in (1,2)) 
	as NewLocalTemp,
	0 as Scholarship,
	0 as NewScholarship,
	0 as Staff,
	(select COUNT(Ealunos.Matricula) from Ealunos 
			inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
			inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
	where 
			UMatricpl.Perletivo ='11/12'
		and UMatricpl.Status = '18'
		and Umatricpl.CODCUR = 1
		and Umatricpl.CODPER = 1 
		and UMATRICPL.PERIODO = 0
		and Ealunos.TipoAluno = 5) 
	as NewStaff,
	0 as NPStaff,
	0 as Ordem,
	1 as Codcur,
	1 as Codper,
	'Pre-Toddler A' as Codtur,
	12 as MAXALUNOS,
	1 as Quebra$$, 'Nossa'

UNION



Select  distinct
		ProxTurma,
		(Select COUNT(Distinct EACompl.Matricula) from 	UMatricPL UMPL
			Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMPL.MatAluno)
			Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMPL.MatAluno)
			Inner Join Z_SchoolCalendar (NoLock) on (Z_SchoolCalendar.CodPerlet = '10/11')
			Inner Join UMATALUN UMAL (NoLock) on (UMAL.PERLETIVO = '10/11' and UMAL.MATALUNO = UMPL.MATALUNO)
		Where ((UMPL.PerLetivo = UMAL.PerLetivo and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC > '07/31/2012')
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 > '07/31/2012')) 
		and (Ealunos.TipoAluno in (3,4))
		and Z_SchoolCalendar.CodPerlet = '10/11'
		and UMPL.Status in ('01', '07')
		and UMAL.CODTUR = UMATTURMA.CODTUR)as Corporate,
	
		ISNULL(
		Case 
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA != '1A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (3,4))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA = '1A' then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 1  
					and Ealunos.TipoAluno in (3,4)
					and UMA.CODTUR = '1A')
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA != '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (3,4))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA = '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 2 
					and UMA.CODTUR = '6A'
					and Ealunos.TipoAluno in (3,4))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA != '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (3,4))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA = '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 3
					and UMA.CODPER = 1 
					and UMA.CODTUR = '9A'
					and Ealunos.TipoAluno in (3,4))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 3  and CodPer = 1  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (3,4)) 
			end,0) as NewCorporate,
				
		(Select COUNT(Distinct EACompl.Matricula) from 	UMatricPL UMPL
			Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMPL.MatAluno)
			Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMPL.MatAluno)
			Inner Join Z_SchoolCalendar (NoLock) on (Z_SchoolCalendar.CodPerlet = '10/11')
			Inner Join UMATALUN UMAL (NoLock) on (UMAL.PERLETIVO = '10/11' and UMAL.MATALUNO = UMPL.MATALUNO)
		Where ((UMPL.PerLetivo = UMAL.PerLetivo and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC > '07/31/2012')
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 > '07/31/2012')) 
		and (Ealunos.TipoAluno in (1,2))
		and Z_SchoolCalendar.CodPerlet = '10/11'
		and UMPL.Status in ('01', '07')
		and UMAL.CODTUR = UMATTURMA.CODTUR )as LocalTemp,
		
		ISNULL(
		Case 
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA != '1A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (1,2))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA = '1A' then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 1  
					and Ealunos.TipoAluno in (1,2)
					and UMA.CODTUR = '1A')
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA != '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (1,2))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA = '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 2 
					and UMA.CODTUR = '6A'
					and Ealunos.TipoAluno in (1,2))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA != '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (1,2))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA = '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 3
					and UMA.CODPER = 1 
					and UMA.CODTUR = '9A'
					and Ealunos.TipoAluno in (1,2))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 3  and CodPer = 1  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (1,2)) 
			end,0) as NewLocalTemp,
	
		(Select COUNT(Distinct EACompl.Matricula) from 	UMatricPL UMPL
			Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMPL.MatAluno)
			Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMPL.MatAluno)
			Inner Join Z_SchoolCalendar (NoLock) on (Z_SchoolCalendar.CodPerlet = '10/11')
			Inner Join UMATALUN UMAL (NoLock) on (UMAL.PERLETIVO = '10/11' and UMAL.MATALUNO = UMPL.MATALUNO)
		Where ((UMPL.PerLetivo = UMAL.PerLetivo and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC > '07/31/2012')
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 > '07/31/2012')) 
		and (Ealunos.TipoAluno in (6))
		and Z_SchoolCalendar.CodPerlet = '10/11'
		and UMPL.Status in ('01', '07')
		and UMAL.CODTUR = UMATTURMA.CODTUR )as Scholarship,
	
		ISNULL(
		Case 
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA != '1A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (6))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA = '1A' then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 1  
					and Ealunos.TipoAluno in (6)
					and UMA.CODTUR = '1A')
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA != '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (6))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA = '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 2 
					and UMA.CODTUR = '6A'
					and Ealunos.TipoAluno in (6))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA != '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (6))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA = '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 3
					and UMA.CODPER = 1 
					and UMA.CODTUR = '9A'
					and Ealunos.TipoAluno in (6))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 3  and CodPer = 1  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (6)) 
			end,0) as NewScholarship,
	
		(Select COUNT(Distinct EACompl.Matricula) from 	UMatricPL UMPL
			Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMPL.MatAluno)
			Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMPL.MatAluno)
			Inner Join Z_SchoolCalendar (NoLock) on (Z_SchoolCalendar.CodPerlet = '10/11')
			Inner Join UMATALUN UMAL (NoLock) on (UMAL.PERLETIVO = '10/11' and UMAL.MATALUNO = UMPL.MATALUNO)
		Where ((UMPL.PerLetivo = UMAL.PerLetivo and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC > '07/31/2012')
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 > '07/31/2012')) 
		and (Ealunos.TipoAluno in (5))
		and Z_SchoolCalendar.CodPerlet = '10/11'
		and (Select Top 1 codbol from EaluBolsa where Perletivo = '10/11' and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
		and UMPL.Status in ('01', '07')
		and UMAL.CODTUR = UMATTURMA.CODTUR )as Staff,
		
		ISNULL(
		Case 
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA != '1A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (5))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 1  and CodPer = 1 and PROXTURMA = '1A' then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
					inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
					inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 1  
					and Ealunos.TipoAluno in (5)
					and UMA.CODTUR = '1A')
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA != '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (5))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 1 and PROXTURMA = '6A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 2
					and UMA.CODPER = 2 
					and UMA.CODTUR = '6A'
					and Ealunos.TipoAluno in (5))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA != '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and (Select Top 1 codbol from EaluBolsa where Perletivo = '10/11' and EaluBolsa.MatAluno = EAlunos.Matricula) != 100
					and Ealunos.TipoAluno in (5))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 2  and CodPer = 2 and PROXTURMA = '9A'  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = 3
					and UMA.CODPER = 1 
					and UMA.CODTUR = '9A'
					and Ealunos.TipoAluno in (5))
			When substring(reverse(PROXTURMA),1,1) = 'A' and CodCur = 3  and CodPer = 1  then 
				(select COUNT(Distinct Ealunos.Matricula) from Ealunos 
						inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
						inner join UMatAlun UMA (NoLock) on (UMA.MataLuno = Ealunos.Matricula)
					where 
						UMA.Perletivo ='11/12'
					and UMA.Status = '18'
					and UMA.CODCUR = UMATTURMA.CodCur 
					and UMA.CODPER = UMATTURMA.CodPer 
					and UMA.CODTUR = UMATTURMA.PROXTURMA
					and Ealunos.TipoAluno in (5)) 
			end,0) as NewStaff,
		
		
		(Select COUNT(Distinct EACompl.Matricula) from 	UMatricPL UMPL
			Inner Join EACompl   (NoLock) on (EACompl.Matricula  = UMPL.MatAluno)
			Inner Join EAlunos   (NoLock) on (EAlunos.Matricula  = UMPL.MatAluno)
			Inner Join Z_SchoolCalendar (NoLock) on (Z_SchoolCalendar.CodPerlet = '10/11')
			Inner Join UMATALUN UMAL (NoLock) on (UMAL.PERLETIVO = '10/11' and UMAL.MATALUNO = UMPL.MATALUNO)
		Where ((UMPL.PerLetivo = UMAL.PerLetivo and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_DataEntradaISC <= '07/31/2011' and A_DataSaidaISC > '07/31/2012')
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 is null) 
		OR 	(UMPL.PerLetivo = '10/11' and A_ReturnedToISC <= '07/31/2011' and A_LeftISC_2 > '07/31/2012')) 
		and (Ealunos.TipoAluno in (5))
		and Z_SchoolCalendar.CodPerlet = '10/11'
		and (Select Top 1 codbol from EaluBolsa where Perletivo = '10/11' and EaluBolsa.MatAluno = EAlunos.Matricula) = 100
		and UMPL.Status in ('01', '07')
		and UMAL.CODTUR = UMATTURMA.CODTUR )as MPStaff,
		
		Case when UMATTURMA.Codcur = 1 then 0 else len(Nometurma) end as ORDEM,
		UMATTURMA.CODCUR, 
		UMATTURMA.CODPER, 
		CODTUR, MAXALUNOS,
		1 as Quebra$$, CODTUR

from  UMATTURMA
Where UMATTURMA.CODPERLET = '11/12' and UMATTURMA.CODTUR not in ('MS_Elective', 'HS_Elective', 'NEBRASKA', '12A', '12B')
order by ORDEM, MAXALUNOS, CODTUR



