Select  Distinct 
	Matricula,
	A_Familia,
	Fam_name 
from 	Eacompl
	Inner join Family (NoLock) on (Eacompl.A_Familia = Family.fam_name)

Update 	EAcomPL 
set 	A_EmailIng = 'Ingl�s'
where 	EACompl.A_familia in (
		Select Fam_Name from Family where Fam_mail_e = '1' )

Update 	EAcomPL 
set 	A_EmailIng = 'Portugu�s'
where 	EACompl.A_familia in (
		Select Fam_Name from Family where Fam_mail_e = '0' )

Select * from EAcomPL where A_EmailIng = 'Ingl�s'

Select Fam_Name from Family where Fam_Name = 'Zornig Pereira'

Update Family set Fam_Name = 'Agulhan' where Fam_Name = 'Agulham'

