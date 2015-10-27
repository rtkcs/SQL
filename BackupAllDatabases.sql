
declare @dbName as nvarchar(500);
declare @sql as nvarchar(1000);

declare @errorMessage as nvarchar(max);
set @errorMessage = '';
declare @parameters cursor;
set @parameters = cursor static for select [name] from master.sys.databases 
where [name] NOT IN ('master','model','msdb','tempdb')
open @parameters;

fetch next from @parameters into @dbName


While @@FETCH_STATUS = 0
Begin
		set @sql = 'BACKUP DATABASE ['+@dbName + ']
			TO DISK = N''C:\CRM\db_zaloha\'+@dbName+'_daily.bck'' 
			WITH NOFORMAT, INIT,  NAME = N'''+@dbName+'-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10';
		
		BACKUP DATABASE @name TO  mig_backup;

		begin try
			exec sp_executesql @Sql
			--print @sql;
		end try
		begin catch
			print ERROR_MESSAGE();
			print @sql;
			set @errorMessage = @errorMessage + @sql + char(10)+char(13);
		end catch
		
    
		fetch next from @parameters into @dbName;

	End
	close @parameters
	deallocate @parameters
	
	-- tu sa odosiela email, ak je dlzka chybovej hlasky vacsia ako 0
	IF len(@errorMessage)>0
	begin
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'devcrm_sql_mail', --treba edivat na platny profil
				@recipients = 'rtakacs@gratex.com',--treba editovat mjo@gratex.com
				@body = @errorMessage,
				@subject = 'backup of database failed';	
	end
