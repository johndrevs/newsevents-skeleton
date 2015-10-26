

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">	


		<h2>Add user</h2>
<p>This system administrator function creates users for access to the system. Once a user is created, they will need to be assigned to sites in order for them tointeract with the system.</p>


<form action="users_add_action3.cfm" method="post">
<table>
<tr>
	<td>User Name<br /> 
<input type="text" name="user_name" size="50" maxlength="#application.long#" class="form"><br /><br />
Password<br /> 
<input type="password" name="passcode" value="" size="50" maxlength="#application.long#" class="form"><br /><br />
Password (please retype)<br /> 
<input type="password" name="passcode2" value="" size="50" maxlength="#application.long#" class="form"><br /><br />
First Name<br /> 
<input type="text" name="firstname" size="50" maxlength="#application.long#" class="form"><br /><br />
Last Name<br /> 
<input type="text" name="lastname" size="50" maxlength="#application.long#" class="form"><br /><br />
Email<br /> 
<input type="text" name="email" size="50" maxlength="#application.long#" class="form"><br /><br />
Is this person an administrator?<br /><br />
no <input type="radio" name="user_admin" value="0" checked> yes <input type="radio" name="user_admin" value="1">
</td>

</tr></table>

<input type="submit" value="add" class="button"></form>

<cfinclude template="/newsevents/secure/templates/footer.cfm">