USE [MIM]
GO
-------------------------------------------------------- create assemblies
CREATE ASSEMBLY [Products2ConsoleMeta]
AUTHORIZATION [dbo]
FROM 'C:\Zaloha\SQL\Assembly\100315_1600\Products2ConsoleMeta.dll'
WITH PERMISSION_SET = UNSAFE
GO

CREATE ASSEMBLY [Products2ConsoleMeta.XmlSerializers]
AUTHORIZATION [dbo]
FROM 'C:\Zaloha\SQL\Assembly\100315_1600\Products2ConsoleMeta.XmlSerializers.dll'
WITH PERMISSION_SET = UNSAFE
GO

Alter assembly Products2ConsoleMeta
add file from 'C:\Zaloha\SQL\Assembly\100315_1600\Products2ConsoleMeta.pdb'
GO


CREATE ASSEMBLY [Products2Console]
AUTHORIZATION [dbo]
FROM 'C:\Zaloha\SQL\Assembly\100315_1600\Products2Console.dll'
WITH PERMISSION_SET = UNSAFE
GO

CREATE ASSEMBLY [Products2Console.XmlSerializers]
AUTHORIZATION [dbo]
FROM 'C:\Zaloha\SQL\Assembly\100315_1600\Products2Console.XmlSerializers.dll'
WITH PERMISSION_SET = UNSAFE
GO

Alter assembly Products2Console
add file from 'C:\Zaloha\SQL\Assembly\100315_1600\Products2Console.pdb'
GO

---------------------------------------------------------- Create Stored Procedures
CREATE PROCEDURE [dbo].[CreateEntity]
	@sEntity [nvarchar](255)
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [Products2Console].[Products2Console.StoredProcedures].[CreateEntity];
GO

CREATE PROCEDURE [dbo].[CreateRelations]
	@sEntity [nvarchar](255)
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [Products2Console].[Products2Console.StoredProcedures].[CreateRelations];
GO

CREATE PROCEDURE [dbo].[DeleteRecord]
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [Products2Console].[Products2Console.StoredProcedures].[DeleteRecord];
GO
