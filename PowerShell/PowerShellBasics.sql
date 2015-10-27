-- SQL PowerShell [SQL PS]
SQLSERVER:\SQL
SQLSERVER:\SQLPolicy
SQLSERVER:\SQLRegistration

--SMO Object Diagram - SQL Server Books Online

--Default SQL instance on the DEV server, in DB Table AdwentureWorks2008.Person.Address
SQLSEERVER:\SQL\DEV\DEFAULT\Databases\AdwentureWorks2008\Tables\Person.Address

-- PowerShell to enumerate Objects
Get-Location		Returns the current node name, (gl, pwd)
Set-Location		changes the current node, (sl, cd, chdir)
Get-ChildItem		lists the child object, (cgi, dir, ls)
Get-Item			gets the properties of the current object (gu)
Move-Item			moves an item (mi, move, mv)
Rename-Item			renames the object (rmi, rn, ren)
Remove-Item			deletes the object (ri, del, rd, rm, rmdir)
Get-Help			help information about each cmdlet
Get-Help -Full		full technical help with samples
Invoke-Sqlcmd		runs a T-SQL or XQuery script
Encode-SqlName		encode a SQL server identifier
Decode-SqlName		returns the original SQL identifier
Convert-UrnToPath	convers an SMO Uniform Resource Name (URN) to the path structure used by SQL PS

cd..					move up one level in the path
cd \SQLPolicy			move to SQLSERVER:\SQLPolicy
cls						clear the screen
-force parameter		view also system objects
Get-Help Invoke-SqlCmd	help for Invoke-Sqlcmd

---	retrieve currend date and time
Invoke-Sqlcmd -Query "Select GETDATE() as Date" 

-- this does not worked for me
Get-Item "SQL Server Login Mode" | Invoke-PolicyEvaluation -TargetServerName "TAKACSPC"

--
Set-Location SQLServer:\SQL\takacspc\default
ls

-- 
cd SQLServer:\SQL\takacspc\default\databases\AdventureWorks2008\StoredProcedures\HumanResources.uspUpdateEmployeeLogin
get-childitem parameters