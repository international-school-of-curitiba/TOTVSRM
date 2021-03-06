set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER Trigger [t_iscSaude]
On [dbo].[EALUNOS]
For Insert
As
/*
***************************************************************************************************************
*	SCRIPT CRIADO EM: 22-09-2005						*
*	SCRIPT ATUALIZADO EM: 10-11-2006						*
*	ATUALIZAÇÃO: Alteração dos scripts para não alterar o que já foi			*
*		inserido. Foi criado em forma de trigger na tabela				*
*		elunos para que ao se incluir um novo aluno 				*
*		automaticamente seja inserido o texto para a aba saúde			*
*											*
*	ATUALIZADO POR AURÉLIO GABRIEL DA SILVA  EM 17-11-2005:		*
*		FOI RETIRADO O chr(13)+ NO FINAL DE CADA LINHA PARA 		*
*		REDUZIR O SALTO DE LINHAS NO RELATÓRIO			*
*											*
*	AUTOR: ALEXANDRE DE ARAUJO						*
*	FUNÇÃO: INSERIR CAMPOS TEXTOS NA ABA SAÚDE.				*
*	TIPO: FORA DO ESCOPO							*
*	MOTIVO: OS FORMULÁRIOS DE SAÚDE DA INSTITUIÇÃO SÃO SEPARADOS	*
*		POR VÁRIOS ITENS DE SAÚDE, COMO REMÉDIO PARADOR DE 	*
*		CABEÇA, REMÉDIO PARA DOR DE ESTÔMAGO, ETC. E O SISTEMA	*
*		TEM SOMETNE UM CAMPO MEMO PARA REMÉDIOS, SENDO ASSIM	*
*		ESTE SCRIPT CRIA OS CAMPOS TEXTOS FORMTADOS NO CAMPO	*
*		MEMO PARA SEREM ALIMENTADOS.					*
*	AUTORIZADO: Fábio Rocco.							*
*	COMANDOS:	[]DTS  []FUNCTIONS  []PROCIDURES  [x]INSERT  		*
*			[]UPDATE  []DELETE  [x]TRIGGER   []CURSOR			*
***************************************************************************************************************
TABELAS ENVOLVIDAS:
SAÚDE - Select * from Ealusaude
***************************************************************************************************************
				INÍCIO
			Criação de Alergias
***************************************************************************************************************
*/
insert eAluSaude(codcoligada,mataluno,alergias,Medicos,Tratamentos,Remedios,SocHosp,ObsSaude)
	Select 1, Matricula ,
		-- Alergias
		'Pain: '+ char(13)+
		'Headache: '+ char(13)+
		'Stomach Ache: '+ char(13)+
		'Diarrhea: '+ char(13)+
		'Fever: ' + char(13)+
		'Allergy: '+ char(13)+
		'Flu/Cold/Sore Throat:  '+ char(13)+
		'Indigestion: '+ char(13)+
		'Vomiting: '
		,
		-- Médicos
		'Contact: '+ char(13)+
		'Phone: '+ char(13)+
		'Physician: '+ char(13)+
		'Phone: ',
		-- Tratamento
		'Sarampo: '+ char(13)+
		'Varicela: '+ char(13)+
		'Difteria: '+ char(13)+
		'Febre Escarlatina: '+ char(13)+
		'Coqueluche: '+ char(13)+
		'Rubéola: '+ char(13)+
		'Alergia: '+ char(13)+
		'Problemas de Saúde: '
		,
		-- Remédios
		'Measles: '+ char(13)+
		'Chicken Pox: '+ char(13)+
		'Diphtheria: '+ char(13)+
		'Scarlet Fever: ' + char(13)+
		'Pertussis: '+ char(13)+
		'German Measles: '+ char(13)+
		'Allergies: '+ char(13)+
		'Health Problems: ' 
		,
		-- Socorro Hospitalar
		'Dor: '+ char(13)+
		'Dor de Cabeça: '+ char(13)+ 
		'Dor de Estômago: '+ char(13)+
		'Diarréia: '+ char(13)+
		'Febre: '+ char(13)+
		'Cólica Menstrual: '+ char(13)+
		'Alergia: '+ char(13)+
		'Resfriado/Dor de Garganta: '+ char(13)+
		'Indigestão: '+ char(13)+
		'Vômito: '
		,
		-- Observações de Saúde
		'Contato: '+ char(13)+
		'Telefone: '+ char(13)+
		'Médico: '+ char(13)+
		'Telefone: '
	From eAlunos
where matricula not in (select mataluno from eAluSaude)
/*
***************************************************************************************************************
				FIM
***************************************************************************************************************
*/




