

<cfquery name="get_user" datasource="#application.datasource_select#" dbtype="ODBC">
SELECT CUNVMCS.USERS.email, CUNVMCS.USERS.passcode,CUNVMCS.USERS.USER_NAME
FROM CUNVMCS.USERS
WHERE CUNVMCS.USERS.USER_NAME='#trim(FORM.user_name)#'
</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">	

<cfif get_user.recordcount gt 0>
<h2>Add user</h2>
<p>The username you requested has already been assigned. Please <a href="users_add.cfm">click here</a> and choose a seperate username.</p>
<cfelseif '#form.passcode#' NEQ '#form.passcode2#'>
<h2>Add user</h2>
<p>The passwords you entered did not match. Please <a href="users_add.cfm">click here</a> and verify that both passwordsmatch.</p>	

<cfelseif form.user_admin is 1>
<h2>Add user</h2>
Creating this user as an administrator will give them access to all sites and function in the system.
<form action="users_add_action2.cfm" method="post">
<cfoutput>
				<input type="hidden" name="user_name" value="#form.user_name#">
				<input type="hidden" name="passcode" value="#form.passcode#">
				<input type="hidden" name="firstname" value="#form.firstname#">
				<input type="hidden" name="lastname" value="#form.lastname#">
				<input type="hidden" name="user_admin" value="#form.user_admin#">
				<input type="hidden" name="email" value="#form.email#">
				<input type="hidden" name="publish" value="1">
				<input type="hidden" name="post" value="1">
			</cfoutput>
			<input type="submit" value="ok" class="button">
		</form>
<cfelse>
<cfquery name="getsites" datasource="#application.datasource_select#">
select site_name,siteid
from CUNVMCS.sites
where isactive=1
order by site_name
</cfquery>



		<form action="users_add_action2.cfm" method="post">
			<cfoutput>
				<input type="hidden" name="user_name" value="#form.user_name#">
				<input type="hidden" name="passcode" value="#form.passcode#">
				<input type="hidden" name="firstname" value="#form.firstname#">
				<input type="hidden" name="lastname" value="#form.lastname#">
				<input type="hidden" name="user_admin" value="#form.user_admin#">
				<input type="hidden" name="email" value="#form.email#">
			</cfoutput>
			<h2>Add user</h2>
<p>Please assign this new user to sites you want them to be able to publish to.</p>
				<table width="55%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
					<tr>
						<th>Name</th>
						<th>&nbsp;</th>
					</tr>						
					<cfif getsites.recordcount lt 1>
						<tr>
							<td colspan="2">There are currently no sites available for you to attribute access to.</td>
						</tr>
					<cfelse>
						<tr>
							<td colspan="2"><strong>Give publish access to:</strong></td>
						</tr>
						<cfoutput query="getsites">
							<tr>
								<td>#site_name#</td>
								<td>
								<input type="checkbox" name="publish" value="#siteid#"></td>
							</tr>
						</cfoutput>
						<tr>
							<td colspan="2"><strong>Give post access to:</strong></td>
						</tr>
						<tr>
								<td colspan="2">Users will automatically have access to post to all active sites</td>
								
							</tr>
					</cfif>
				</table>
				<input type="submit" value="add" class="button">
		</form>
</cfif>
<cfinclude template="/newsevents/secure/templates/footer.cfm">