Select 
	PFunc.Chapa,
	nome, 
	Case 
		when Language = '001' then 'English'
		when Language = '002' then 'Portuguese'
	Else ''
	end,
	Case 
		when SecLanguage = '001' then 'English'
		when SecLanguage = '002' then 'Portuguese'
		when SecLanguage = '005' then 'German'
	Else ''
	end,
	Case 
		when ThirdLang = '001' then 'English'
		when ThirdLang = '002' then 'Portuguese'
		when ThirdLang = '005' then 'German'
	Else ''
	end,
	FuncaoIngles 
from PFunc
Inner Join PFCompl (NoLock) on (PFCompl.Chapa = PFunc.Chapa)
Where PFunc.CodSituacao != 'D' and CodTipo != 'A'
and CodFilial = 1
order by Nome