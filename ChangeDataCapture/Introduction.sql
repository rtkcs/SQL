CREATE DATABASE TEST_DB_CDC;
GO

USE TEST_DB_CDC;
GO

-- new user cdc and schema cdc is created

EXEC sp_cdc_enable_db
GO

SELECT [name] as DbName, is_cdc_enabled
from sys.databases;


CREATE TABLE dbo.Person(
	PersonId INT NOT NULL primary key identity(1,1),
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Email nvarchar(100) NULL
)
GO

EXEC sp_cdc_enable_table
	@source_schema = N'dbo',
	@source_name = N'Person',
	@role_name = N'cdc_admin',
	@capture_instance = N'dbo_Person',
	@supports_net_changes = 1;
	
SELECT [name] as TableName, is_tracked_by_cdc
from sys.tables;	

INSERT INTO dbo.Person values( N'Michael', N'Jackson', N'michael@jackson.com');
INSERT INTO dbo.Person values( N'Bruno', N'Ossif', N'bruno@ossif.com');
INSERT INTO dbo.Person values( N'Tom', N'Cruise', N'tom@cruise.com');
INSERT INTO dbo.Person values( N'Angelina', N'Jolie', N'angelina@jolie.com');

select * from dbo.Person;
select * from cdc.dbo_Person_CT;

DELETE FROM dbo.Person where PersonId = 4;

UPDATE dbo.Person SET FirstName=N'George', LastName=N'Clooney', Email='george@clooney.com' where PersonId = 1;

-- CDC tables

select * from cdc.captured_columns;
select * from cdc.ddl_history
select * from cdc.change_tables
select * from cdc.index_columns
select * from cdc.lsn_time_mapping

-- access CDC data
DECLARE @start_dt datetime, 
		@end_dt datetime, 
		@from_lsn binary(10), 
		@to_lsn binary(10);
		
SET @start_dt = GETDATE()-1;
SET @end_dt = GETDATE();

SELECT @from_lsn = sys.fn_cdc_map_time_to_lsn('smallest greater than or equal', @start_dt);
SELECT @to_lsn = sys.fn_cdc_map_time_to_lsn('largest less than or equal', @end_dt);

print @from_lsn;
print @to_lsn;

SELECT @start_dt, @end_dt, @from_lsn, @to_lsn;

SELECT * FROM cdc.fn_cdc_get_all_changes_dbo_Person(@from_lsn, @to_lsn, 'all');
SELECT * FROM cdc.fn_cdc_get_net_changes_dbo_Person(@from_lsn, @to_lsn, 'all');
 