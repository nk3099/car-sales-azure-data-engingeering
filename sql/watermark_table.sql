create table watermark_table
(
last_data_load Varchar(2000)
)

select * from watermark_table


--selecting watermark--
select min(Date_ID) from [dbo].[source_cars_data]

INSERT INTO [dbo].[watermark_table]
VALUES ('DT00000')

  
—-results:1849 rows--in both queries:--
select count(*) from [dbo].[source_cars_data] where Date_ID>'DT00000'

select count(*) from [dbo].[source_cars_data]
