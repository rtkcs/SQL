SELECT *  FROM [GTI_DSSCTI].[cti].[CRM_organization]
select * from cti.CTI_agent
select * from cti.CTI_record
delete from cti.CTI_record where pk_coid <> '__dss_00001018981278050422_801099002383440.xml'


select top 100 * from cti.Error_log order by id desc

exec cti.copyFilesFromSecureShare;
exec cti.generateMD5Hash
exec cti.transformXML
exec cti.saveXml2ToFile
exec cti.cti.copyFilesCmd


SELECT * FROM cti.CRM_organization WHERE cti_prefix = left('88090908441025 (BA_0800)',4)

declare @varchar as nvarchar(100)
exec set @varchar = dbo.getITUPhoneNumber '88080377731539 (BA_0800)'
print @varchar;

select * from 
declare @varchar as nvarchar(100)
set @varchar = '88080377731539 (BA_0800)';
select dbo.getITUPhoneNumber(@varchar)
select dbo.getPhoneNumber(@varchar)

select dbo.getITUPhoneNumber('0377731539 (BA_0800)');
select dbo.getPhoneNumber('0377731539 (BA_0800)');
select dbo.getAgentId('6309 (Horvathova Magdalena)');
select dbo.getAgentId('6309');
select dbo.getAgentId('6309 ()');


print @varchar;

select dbo.getITUPhoneNumber('0908675892 (BA_KV_Orange)')