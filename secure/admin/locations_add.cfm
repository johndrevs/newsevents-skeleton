

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
	
<h2>Add Location</h2>
<p>Please fill out the following form to provide users the capability to place events in general locations.</p>




<form action="locations_add_action.cfm" method="post" name="events_add" id="events_add">
<table cellpadding="0" cellspacing="0" border="0" class="tabulargrey">
		<tr>
			<td>Location</td>
			<td>
			<input type="text" name="location_name" size="50" maxlength="#application.long#" class="form"></td>
		</tr>
		<tr>	
			<td>Address</td>
			<td>
			<input type="text" name="address" size="50" maxlength="#application.long#" class="form"></td>
		</tr>
		<tr>	
			<td>Sub-address</td>
			<td>
			<input type="text" name="subaddress" size="50" maxlength="#application.long#" class="form"></td>
		</tr>
		<tr>	
			<td>Link</td>
			<td>
			<input type="text" name="location_link" size="50" maxlength="#application.long#" class="form"></td>
		</tr>
	</table>

<input type="submit" value="add" class="button"></form>
<cfinclude template="/newsevents/secure/templates/footer.cfm">

