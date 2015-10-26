<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">
	
<h2>Add Location</h2>
<p>Please fill out the following form to provide users the capability to place events in general locations.</p>




<form action="locations_add_action.cfm" method="post" name="events_add" id="events_add">
<table>
<tr>
	<td>Location<br /> 
<input type="text" name="location_name" size="50" maxlength="#application.long#" class="form"><br /><br />
Address<br /> 
<input type="text" name="address" size="50" maxlength="#application.long#" class="form"><br /><br />
Sub-address<br /> 
<input type="text" name="subaddress" size="50" maxlength="#application.long#" class="form"><br /><br />
Link<br /> 
<input type="text" name="location_link" size="50" maxlength="#application.long#" class="form"><br /><br /></td>
	<td valign="top"></td>
</tr></table>

<input type="submit" value="add" class="button"></form>
<cfinclude template="/newsevents/templates_new/footer.cfm">

