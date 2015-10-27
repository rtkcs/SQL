-- sp_trace_setstatus(TraceId, status)
-- status	0 - stop strace
--			1 - start trace
--			2 - close trace and remove trace definition
-- 
sp_trace_setstatus()

--return all traces
select * from fn_trace_getinfo(null);