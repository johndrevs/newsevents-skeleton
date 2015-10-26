

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">	


		<h2>Add site</h2>
<p>The form below creates a site for the University News and Events system. By creating a site, users will be able to post news and event items and the site will be listed in the University News and Events News source and Calendar system.</p>




<form action="sites_add_action.cfm" method="post" name="events_add" id="events_add">
<table>
<tr>
	<td>Site<br /> 
<input type="text" name="site_name" size="50" maxlength="#application.long#" class="form"><br /><br />
Description<br /> 
<textarea cols="40" rows="12" name="description"></textarea><br /><br />
<br /><br />
URI<br /> 
<input type="text" name="url" size="50" maxlength="#application.long#" class="form"><br /><br />
Should this site be public and listed in navigation?<br />
<input type="radio" name="ispublic" value="1">yes&nbsp;&nbsp;<input type="radio" name="ispublic" value="0" checked>no<br /><br />
Number of news items that the site pulls for syndication<br /> 
<input type="text" name="maxrows" size="2" maxlength="2" class="form"><br /><br />
Will this site have a calendar?<br />
<input type="radio" name="calendar" value="1" checked>yes&nbsp;&nbsp;<input type="radio" name="calendar" value="0">no<br /><br />
Will this site have a news publication?<br />
<input type="radio" name="news" value="1" checked>yes&nbsp;&nbsp;<input type="radio" name="news" value="0">no<br /><br />
</td>
	<td valign="top"></td>
</tr></table>

<input type="submit" value="add" class="button"></form>

<cfinclude template="/newsevents/secure/templates/footer.cfm">