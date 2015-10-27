----------------------------------------------- simple email message
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'PublicProfile',
    @recipients = 'rtakacs@gratex.com',
    @body = 'The stored procedure finished successfully.',
    @subject = 'Automated Success Message' ;

----------------------------------------------- email with result of a query    
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'PublicProfile',
    @recipients = 'rtakacs@gratex.com',
    @query = 'SELECT COUNT(*) FROM AdventureWorks.Production.WorkOrder
                  WHERE DueDate > ''2004-04-30''
                  AND  DATEDIFF(dd, ''2004-04-30'', DueDate) < 2' ,
    @subject = 'Work Order Count',
    @attach_query_result_as_file = 1 ;
 
----------------------------------------------- HTML e-mail message
DECLARE @tableHTML  NVARCHAR(MAX) ;

SET @tableHTML =
    N'<H1>Work Order Report</H1>' +
    N'<table border="1">' +
    N'<tr><th>Work Order ID</th><th>Product ID</th>' +
    N'<th>Name</th><th>Order Qty</th><th>Due Date</th>' +
    N'<th>Expected Revenue</th></tr>' +
    CAST ( ( SELECT td = wo.WorkOrderID,       '',
                    td = p.ProductID, '',
                    td = p.Name, '',
                    td = wo.OrderQty, '',
                    td = wo.DueDate, '',
                    td = (p.ListPrice - p.StandardCost) * wo.OrderQty
              FROM AdventureWorks.Production.WorkOrder as wo
              JOIN AdventureWorks.Production.Product AS p
              ON wo.ProductID = p.ProductID
              WHERE DueDate > '2004-04-30'
                AND DATEDIFF(dd, '2004-04-30', DueDate) < 2 
              ORDER BY DueDate ASC,
                       (p.ListPrice - p.StandardCost) * wo.OrderQty DESC
              FOR XML PATH('tr'), TYPE 
    ) AS NVARCHAR(MAX) ) +
    N'</table>' ;

EXEC msdb.dbo.sp_send_dbmail 
	@profile_name = 'PublicProfile',
	@recipients='rtakacs@gratex.com',
    @subject = 'Work Order List',
    @body = @tableHTML,
    @body_format = 'HTML' ;
 
 ----------------------------------------------- 
EXEC msdb.dbo.sp_send_dbmail
	@profile_name = 'PublicProfile', 
	@recipients = 'rtakacs@gratex.com',
	@query = 'SELECT JobCandidateID, [Resume] from HumanResources.JobCandidate',
	@subject = 'Job Candidate Resumes',
	@execute_query_database = 'AdventureWorks2008',
	@attach_query_result_as_file = 1,
	@query_attachment_filename = 'CandidateResumes.txt',
	@query_no_truncate = 0;
	
	
SELECT JobCandidateID, [Resume] from HumanResources.JobCandidate	