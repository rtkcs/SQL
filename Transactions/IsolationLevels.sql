-- beginn transaction
-- commit transactin
-- rollback transaction
-- dirty read
-- phantom read
-- nonrepeatable read

SET TRANSACTION ISOLATION LEVEL
{	  READ UNCOMMITTED
    | READ COMMITTED
    | REPEATABLE READ
    | SNAPSHOT
    | SERIALIZABLE
}


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
 SELECT TestColumn FROM TestTable
COMMIT    




-------------- TRANSACTION LEVEL READ UNCOMMITED
SELECT FirstName, LastName FROM Person.Person WHERE BusinessEntityID<10

BEGIN TRANSACTION
UPDATE Person.Person SET FirstName = 'Kevin' WHERE BusinessEntityID=1
ROLLBACK

-- THIS STATEMENTS SHOULD BE EXECUTED FROM ANOTHER CONNECTION 
-- WITH THE PREVIOUS STATEMENTS EXECUTED IN THIS CONNECTION
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT FirstName, LastName FROM Person.Person WHERE BusinessEntityID<10
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

-------------- TRANSACTION LEVEL READ COMMITED -- is the default transaction level


-------------- TRANSACTION LEVEL REPEATABLE READ --
-- transaction acquires read locks on all retrieved data but does not acquire range locks.
-- nonrepeatable reads are avoided, phantom reads can occur


-------------- TRANSACTION LEVEL SERIALIZABLE
-- will not permit dirty reads, phantom reads, or nonrepeatable reads
-- places the most restrictive locks on the data


-------------- TRANSACTION LEVEL SNAPSHOT
-- it stores previously commited versions of rows in the TempDb database
-- other transactions will not block, the will continue to read the previous version 


ALTER DATABASE MyDB SET ALLOW_SNAPSHOT_ISOLATION ON
 
SET TRANSACTION ISOLATION LEVEL SNAPSHOT


-------------- TRANSACTION LEVEL READ_COMMITTED_SNAPSHOT
ALTER DATABASE MyDB SET READ_COMMITTED_SNAPSHOT ON