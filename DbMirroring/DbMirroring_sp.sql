--DB Mirroring stored procedures
sp_dbmmonitorupdate
sp_dbmmonitorresults
sp_dbmmonitoraddmonitoring
sp_dbmmonitorchangemonitoring
sp_dbmmonitorhelpmonitoring
sp_dbmmonitordropmonitoring
sp_dbmmonitorresults

-- Mirroring views
select * from sys.database_mirroring;
select * from sys.database_mirroring_endpoints;
select * from sys.database_mirroring_witnesses;

-- Suspend Mirroring
ALTER DATABASE Sales
SET PARTNER SUSPEND

-- Resume Mirroring
ALTER DATABASE Sales
SET PARTNER RESUME

-- Initiate Manual Failover
ALTER DATABASE Sales
SET PARTNER FAILOVER


-- Force Failover - run on mirror instance - data loss possible
ALTER DATABASE Sales
SET PARTNER FORCE_SERVICE_ALLOW_DATA_LOSS