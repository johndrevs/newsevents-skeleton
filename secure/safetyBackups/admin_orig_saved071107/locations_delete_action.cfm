
<cfquery name="locations" datasource="#application.datasource_update#">
update cunvmcs.locations
set isactive=0
where locationid=#form.itemid#
</cfquery>

deleted