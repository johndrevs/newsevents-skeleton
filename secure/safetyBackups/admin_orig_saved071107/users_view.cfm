

<cfquery name="getuser" datasource="#application.datasource_select#" maxrows="1">
SELECT      users.lastname, logintracking.logindate, users.firstname,email
FROM         CUNVMCS.users, CUNVMCS.logintracking 

WHERE       users.userid = logintracking.userid and users.userid=#url.userid#
order by logindate desc
</cfquery>

<cfinclude template="/newsevents/secure/templates/top_small.cfm">	

	<cfoutput query="getuser">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
			<tr>
				<td><strong>Name:</strong></td>
				<td>#lastname#, #firstname#
				<br/></td>
			</tr>
			<tr>
				<td><strong>Last Login:</strong></td>
				<td>#dateformat(logindate, "mmm. d, yyyy")# #timeformat(logindate, "h:mm:ss")#
				<br/></td>
			</tr>
			<tr>
				<td><strong>E-mail:</strong></td>
				<td><a href="mailto:#email#">#email#</a></td>
			</tr>
		</table>
	</cfoutput>
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">	
