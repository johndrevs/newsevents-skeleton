<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">	


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
Number of news items that the site pulls for syndication<br /> 
<input type="text" name="maxrows" size="2" maxlength="2" class="form"><br /><br />
</td>
	<td valign="top"></td>
</tr></table>

<input type="submit" value="add" class="button"></form>

<cfinclude template="/newsevents/templates_new/footer.cfm">