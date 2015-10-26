
<cfquery name="locations" datasource="#application.datasource_select#">
update locations
set isactive=0
where locationid=#form.itemid#
</cfquery>

deleted