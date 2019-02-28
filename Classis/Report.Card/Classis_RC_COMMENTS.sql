Select  RC.*,
	Cast((select Apelido from PPessoa where codigo = EProfes.CodPessoa) as Varchar),
    RC.rc_Comment, TipoProf, UProfMatTurma.CodProf
from 
	 isc.dbo.report_card RC
left join isc.dbo.login login (NoLock) on (login.lo_id = RC.rc_loginadd)
left join UProfMatTurma (NoLock) on (CodPerLet = RC.rc_schoolyear and CodMat = RC.rc_subject and CodTur = RC.rc_grade and TipoProf = 'T')
left join EProfes (NoLock) on (Eprofes.CodProf = UProfMatTurma.CodProf)
Where 	RC.rc_schoolyear ='08/09'
and  	RC.rc_quarter = '1'
--and 	RC.rc_Matricula ='00472'
and rc_comment like '%?%' 


