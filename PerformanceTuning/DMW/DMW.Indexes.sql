-- Find the 10 missing indexes with the highest anticipated improvement for user queries

select * from sys.dm_db_missing_index_group_stats
	ORDER BY avg_total_user_cost * avg_user_impact * (user_seeks + user_scans)DESC;

-- Find the individual missing indexes and their column details 
-- for a particular missing index group
SELECT migs.group_handle, mid.*
FROM sys.dm_db_missing_index_group_stats AS migs
INNER JOIN sys.dm_db_missing_index_groups AS mig
    ON (migs.group_handle = mig.index_group_handle)
INNER JOIN sys.dm_db_missing_index_details AS mid
    ON (mig.index_handle = mid.index_handle)
WHERE migs.group_handle = 6;


-- find indexes in the database with defined databas_id = 18
select 
	t.name as TableName
	, (select name from sys.indexes where [object_id]=t.[object_id] and index_id=ius.[index_id] ) as IndexName
	,ius.* 
	from sys.dm_db_index_usage_stats as ius 
	inner join sys.tables as t ON(ius.[object_id]=t.[object_id])
where database_id = 18
order by ius.user_scans desc


select * from sys.dm_db_missing_index_groups
select * from sys.dm_db_missing_index_details
select * from sys.dm_db_missing_index_columns(26)


select * from sys.databases order by name
select * from sys.indexes
select * from sys.dm_db_index_usage_stats where database_id = 18 order by [object_id]
select * from sys.tables