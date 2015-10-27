BEGIN DISTRIBUTED { TRAN | TRANSACTION }[ transaction_name | @tran_name_variable ]

-- distributed transactions acros different liked servers 
BEGIN DISTRIBUTED TRANSACTION
  DELETE TestDB.TestTable WHERE TestID = 1			-- local server
  DELETE ServerB.TestDB.TestTable WHERE TestID = 1	-- linked server
COMMIT

sp_configure remote proc trans 0;

SET REMOTE_PROC_TRANSACTIONS OFF;