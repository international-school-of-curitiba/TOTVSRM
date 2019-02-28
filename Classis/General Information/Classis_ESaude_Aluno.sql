insert eAluSaude(codcoligada,mataluno,alergias,Medicos,Tratamentos,Remedios,SocHosp,ObsSaude)
	Select 1, Matricula ,
		-- Alergias
		'',
		-- Médicos
		'Name: '+ char(13)+
		'Telephone: '+ char(13)+
		'Telephone: '+ char(13),
		-- Tratamento
		'',
		-- Remédios
		'Pain: '+ char(13)+
		'Headache: '+ char(13)+
		'Stomach Ache: '+ char(13)+
		'Diarrhea: '+ char(13)+
		'Fever: '+ char(13)+
		'Menstrual Cramps: '+ char(13)+
		'Allergies: '+ char(13)+
		'Flu/Cold/Sore Throat: '+ char(13)+
		'Indigestion: '+ char(13)+
		'Vomiting: ',
		-- Socorro Hospitalar
		'',
		-- Observações de Saúde
		'Blood Type: '+ char(13)+
		'Immunizations: '+ char(13)+
		'Childhood Ilnesses: '+ char(13)+
		'Emergency' + char(13)+
		'Name: '+ char(13)+ 
		'Telephone: '+ char(13)+
		'Telephone: '+ char(13)
	From eAlunos
where matricula not in (select mataluno, * from eAluSaude)
/*
***************************************************************************************************************
				FIM
***************************************************************************************************************
*/




