Select * from isc.dbo.Criteria


Select * from isc.dbo.measure where me_criteria = 8

-- insert into isc.dbo.measure values ('Measures of Academic Progress (MAP)', 'Measures of Academic Progress (MAP)','8')
-- Update isc.dbo.measure set me_name = 'ERB - Writing Assessment Program (Grades 3 to 11)' where me_id = 3
-- Update isc.dbo.measure set me_name = '% of Students Receiving the Following Cumulative GPA' where me_id = 17


Select * from isc.dbo.subject where su_measure = 20 order by su_id

-- insert into isc.dbo.subject values ('Grade 9', '2')
-- insert into isc.dbo.subject values ('High Honor Roll HS', '19')

-- insert into isc.dbo.subject values ('English A2 SL', '5')
-- insert into isc.dbo.subject values ('Portuguese A2 SL', '5')

Select * from isc.dbo.score where sc_measure = 20 order by sc_id

--insert into isc.dbo.score values ('Max. Score', '2')

Select * from isc.dbo.achiev_data where ad_subject = 55 and ad_schoolyear ='08/09' and ad_score = 49 --login 4 = Fabio.rocco

Select * from isc.dbo.achiev_data order by ad_id desc  
-- Insert (Subject, Score, Login, VALUE, date, schooyear)
-- update isc.dbo.achiev_data set ad_Value = '67' where ad_id = 2793

update isc.dbo.achiev_data set ad_subject = '72' where ad_id between 2847 and 2851

-- insert into isc.dbo.achiev_data values ('1', '3', '4', '2', getdate(), '08/09')
-- Total
/*
   insert into isc.dbo.achiev_data values ('98', '2', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('110', '60', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('74', '91', '4', '2', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('110', '62', '4', '2', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('171', '27', '4', '2', getdate(), '08/09')


   insert into isc.dbo.achiev_data values ('2', '3', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('2', '6', '4', '2', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('3', '1', '4', '2', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('3', '3', '4', '3', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('3', '4', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('3', '5', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('3', '6', '4', '7', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('4', '2', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('4', '6', '4', '1', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('6', '4', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('6', '6', '4', '1', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('9', '2', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('9', '6', '4', '1', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('98', '3', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('98', '6', '4', '1', getdate(), '08/09')


   insert into isc.dbo.achiev_data values ('105', '2', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('105', '6', '4', '1', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('106', '3', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('106', '6', '4', '1', getdate(), '08/09')

   insert into isc.dbo.achiev_data values ('103', '1'  , '4', '3', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '2'  , '4', '3', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '3'  , '4', '8', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '4'  , '4', '2', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '102', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '103', '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '5'  , '4', '1', getdate(), '08/09')
   insert into isc.dbo.achiev_data values ('103', '6'  , '4', '17', getdate(), '08/09')

*/


/*	ERB WRAP */
-- Insert (Subject, Score, Login, VALUE, date, schooyear)

	Declare @Subject as nvarchar(4)
	Declare @Value1 as nvarchar(4)
	Declare @Value2 as nvarchar(4)
	Declare @Value3 as nvarchar(4)
	Declare @Value4 as nvarchar(4)
	Declare @Value5 as nvarchar(4)
	Declare @Value6 as nvarchar(4)

	Set @Subject = '3'

	Set @Value1 = '1'
	Set @Value2 = '2'
	Set @Value3 = '1'
	Set @Value4 = '4'
	Set @Value5 = '4.0'
	Set @Value6 = '4.1'

	insert into isc.dbo.achiev_data values (@Subject, '2', '4', @Value1, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '3', '4', @Value2, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '4', '4', @Value3, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '6', '4', @Value4, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '15', '4', @Value5, getdate(), '10/11')
	insert into isc.dbo.achiev_data values (@Subject, '16', '4', @Value6, getdate(), '10/11')
 