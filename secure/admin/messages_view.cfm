


<cfquery name="getmessages" datasource="#application.datasource_select#" maxrows=1>
SELECT      messages.subject, messages.content, messages.userid, messages.date_sent, messages.messageID, users.lastname, users.firstname
FROM         CUNVMCS.messages, CUNVMCS.users 
WHERE       messages.userid = users.userid and  messages.messageid = #url.messageid#
order by date_sent desc</cfquery>


<cfset daterangebeg=#now()#>
<cfset daterangeend=#dateadd('yyyy',100,daterangebeg)#>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
	
<h2>View Messages</h2><br/>
		<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
			
				<cfoutput query="getmessages">
					<tr>
						<td>#currentrow#&nbsp;&nbsp;<a href="messages_view.cfm?messageid=#messageid#">#getmessages.subject#</a></td>
						<td>#firstname#  #lastname# </td><td>(#dateformat(date_sent, "mmm. d")#, #timeformat(date_sent, "h:mm tt")#)</td>
											
					</tr>
					<tr>	
						<td colspan=3>#content#</td>
						
				</cfoutput>
			
		</table>
		
<cfinclude template="/newsevents/secure/templates/footer.cfm">


