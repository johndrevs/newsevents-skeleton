


<cfquery name="getmessages" datasource="#application.datasource_select#">
SELECT      messages.subject, messages.content, messages.userid, messages.date_sent, messages.messageID, users.lastname, users.firstname
FROM         CUNVMCS.messages, CUNVMCS.users 
WHERE       messages.userid = users.userid and messages.isactive=1
order by date_sent desc</cfquery>


<cfset daterangebeg=#now()#>
<cfset daterangeend=#dateadd('yyyy',100,daterangebeg)#>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
	
<h2>View Messages</h2><br/>
		<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
			<tr>
			<th>Subject</th>
			<th>Name</th>
			<th>Date</th>
			<th>Actions</th>
		</tr>	
			<cfif getmessages.recordcount lt 1>	
				<tr>
					<td colspan="3">There are currently no messages available</td>
				</tr>
			<cfelse>
				<cfoutput query="getmessages"><form action="admin_action.cfm" method="post">
					<tr>
						<td>#currentrow#&nbsp;&nbsp;<a href="messages_view.cfm?messageid=#messageid#">#getmessages.subject#</a></td>
						<td>#firstname#  #lastname# </td><td>(#dateformat(date_sent, "mmm. d")#, #timeformat(date_sent, "h:mm tt")#)</td>
						<td><cfif session.administrator is 1><input type="submit" name="delete_message" value="delete" class="button" onclick="return confirmdelete()"></cfif></td>						
					</tr><input type="hidden" name="itemid" value="#messageid#"></form>
				</cfoutput>
			</cfif>
		</table>
		
<cfinclude template="/newsevents/secure/templates/footer.cfm">


