Select distinct Nome_Familia, Nome_Pessoa1, Nacionalidade_Pessoa1, Endereco1_Pessoa1,
endereco2_pessoa1, cep_Pessoa1, HomePhone_Pessoa1, CellPhone_Pessoa1, EMail_Pessoa1 
from VW_Info_Familia vw
inner join ZFamilia (NoLock) on ( Zfamilia.Pessoa1 = vw.Pessoa1 and ZFamilia.Pessoa2 = vw.pessoa2) 
where Nacionalidade_Pessoa1 = 'Brasileira'
and ZFamilia.perletivo = '06/07'
and ZFamilia.Status in ( '01','07')
and ZFamilia.pessoa1 not in (

Select Pessoa1 from ZFamilia
inner join eacompl (NoLock) on (Eacompl.Matricula = Zfamilia.Matricula)
and Eacompl.A_Publica = 'No'
and Perletivo = '06/07')