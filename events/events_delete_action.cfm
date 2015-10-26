
<cfquery name="getevents" datasource="#application.datasource_select#">
update events
set isactive=0
where eventid=#form.eventid#
</cfquery>

<cflocation url="index.cfm" addtoken="No">