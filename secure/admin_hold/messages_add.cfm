<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">	

<h2>Add Message</h2>
<p>The following form allows for the communication of messages to users of the system. The 5 most recent messages will appear in the News and Events dashboard.</p>




<form action="messages_add_action.cfm" method="post" name="events_add" id="events_add">
<table>
<tr>
	<td>Subject<br /> 
<input type="text" name="subject" size="50" maxlength="#application.long#" class="form"><br /><br />
Message<br /> 
<textarea cols="40" rows="12" name="content"></textarea><br /><br />

</td>
	</table>

<input type="submit" value="add" class="button"></form>

<cfinclude template="/newsevents/templates_new/footer.cfm">