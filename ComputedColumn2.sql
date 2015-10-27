----------------------------------------------------------------------------------
ALTER FUNCTION dbo.getPhoneToInt(@ContactId as uniqueidentifier)
	RETURNS int 
WITH SCHEMABINDING
AS BEGIN
	DECLARE @telNo as int;
	-- set @telNo = 123;
	
	-- t·to Ëasù funkcie pristupuje k t·dam, 
	-- preto sa ned· pouûiù ako PERSISTED column a vytvoriù nad nÌm index
	select @telNo = convert(int, right(cb.telephone1,9))
	from  dbo.ContactBase cb
	where cb.ContactId=@ContactId and
	cb.telephone1 is not null and isnumeric(right(cb.telephone1,9))=1 and
	(	charindex('+',cb.telephone1)=0 and 
		charindex('*',cb.telephone1)=0 and 
		charindex('-',cb.telephone1)=0 and
		charindex(' ',cb.telephone1)=0 and
		charindex('.',cb.telephone1)=0 and
		charindex('˙',cb.telephone1)=0 and
		charindex(',',cb.telephone1)=0 and
		charindex('Ú',cb.telephone1)=0 and
		charindex(';',cb.telephone1)=0 and
		charindex('o',cb.telephone1)=0 and
		charindex('#',cb.telephone1)=0
	)
	
	return @telNo;
END
GO
----------------------------------------------------------------------------------
select dbo.getPhoneToInt('F97DE401-3169-DD11-B663-000C29CDCB00')
----------------------------------------------------------------------------------
ALTER TABLE dbo.ContactExtensionBase DROP COLUMN Gti_telephone4
ALTER TABLE dbo.ContactExtensionBase ADD Gti_telephone4 AS dbo.getPhoneToInt(ContactId) --PERSISTED


select COLUMNPROPERTY( OBJECT_ID('dbo.ContactExtensionBase'),'Gti_telephone4','IsIndexable')
select COLUMNPROPERTY( OBJECT_ID('dbo.ContactExtensionBase'),'Gti_telephone4','IsDeterministic')

---- funkcia ktor· sa pouûije na ComputedColumn PERSISTED 
---- musÌ byt Deterministick· (WITH SCHEMABINDING)
---- nesmie maù SystemDataAccess, UserDataAccess
select OBJECTPROPERTY( OBJECT_ID('dbo.getPhoneToInt'), 'IsDeterministic')
select OBJECTPROPERTY( OBJECT_ID('dbo.getPhoneToInt'), 'SystemDataAccess')
select OBJECTPROPERTY( OBJECT_ID('dbo.getPhoneToInt'), 'UserDataAccess')


 