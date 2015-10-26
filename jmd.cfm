<cfquery datasource="#application.datasource_select#" name="getcalendar">
SELECT count(eventid)
from CUNVMCS.events_tbl

</cfquery>

<cfdump var="#getcalendar#">