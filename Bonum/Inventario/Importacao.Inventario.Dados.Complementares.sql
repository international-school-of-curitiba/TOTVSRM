insert into ZInventario values ('1','00081','01.02.016','000632','03','01','10.0.2.31')
insert into ZInventario values ('1','00026','01.02.019','000345','03','01','10.0.2.30')
insert into ZInventario values ('1','00186','01.02.010','000685','03','01','10.0.2.79')
insert into ZInventario values ('1','00174','01.02.010','000685','03','01','10.0.2.82')
insert into ZInventario values ('1','00188','01.02.010','000685','03','01','10.0.2.81')
insert into ZInventario values ('1','00089','01.02.022','000322','03','01','10.0.2.24')
insert into ZInventario values ('1','00225','01.02.022','000332','03','01','10.0.2.23')
insert into ZInventario values ('1','00096','01.02.022','000408','03','01','10.0.2.22')
insert into ZInventario values ('1','00185','01.02.009','000323','03','01','10.0.2.78')
insert into ZInventario values ('1','00183','01.02.009','000323','03','01','10.0.2.76')
insert into ZInventario values ('1','00182','01.02.009','000323','03','01','10.0.2.75')
insert into ZInventario values ('1','00195','01.02.009','000323','03','01','10.0.2.88')


/*
Select 
	ZInventario.*, IBem.CodLocalAtual, IBem.ChapaFuncAtual, IBCompl.SistemaOp, IBCompl.MSOffice, IBCompl.ip
from ZInventario
join IBem (NoLock) on (IBem.CodigoBarra = ZInventario.CodigoBarra)
join IBCompl (NoLock) on (IBCompl.CodBem = IBem.CodBem)
*/

GO
Insert into IBCompl (CodColigada, CodBem,NomedoBem, IP, ClassificacaoBem, SistemaOp, MSOffice)
(Select '1',CodBem, null, IP, null, SistemaOp, MSOffice  from ZInventario
join IBem (NoLock) on (IBem.CodigoBarra = ZInventario.CodigoBarra)
where CodBem not in (Select IBem.CodBem from IBem
join ZInventario (NoLock) on (IBem.CodigoBarra = ZInventario.CodigoBarra)
join IBCompl (NoLock) on (IBCompl.CodBem = IBem.CodBem)))

Go
Update IBem
set IBem.CodLocalAtual = ZInventario.CodLocal, 
	IBem.ChapaFuncAtual = ZInventario.CodResp
from ZInventario
join IBem (NoLock) on (IBem.CodigoBarra = ZInventario.CodigoBarra)
join IBCompl (NoLock) on (IBCompl.CodBem = IBem.CodBem)

go

Update IBCompl
set IBCompl.SistemaOp = ZInventario.SistemaOp, 
	IBCompl.MSOffice = ZInventario.MSOffice, 
	IBCompl.ip = ZInventario.IP 
from ZInventario
join IBem (NoLock) on (IBem.CodigoBarra = ZInventario.CodigoBarra)
join IBCompl (NoLock) on (IBCompl.CodBem = IBem.CodBem)


go
delete ZInventario