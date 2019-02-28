
Select distinct
	(select Count(*) from VW_Familia_ECEC) as ECEC,
	(select Count(*) from VW_Familia_Elem) as Elementary,
	(select Count(*) from VW_Familia_SEC) as Secondary,
	(select Count(*) from VW_Familia_Middle) as Middler,
	(select Count(*) from VW_Familia_High) as High,
	(select Count(*) from VW_Familia) as ISC_Families
from Ealunos