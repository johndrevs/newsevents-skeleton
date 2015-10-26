

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
	
<h2>Add Location</h2>
<p>Please fill out the following form to provide users the capability to place events in general locations.</p>




<form action="il_weekly_generate_action.cfm" name="events_add" id="events_add">
<table cellpadding="0" cellspacing="0" border="0" class="tabulargrey">
		<tr>
			<td>Date to be sent</td>
			<td>
			<input type="text" name="date" size="50"></td>
		</tr>
		
	</table>

<input type="submit" value="generate" class="button"></form>
<cfinclude template="/newsevents/secure/templates/footer.cfm">

