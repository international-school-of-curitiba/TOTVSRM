Select 
	'Pre-Toddler A' as NextGL, 
	0 as Corp, 
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
	0 as PendLeavingStaff,
	12 as MaxSize,
	17 as MaxSizeWithAid,
	1 as Quebra$,
	0 as CodCur,
	0 as CodPer,
	0 as Periodo

UNION

Select 
	Case 
		When CodCur= 1 and CodPer = 1 and Periodo < 4 then
			(Select distinct PROXTURMA from UMATTURMA where UMATTURMA.CODPERLET = '10/11' and UMATTURMA.PROXTURMA is not null and CODTUR = GradeLevel)
		When CodCur= 1 and CodPer = 1 and Periodo = 4 then
			(Select distinct 'Grade '+ PROXTURMA from UMATTURMA where UMATTURMA.CODPERLET = '10/11' and UMATTURMA.PROXTURMA is not null and CODTUR = GradeLevel)
		Else
			(Select distinct 'Grade '+ PROXTURMA from UMATTURMA where UMATTURMA.CODPERLET = '10/11' and UMATTURMA.PROXTURMA is not null and CODTUR = Substring(GradeLevel,7,3)) 
	End as NextGL,
	
	Corporate + PendEnterCorp - PendLeavingCorp as Corp,
	Case 
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo < 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo = 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 1
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo < 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo = 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 2
			and UMATRICPL.PERIODO = 6
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo < 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo = 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 9
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo < 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (3,4))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo = 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 12
			and Ealunos.TipoAluno in (3,4))
	Else 
		0
	end as NewCorporate, 
	LocalTemp + PendEnterLocal - PendLeavingLocal as LocalTemp,
	Case 
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo < 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo = 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 1
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo < 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo = 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 2
			and UMATRICPL.PERIODO = 6
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo < 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo = 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 9
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo < 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno in (1,2))
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo = 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 12
			and Ealunos.TipoAluno in (1,2))
	Else 
		0
	end as NewLocalTemp, 
	Scholarship,
	Case 
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo < 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo = 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 1
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo < 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo = 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 2
			and UMATRICPL.PERIODO = 6
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo < 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo = 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 9
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo < 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 6)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo = 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 12
			and Ealunos.TipoAluno = 6)
	Else 
		0
	end as NewScholarship, 
	Staff , PendEnterStaff +
	Case 
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo < 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 1  and CodPer = 1 and Periodo = 4 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 1
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo < 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 1 and Periodo = 5 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 2
			and Umatricpl.CODPER = 2
			and UMATRICPL.PERIODO = 6
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo < 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 2  and CodPer = 2 and Periodo = 8 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 9
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo < 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = ClassSummary.CodCur 
			and Umatricpl.CODPER = ClassSummary.CodPer 
			and UMATRICPL.PERIODO = ClassSummary.Periodo + 1
			and Ealunos.TipoAluno = 5)
			
		When substring(reverse(GradeLevel),1,1) = 'A' and CodCur = 3  and CodPer = 1 and Periodo = 12 then 
			(select COUNT(Ealunos.Matricula) from Ealunos 
				inner Join EAcompl (NoLock) on (Eacompl.Matricula = Ealunos.Matricula)
				inner join Umatricpl (NoLock) on (UMatricpl.MataLuno = Ealunos.Matricula)
			where 
				UMatricpl.Perletivo ='11/12'
			and UMatricpl.Status = '18'
			and Umatricpl.CODCUR = 3
			and Umatricpl.CODPER = 1
			and UMATRICPL.PERIODO = 12
			and Ealunos.TipoAluno = 5)
	Else 
		0
	end as NewStaff, 
	NPStaff, PendLeavingStaff,
	MaxSize,
	MaxSizeWithAid, 
        1 as  Quebra$,
        ClassSummary.CodCur, ClassSummary.CodPer, ClassSummary.Periodo
	
From ClassSummary('10/11', '05/06/2011', '07/31/2011')
Where Periodo != 12
Order by CodCur, CodPer, Periodo