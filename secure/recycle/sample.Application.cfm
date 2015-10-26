<cfset session.uvid = "#UCase(REMOTE_USER)#">
<cfset uvid =  "#UCase(REMOTE_USER)#">

<cfquery name="uvid_check" datasource="read_cpa">
select uvid 
from cunvcpa.employee_application
where uvid = '#uvid#'
</cfquery>

