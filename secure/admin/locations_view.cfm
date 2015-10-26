<cfinclude template="/newsevents/secure/templates/top_small.cfm">	
<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT      locations.location_name, locations.address, locations.subaddress, locations.location_link, users.lastname, users.firstname
FROM         cunvmcs.locations, cunvmcs.users 
WHERE       locations.creator = users.userid and locationid=#url.locationid#</cfquery>
<body>
<cfoutput query="getlocations">
<table width="100%" border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
	<tr><td><strong>Location Name:</strong></td><td>#location_name#</td></tr>
	<tr><td><strong>Address:</strong></td><td>#address#</td></tr>
	<tr><td><strong>Sub-Address:</strong></td><td>#subaddress#</td></tr>
	<tr><td><strong>Map Link:</strong></td><td><a href="#location_link#" target="_blank">#location_link#</a></td></tr>
	<tr><td><strong>Created by/Last Modified by:</strong></td><td>#firstname# #lastname#</td></tr>
</table>
</cfoutput>
<cfinclude template="/newsevents/secure/templates/footer.cfm">	
