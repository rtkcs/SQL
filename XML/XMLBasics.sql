--XML Basics
/*
query()
value()
exist()
modify()
nodes()
*/

USE EncryptTest;
GO

CREATE TABLE tblXMLExample(
	Col1 int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Col2 varchar(20) NULL,
	Col3 xml NULL
)
GO

CREATE TABLE tblXMLExample2(
	Col1 int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Col2 varchar(20) NULL,
	Col3 xml NULL DEFAULT CAST('<sampleElement/>' as xml)
)
GO

-- declare variable using the XML data type
DECLARE @doc xml;
SELECT @doc = '<employee name="Doe, John">';
GO

INSERT INTO tblXMLExample2 (Col2) values ('value1');
INSERT INTO tblXMLExample2 (Col2, Col3) values ('value2','<anotherXMLElement/>');
select * from tblXMLExample2;


/*
- commands to select XML
RAW
AUTO
EXPLICIT
XMLDATA
XMLSCHEMA
ELEMENTS
BINARY BASE64
TYPE
ROOT

- command to load XML:
	- asigning a string to a XML column variable
	- SELECT ... FOR XML
	- bulk load data using OPENROWSET (SINGLE BLOB)

*/
DECLARE @empXML as xml;
SET @empXML = CAST('<employee><id>123</id><name>John Doe</name><title>PR Manager</title></employee>' AS xml);
SELECT @empXML as Employee	

-- FOR XML
SELECT TOP 3 * FROM  AdventureWorks2008.HumanResources.Employee FOR XML AUTO;
SELECT TOP 3 * FROM  AdventureWorks2008.HumanResources.Employee FOR XML RAW;
SELECT TOP 3 * FROM  AdventureWorks2008.HumanResources.Employee FOR XML RAW, ELEMENTS, ROOT('Employees');
SELECT TOP 3 * FROM  AdventureWorks2008.HumanResources.Employee FOR XML AUTO, ELEMENTS;

SELECT TOP 3 * FROM  AdventureWorks2008.HumanResources.Employee as Employee 
	FOR XML AUTO, ELEMENTS, ROOT('Employees'), XMLSCHEMA;
/*
SELECT * FROM  AdventureWorks2008.HumanResources.Employee FOR XML EXPLICIT;
SELECT * FROM  AdventureWorks2008.HumanResources.Employee FOR XML XMLDATA;
SELECT * FROM  AdventureWorks2008.HumanResources.Employee FOR XML XMLSCHEMA;
*/
USE AdventureWorks2008
GO

DECLARE @empXML2 as xml;
SET @empXML2= 
(
	SELECT TOP 3 
		Employee.BusinessEntityID,
		p.LastName + ', ' + p.FirstName AS FullName,
		Employee.JobTitle,
		Employee.BirthDate
	FROM HumanResources.Employee as Employee INNER JOIN Person.Person as p
		ON Employee.BusinessEntityID = p.BusinessEntityID
	FOR XML AUTO, ELEMENTS, ROOT('Employees')
)

SELECT @empXML2 as Employee;


------------------------------------------ OPENROWSET

DECLARE @empXML3 as XML;
SET @empXML3 = 
(
	SELECT * FROM OPENROWSET (BULK 'c:\Projects\SQL\XML\Employee.xml', SINGLE_BLOB) AS xmlProdData
)
print convert(nvarchar(max),@empXML3);
SELECT @empXML3 as data;
GO

-- OPENROWSET example 2
DECLARE @xml TABLE (myxml xml);
insert @XML(myxml)
	SELECT * FROM OPENROWSET(BULK 'c:\Projects\SQL\XML\Employee.xml' , SINGLE_BLOB) as x;
select * from @xml;	

-- OPENROWSET example 3
IF EXISTS(	SELECT * 
			FROM sysobjects 
			WHERE id=OBJECT_ID('tblXMLExample3')
			and type='U')
	DROP TABLE tblXMLExample3;
GO

CREATE TABLE tblXMLExample3(
	Col1 INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	prodXML XML NULL
)	
GO

INSERT INTO tblXMLExample3(prodXML)
SELECT * FROM OPENROWSET(BULK 'c:\Projects\SQL\XML\Employee.xml', SINGLE_BLOB) AS x;
GO

SELECT * FROM tblXMLExample3;
GO

DROP TABLE tblXMLExample3;
------------------------------------------------------ create primary and secondary xml index
CREATE TABLE tblXMLExample4(
	Col1 int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ColXML XML NULL
)
GO

CREATE PRIMARY XML INDEX PIDX_tblXMLExample4_ColXML ON tblXMLExample4(ColXML)
GO

CREATE XML INDEX IDX_tblXMLExample4_ColXML_Path ON tblXMLExample4(ColXML)
	USING XML INDEX PIDX_tblXMLExample4_ColXML
	FOR PATH
GO	

DROP TABLE tblXMLExample4