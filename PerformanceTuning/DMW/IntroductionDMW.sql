-- session level activity view
sp_who
sp_who2

-- request currently executed by SQL server
select * from sys.dm_exec_requests

-- overview of all current sessions(SPISs)
select * from sys.dm_exec_sessions order by host_name

-- shows level of index fragmentation
select * from sys.dm_db_index_physical_stats

-- performance tuning
select * from sys.dm_exec_requests
select * from sys.dm_exec_sessions
select * from sys.dm_exec_sql_text;
select * from sys.dm_exec_query_stats;
select * from sys.dm_os_wait_stats;
select * from sys.dm_db_index_usage_stats;
select * from sys.dm_db_index_operational_stats;
select * from sys.dm_db_missing_index_details;

-- transactions
select * from sys.dm_tran_active_snapshot_database_transactions
select * from sys.dm_tran_current_snapshot;
select * from sys.dm_tran_database_transactions;
select * from sys.dm_tran_session_transactions;
select * from sys.dm_tran_transactions_snapshot;
select * from sys.dm_tran_active_transactions;
select * from sys.dm_tran_current_transaction;
select * from sys.dm_tran_top_version_generators;
select * from sys.dm_tran_version_store;
select * from sys.dm_tran_locks;

-- wait statistics
select * from sys.dm_os_wait_stats

-- clear wait statistics
DBCC SQLPERF("sys.dm_os_wait_stats", CLEAR);

