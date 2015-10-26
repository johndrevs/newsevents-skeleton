<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="getusers" datasource="#application.datasource_select#">
		select user_name,user_admin,lastname,firstname,email,userid,passcode
		from CUNVMCS.users
		where	users.userid=#url.itemid#
	</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">


		<h2>Edit User</h2>
<p>The following form will allow you to rework or edit a news item on the News and Events system.</p>




<cfoutput query="getusers"><form action="users_rework_action.cfm" method="post">
<table>
<tr>
	<td>User Name<br /> 
<input type="text" name="user_name" value="#getusers.user_name#" size="50" maxlength="#application.long#" class="form"><br /><br />
Password<br /> 
<input type="password" name="passcode" value="#getusers.passcode#" size="50" maxlength="#application.long#" class="form"><br /><br />
Password (please retype)<br /> 
<input type="password" name="passcode2" value="#getusers.passcode#" size="50" maxlength="#application.long#" class="form"><br /><br />
First Name<br /> 
<input type="text" name="firstname" value="#getusers.firstname#" size="50" maxlength="#application.long#" class="form"><br /><br />
Last Name<br /> 
<input type="text" name="lastname" value="#getusers.lastname#" size="50" maxlength="#application.long#" class="form"><br /><br />
Email<br /> 
<input type="text" name="email" value="#getusers.email#" size="50" maxlength="#application.long#" class="form"><br /><br />
<cfif getusers.user_admin is 1>
Is this person an administrator?<br /><br />
no <input type="radio" name="user_admin" value="0" <cfif getusers.user_admin is 0>checked</cfif>> yes <input type="radio" name="user_admin" value="1"<cfif getusers.user_admin is 1>checked</cfif>><cfelse><input type="hidden" name="user_admin" value="0"></cfif>
</td>
	<td valign="top"></td>
</tr></table>
<input type="hidden" name="userid" value="#getusers.userid#">
<input type="submit" value="update" class="button"></form></cfoutput>

<cfinclude template="/newsevents/templates_new/footer.cfm">