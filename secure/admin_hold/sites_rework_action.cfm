
<cfquery name="updatesite" datasource="#application.datasource_update#">
UPDATE     CUNVMCS.sites
SET      site_name='#form.site_name#', uri='#form.uri#', description=1, maxrows='#form.maxrows#'
where siteid=#form.siteid#
</cfquery>




<cflocation url="sites_list.cfm" addtoken="No">
