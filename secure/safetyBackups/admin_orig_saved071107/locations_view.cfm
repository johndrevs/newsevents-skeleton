<cfinclude template="/newsevents/secure/templates/top_small.cfm">	
<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT      locations.location_name, locations.address, locations.subaddress, locations.location_link, users.lastname, users.firstname
FROM         cunvmcs.locations, cunvmcs.users 
WHERE       locations.creator = users.userid and locationid=#url.locationid#</cfquery>
<body>
<cfoutput query="getlocations">
<table width="100%" border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
	<tr><td>Name</td><td>#location_name#</td></tr>
	<tr><td>Address</td><td>#address#</td></tr>
	<tr><td>#subaddress#<p></td></tr>
	<tr><td>Link</td><td>#location_link#</td></tr>
	<tr><td>Created by</td><td>#firstname# #lastname#</td></tr>
</table>
</cfoutput>
<cfinclude template="/newsevents/secure/templates/footer.cfm">	
