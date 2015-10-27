/*
XQuery
- query()
- value()
- exist()
- modify()
- nodes()

if query, value, exist is executed against a NULL XML instance, they all return null
*/

CREATE TABLE XqeryTable(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	productXML XML NULL
)

--INSERT INTO 

select * from Production.ProductModel