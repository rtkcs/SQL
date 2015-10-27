/*
transaction modes:
- autocommit
- explicit
- implicit
- batch-scoped
*/
--
BEGIN { TRAN | TRANSACTION }
    [ { transaction_name | @tran_name_variable }
      [ WITH MARK [ 'description' ] ]
    ]
--    
COMMIT { TRAN | TRANSACTION } [ transaction_name | @tran_name_variable ] ]
--
ROLLBACK { TRAN | TRANSACTION }
     [ transaction_name | @tran_name_variable
     | savepoint_name | @savepoint_variable ]
--
SAVE { TRAN | TRANSACTION } { savepoint_name | @savepoint_variable }
--
error with severity => 11 stops the exectution of the current batch and rolls back the transaction
error with severity => 19 terminate the connection
--
select @@TRANCOUNT -- number of current transactions in this connection
--

----------------------------------------------------------------------- explicit transaction
-- simple transaction
BEGIN TRANSACTION
  UPDATE Table1 SET Column1 = 'One'
  INSERT INTO Table2 (Column2) VALUES ('Two')
COMMIT    

--nested transaction
BEGIN TRANSACTION OUTERTRAN
 INSERT INTO TEST (TestColumn) VALUES (1)
  BEGIN TRANSACTION INNERTRAN
   INSERT INTO TEST (TestColumn) VALUES (2)
  COMMIT TRANSACTION INNERTRAN
ROLLBACK -- no row will be inserted, the entire transaction will be rolled back

--nested transaction with savepoint
BEGIN TRANSACTION
 INSERT INTO TEST (TestColumn) VALUES (1)
 SAVE TRANSACTION SAVEPOINT1
  INSERT INTO TEST (TestColumn) VALUES (2)
 ROLLBACK TRANSACTION SAVEPOINT1
COMMIT-- only 1 row will be inserted

---------------------------------------------------------------------- implicit transaction
SET IMPLICIT_TRANSACTIONS {ON | OFF}
-- implicit transaction is automaticaly started for every statement:
-- ALTER TABLE, CREATE, DELETE, DROP, FETCH, GRANT, 
-- INSERT, OPEN, REVOKE, SELECT, TRUNCATE TABLE, or UPDATE

-- every statement is in transaction and the data is not affected until you COMMIT or ROLLBACK the statement
-- if you disconnect, the changes will be rolled back
