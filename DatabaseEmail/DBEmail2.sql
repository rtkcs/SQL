-- Database Email
sp_send_dbmail [ [ @profile_name = ] 'profile_name' ]
    [ , [ @recipients = ] 'recipients [ ; ...n ]' ]
    [ , [ @copy_recipients = ] 'copy_recipient [ ; ...n ]' ]
    [ , [ @blind_copy_recipients = ] 'blind_copy_recipient [ ; ...n ]' ]
    [ , [ @subject = ] 'subject' ] 
    [ , [ @body = ] 'body' ] 
    [ , [ @body_format = ] 'body_format' ]
    [ , [ @importance = ] 'importance' ]
    [ , [ @sensitivity = ] 'sensitivity' ]
    [ , [ @file_attachments = ] 'attachment [ ; ...n ]' ]
    [ , [ @query = ] 'query' ]
    [ , [ @execute_query_database = ] 'execute_query_database' ]
    [ , [ @attach_query_result_as_file = ] attach_query_result_as_file ]
    [ , [ @query_attachment_filename = ] query_attachment_filename ]
    [ , [ @query_result_header = ] query_result_header ]
    [ , [ @query_result_width = ] query_result_width ]
    [ , [ @query_result_separator = ] 'query_result_separator' ]
    [ , [ @exclude_query_output = ] exclude_query_output ]
    [ , [ @append_query_error = ] append_query_error ]
    [ , [ @query_no_truncate = ] query_no_truncate ]
    [ , [ @mailitem_id = ] mailitem_id ] [ OUTPUT ]
 


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'devcrm_sql_mail',
    @recipients = 'rtakacs@gratex.com',
    @body = 'The stored procedure finished successfully.',
    @subject = 'Automated Success Message' ;


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'devcrm_sql_mail',
    @recipients = 'rtakacs@gratex.com',
	@query = 'SELECT * FROM RoboTempDB.dbo.Klient' ,
    @subject = 'Klient',
    @attach_query_result_as_file = 0;
    
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'devcrm_sql_mail',
    @recipients = 'rtakacs@gratex.com',
	@query = 'SELECT * FROM RoboTempDB.dbo.Klient' ,
    @subject = 'Klient',
    @attach_query_result_as_file = 0,
    @append_query_error = 1,
    @query_result_width = 200,
    @query_result_separator = '@';
    
        