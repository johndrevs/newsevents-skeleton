<cfquery name="getlocation" datasource="#application.datasource_update#" maxrows=1>
select locationid, location_name, address,subaddress,location_link,isactive
from CUNVMCS.locations
where	locations.locationid=#url.itemid#
</cfquery>


<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Edit location</h2>
<p>Use the form below to edit a location for the University News and Events system. </p>


<cfoutput query="getlocation">
<form action="locations_rework_action.cfm" method="post">

<table cellpadding="5" cellspacing="0" border="0" class="tabulargrey">
		<tr>
			<td><strong>Location Name:</strong></td>
			<td>
			<input type="text" name="location_name" size="50" maxlength="#application.long#" class="form" value="#location_name#">
</td>
		</tr>
		<tr>	
			<td><strong>Address:</strong></td>
			<td>
<input type="text" name="address" size="50" maxlength="#application.long#" class="form" value="#address#">
			</td>
		</tr>
		<tr>	
			<td><strong>Sub-Address:</strong></td>
			<td>
			<input type="text" name="subaddress" size="50" maxlength="#application.long#" class="form" value="#subaddress#">
			</td>
		</tr>
		<tr>	
			<td><strong>Map Link:</strong><br>
			Always begin with "<strong>http://</strong>"</td>
			<td>
			<input type="text" name="location_link" size="50" maxlength="#application.long#" class="form" value="#location_link#"></td>
		</tr>
	</table>
	
					<input type="hidden" name="itemid" value="#locationid#">

<input type="submit" value="save" class="button"></form></cfoutput>

<cfinclude template="/newsevents/secure/templates/footer.cfm">