
<cfquery name="sites" datasource="#application.datasource_select#">
update sites
set isactive=0
where siteid=#form.itemid#
</cfquery>

<cflocation url="sites_list.cfm" addtoken="No">