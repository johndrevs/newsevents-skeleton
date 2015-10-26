

<cfquery name="getsite" datasource="#application.datasource_select#" maxrows=1>
select siteid, site_name, uri, description, isactive,maxrows,ispublic,calendar,news
from CUNVMCS.sites
where	sites.siteid=#url.itemid#</cfquery>


<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Edit site</h2>
<p>Use the form below to rework a site for the University News and Events system. </p>


<cfoutput query="getsite">
<form action="sites_rework_action.cfm" method="post">
<table>
<tr>
	<td>Site<br /> 
<input type="text" name="site_name" value="#site_name#" size="50" maxlength="#application.long#" class="form"><br /><br />
Description<br /> 
<textarea cols="40" rows="12" name="description">#description#</textarea><br /><br />
<br /><br />
URI<br /> 
<input type="text" name="uri" value="#uri#" size="50" maxlength="#application.long#" class="form"><br /><br />
Should this site be public and listed in navigation?<br /><br />
<input type="radio" name="ispublic" value="1" <cfif getsite.ispublic is 1>checked</cfif>>yes&nbsp;&nbsp;<input type="radio" name="ispublic" value="0" <cfif getsite.ispublic is 0>checked</cfif>>no<br /><br />
Number of news items that the site pulls for syndication<br /> 
<input type="text" name="maxrows" value="#maxrows#" size="2" maxlength="2" class="form"><br /><br />
Will this site have a calendar?<br />
<input type="radio" name="calendar" value="1" <cfif getsite.calendar is 1>checked</cfif>>yes&nbsp;&nbsp;<input type="radio" name="calendar" value="0" <cfif getsite.calendar is 0>checked</cfif>>no<br /><br />
Will this site have a news publication?<br />
<input type="radio" name="news" value="1" <cfif getsite.news is 1>checked</cfif>>yes&nbsp;&nbsp;<input type="radio" name="news" value="0" <cfif getsite.news is 0>checked</cfif>>no<br /><br />
</td>
	
</tr></table>
<input type="hidden" name="siteid" value="#siteid#">
<input type="submit" value="save" class="button"></form></cfoutput>

<cfinclude template="/newsevents/secure/templates/footer.cfm">

