/*
<Record>
  <coid>801099002376977</coid>
  <UCID>1127291277754850</UCID>
  <Call_start>2010-06-30 12:10:40</Call_start>
  <Duration>11</Duration>
  <Calling>88080908675892 (BA_KV_Orange)</Calling>
  <Called>6606 (test ccsupport)</Called>
  <AgentID>6222 (test)</AgentID>
  <File>dss_1127291277754850_801099002376977.mp3</File>
</Record>
*/
select 
	xml1.value('(/Record//coid/node())[1]','nvarchar(max)') as coid,
	xml1.value('(/Record//UCID/node())[1]','nvarchar(max)') as ucid,
	xml1.value('(/Record//Call_start/node())[1]','datetime') as call_start

from cti.CTI_record
order by 
	--xml1.value('(/Record//coid/node())[1]','nvarchar(max)'),
	xml1.value('(/Record//UCID/node())[1]','nvarchar(max)'),
	xml1.value('(/Record//Call_start/node())[1]','datetime')

select xml1 from cti.CTI_record