Select Distinct
	 	VW_Family.Family,
		(Select Top 1 Matricula from VW_Youngest
		 Where	VW_Family.Pessoa1 = VW_Youngest.Pessoa1
		 and	VW_Family.Pessoa2 = VW_Youngest.Pessoa2
		 Order by VW_Youngest.DtNasc Desc) As Matricula,
		(Select Top 1 Nome from VW_Youngest
		 Where	VW_Family.Pessoa1 = VW_Youngest.Pessoa1
		 and	VW_Family.Pessoa2 = VW_Youngest.Pessoa2
		 Order by VW_Youngest.DtNasc Desc) As Nome,
		(Select top 1 Umatalun.CodTur from UMatAlun 
		where UMatAlun.MatAluno in (Select Top 1 Matricula from VW_Youngest Where VW_Family.Pessoa1 = VW_Youngest.Pessoa1 
		and VW_Family.Pessoa2 = VW_Youngest.Pessoa2 Order by VW_Youngest.DtNasc Desc)) as GradeLevel,
		VW_Family.Lingua
From VW_Family
Order by GradeLevel desc

