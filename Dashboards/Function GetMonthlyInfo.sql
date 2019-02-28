/*
	Autor: Fagner C. S. Marques
	Data: 25/10/2017
	Descrição: 
		A função recebe o anoletivo como parâmetro no formato abreviado (17/18)
		Retorna uma tabela com a movimentação do Resultado nas contas desconsiderando histórico de fechamento
		Para que a conta seja apresentada corretamente o lançamento contábil deve necessáriamente ter um histórico
*/
Create Function GetMonthlyInfo(
	@perletivo as varchar(20))

returns @MonthlyTable table(
	indice int,
	cdReduzido varchar(20), 
	dsConta varchar(40),
	agosto float, setembro float, outubro float, novembro float, dezembro float, janeiro float, 
	fevereiro float, marco float, abril float, maio float, junho float, julho float, budget float
) as 
Begin
	-- 
	/*Variáveis locais para controle interno da função - contas de agrupamento*/
	DECLARE @reduzido varchar(20), @descricao varchar(40), @containi varchar(40), @contafim varchar(40), @numini int, @numfim int, @contador as int
	DECLARE @t_ago float, @t_set float, @t_out float, @t_nov float, @t_dez float, @t_jan float, @t_feb float
	DECLARE @t_mar float, @t_apr float, @t_may float, @t_jun float, @t_jul float, @t_budget float

	/*Variáveis para segundo nivel */
	DECLARE @rs_Reduzido varchar(20), @rs_Descricao varchar(40) 
	DECLARE @rs_Agosto float, @rs_Setembro float, @rs_Outubro float, @rs_Novembro float, @rs_Dezembro float, @rs_Janeiro float
	DECLARE @rs_Fevereiro float, @rs_Marco float, @rs_Abril float, @rs_Maio float, @rs_Junho float, @rs_Julho float, @rs_budget float
	DECLARE @x int, @y int, @cont_externo int

	set @contador = 1
	set @numini = 1
	set @numfim = (
				SELECT MAX(A.RowNum) AS maximo FROM (
					SELECT ROW_NUMBER() OVER(Order by CConta.Codconta) AS RowNum FROM CCONTA
					WHERE CCONTA.REDUZIDO IN(202,267,448,464,426,376,395,401,409,414,437,479,492,487)
					)AS A
				) 	
				
	while @numini <= @numfim

	begin
		-- recupera os dados para  tabela de retorno
		set @reduzido = (select a.reduzido from (SELECT ROW_NUMBER() OVER(Order by CConta.Codconta) AS RowNum,* FROM CCONTA WHERE CCONTA.REDUZIDO IN(202, 267,448,464,426,376,395,401,409,414,437,479,492,487)) as a where RowNum = @numini)
		set @descricao = (select a.DESCRICAO from (SELECT ROW_NUMBER() OVER(Order by CConta.Codconta) AS RowNum,* FROM CCONTA WHERE CCONTA.REDUZIDO IN(202, 267,448,464,426,376,395,401,409,414,437,479,492,487)) as a where RowNum = @numini)
		set @containi = (select a.CODCONTA from (SELECT ROW_NUMBER() OVER(Order by CConta.Codconta) AS RowNum,* FROM CCONTA WHERE CCONTA.REDUZIDO IN(202, 267,448,464,426,376,395,401,409,414,437,479,492,487)) as a where RowNum = @numini)
		set @contafim = (select a.contafim from (SELECT ROW_NUMBER() OVER(Order by CConta.Codconta) AS RowNum, CCONTA.CODCONTA + '.9999' as contafim FROM CCONTA WHERE CCONTA.REDUZIDO IN(202, 267,448,464,426,376,395,401,409,414,437,479,492,487)) as a where RowNum = @numini)
		--select 1 as nivel, @reduzido as reduzido, @descricao as descricao, @containi as containi, @contafim as contafim
		set @x= 1
		set @y = 
			(
				SELECT MAX(B.RowNum) as Maximo FROM	(
				SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum
					FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
					JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
					WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
					AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
					OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
					and CPCCOMPL.ORCAMENTO = '01') as B
			)
		set @cont_externo = @contador
		set @t_ago = 0
		set @t_set = 0
		set @t_out = 0
		set @t_nov = 0
		set @t_dez = 0
		set @t_jan = 0
		set @t_feb = 0
		set @t_mar = 0
		set @t_apr = 0
		set @t_may = 0
		set @t_jun = 0
		set @t_jul = 0
		set @t_budget = 0
		
		while @x <= @y
		begin
			set @cont_externo += 1
			set	@rs_Descricao = (SELECT B.DESCRICAO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, CCONTA.DESCRICAO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Reduzido = (SELECT B.REDUZIDO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, CCONTA.REDUZIDO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Agosto = (SELECT B.AGOSTO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.AugustBegin AND Z_SchoolCalendar.AugustEnd AND CPARTIDA.CODHISTP NOT IN (sELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.AugustBegin AND Z_SchoolCalendar.AugustEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS AGOSTO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Setembro = (SELECT B.SETEMBRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.SeptemberBegin AND Z_SchoolCalendar.SeptemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) -  
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.SeptemberBegin AND Z_SchoolCalendar.SeptemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS SETEMBRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Outubro = (SELECT B.OUTUBRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.OctoberBegin AND Z_SchoolCalendar.OctoberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.OctoberBegin AND Z_SchoolCalendar.OctoberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS OUTUBRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Novembro = (SELECT B.NOVEMBRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.NovemberBegin AND Z_SchoolCalendar.NovemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.NovemberBegin AND Z_SchoolCalendar.NovemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS NOVEMBRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Dezembro = (SELECT B.DEZEMBRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.DecemberBegin AND Z_SchoolCalendar.DecemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.DecemberBegin AND Z_SchoolCalendar.DecemberEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS DEZEMBRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Janeiro = (SELECT B.JANEIRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JanuaryBegin AND Z_SchoolCalendar.JanuaryEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JanuaryBegin AND Z_SchoolCalendar.JanuaryEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS JANEIRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Fevereiro = (SELECT B.FEVEREIRO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.FebruaryBegin AND Z_SchoolCalendar.FebruaryEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.FebruaryBegin AND Z_SchoolCalendar.FebruaryEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS FEVEREIRO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Marco = (SELECT B.MARCO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.MarchBegin AND Z_SchoolCalendar.MarchEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.MarchBegin AND Z_SchoolCalendar.MarchEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS MARCO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Abril = (SELECT B.ABRIL FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.AprilBegin AND Z_SchoolCalendar.AprilEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.AprilBegin AND Z_SchoolCalendar.AprilEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS ABRIL
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Maio = (SELECT B.MAIO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.MayBegin AND Z_SchoolCalendar.MayEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.MayBegin AND Z_SchoolCalendar.MayEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS MAIO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Junho = (SELECT B.JUNHO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JuneBegin AND Z_SchoolCalendar.JuneEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JuneBegin AND Z_SchoolCalendar.JuneEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS JUNHO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set	@rs_Julho = (SELECT B.JULHO FROM (
									SELECT ROW_NUMBER () OVER (ORDER BY CCONTA.CODCONTA) as RowNum, 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.DEBITO  = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JulyBegin AND Z_SchoolCalendar.JulyEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) - 
									ISNULL((SELECT SUM(VALOR) FROM CPARTIDA WHERE CPARTIDA.CREDITO = CCONTA.CODCONTA AND CPARTIDA.DATA BETWEEN Z_SchoolCalendar.JulyBegin AND Z_SchoolCalendar.JulyEnd AND CPARTIDA.CODHISTP NOT IN (SELECT CODHISTP FROM CHISTP WHERE CHISTP.HISTFECHA = 1)),0) AS JULHO
									FROM CCONTA JOIN Z_SchoolCalendar (NOLOCK) ON (Z_SchoolCalendar.CodPerlet = @perletivo)
									JOIN CPCCOMPL (NOLOCK) ON (CPCCOMPL.CODCONTA = CCONTA.CODCONTA)
									WHERE CCONTA.CODCONTA >= @containi AND CCONTA.CODCONTA <= @contafim
									AND (CCONTA.CODCONTA IN (SELECT CPARTIDA.DEBITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd)
									OR   CCONTA.CODCONTA IN (SELECT CPARTIDA.CREDITO FROM CPARTIDA WHERE CPARTIDA.DATA >= Z_SchoolCalendar.AugustBegin AND CPARTIDA.DATA <= Z_SchoolCalendar.JulyEnd))
								and CPCCOMPL.ORCAMENTO = '01') as B WHERE RowNum = @x)
			set @rs_budget = isnull( (SELECT ISNULL(SUM(CAST(OIT.VALORORCADO AS MONEY)),0) AS VALORORC FROM TTBORCAMENTO N
									INNER JOIN TORCAMENTO O ON N.CODTBORCAMENTO = O.CODTBORCAMENTO
									INNER JOIN TITMORCAMENTO OIT ON OIT.IDPERIODO = O.IDPERIODO AND OIT.IDORCAMENTO = O.IDORCAMENTO
									LEFT JOIN CCONTA C ON C.REDUZIDO = N.CAMPOLIVRE
									LEFT JOIN GCCUSTO CC ON CC.CODCCUSTO = O.CODCCUSTO 
									WHERE N.CAMPOLIVRE = @rs_Reduzido AND
										O.IDPERIODO = (
															SELECT IDPERIODO FROM TPERIODOORCAMENTO	WHERE 
															DATAINICIO >= (SELECT AugustBegin FROM Z_SchoolCalendar WHERE CodPerlet = @perletivo)
																AND DATAFIM <= (SELECT JulyEnd FROM Z_SchoolCalendar WHERE CodPerlet = @perletivo))
																AND CC.CODREDUZIDO NOT LIKE '31%' AND CC.CODREDUZIDO NOT LIKE '41%'
									GROUP BY N.CAMPOLIVRE
			),0)

			insert @MonthlyTable(indice,cdReduzido,dsConta,agosto,setembro,outubro,novembro,dezembro,janeiro,fevereiro,marco,abril,maio,junho,julho, budget)
			select @cont_externo, @rs_Reduzido,@rs_Descricao, @rs_Agosto, @rs_Setembro, @rs_Outubro, @rs_Novembro, @rs_Dezembro, @rs_Janeiro, @rs_Fevereiro, @rs_Marco, @rs_Abril, @rs_Maio, @rs_Junho, @rs_Julho, ISNULL(@rs_budget,0);
			set @x += 1
			set @t_ago += @rs_Agosto
			set @t_set += @rs_Setembro
			set @t_out += @rs_Outubro
			set @t_nov += @rs_Novembro
			set @t_dez += @rs_Dezembro
			set @t_jan += @rs_Janeiro
			set @t_feb += @rs_Fevereiro
			set @t_mar += @rs_Marco
			set @t_apr += @rs_Abril
			set @t_may += @rs_Maio
			set @t_jun += @rs_Junho
			set @t_jul += @rs_Julho
			set @t_budget += @rs_budget

		end
		insert @MonthlyTable(indice,cdReduzido,dsConta,agosto,setembro,outubro,novembro,dezembro,janeiro,fevereiro,marco,abril,maio,junho,julho, budget)
		select @contador, @reduzido, @descricao, @t_ago, @t_set, @t_out, @t_nov, @t_dez, @t_jan, @t_feb, @t_mar, @t_apr, @t_may, @t_jun, @t_jul, @t_budget;
		set @numini += 1
		set @contador += @cont_externo
		set @cont_externo = 0
	end
	return
end