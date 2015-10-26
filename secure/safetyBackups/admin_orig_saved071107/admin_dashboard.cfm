


<cfquery name="getsiteaccess" datasource="#application.datasource_select#">
SELECT      sites.site_name, sites.siteid
FROM         CUNVMCS.auth_tbl, CUNVMCS.sites 
WHERE       auth_tbl.siteid = sites.siteid AND auth_tbl.userid=#session.userid#
</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Administration</h2>
	<cfoutput>
<p>The following menu displays the administrative functions you have access to. If there are other parts of the system that you need changing please contact the <a href="mailto:#application.adminemail#">system administrator</a>.</p>
	</cfoutput>

	<table width="55%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>				
			<cfif session.administrator is 1>
				<th width="50%">System Control</th>
			</cfif>
				<!--- <th>Account Control</th> --->
		<tr>
			<cfif session.administrator is 1><td>
				<dl>
					<dt class="title">Users</dt>
					<dd/><a href="users_add.cfm">Add a User</a>
					<dd/><a href="users_list.cfm">Manage Users</a>
				</dl>
				<dl>
					<dt class="title">Faculty</dt>
					<dd/><a href="faculty_category_manage.cfm">Manage Categories</a>
<dd/><a href="faculty_add.cfm">Add a  Faculty Expert</a>
<dd/><a href="faculty_attribute_list.cfm">Manage a Faculty Expert</a>
<dd/><a href="faculty_surveyresponders.cfm">View Survey Responses</a>
				</dl>
				<dl>
					<dt class="title">IL Weekly</dt>
					<dd/><a href="il_weekly_generate.cfm">Generate E-Mail</a>

				</dl>
				<dl>
					<dt class="title">Sites</dt>
					<dd/><a href="sites_add.cfm">Add a Site</a>
					<dd/><a href="/newsevents/public/syndicate/syndicate_news.cfm">Force News Syndication</a>
					<dd/><a href="/newsevents/public/syndicate/syndicate_events.cfm">Force Event Syndication</a>
					<dd/><a href="sites_list.cfm">Manage Sites</a>
				</dl>
				<dl>
					<dt class="title">Messages</dt>
					<dd/><a href="messages_add.cfm">Post a Message</a>
					<dd/><a href="messages_list.cfm">View Messages</a>
				</dl>
				<dl>
					<dt class="title">General Locations</dt>
					<dd/><a href="locations_add.cfm">Add a Location</a>
					<dd/><a href="locations_list.cfm">Manage Locations</a>
				</dl></td>
			</cfif>
			<!--- <td width="50%">
			<cfoutput>
				<form action="admin_action.cfm" method="post">	
					<dl>
						<dt class="title">Edit Your Account</dt>
						<dd/>
						<input type="submit" name="rework" value="edit" class="button">
						<input type="hidden" name="itemid" value="#session.userid#"></dd>
					</dl>
				</form>
			</cfoutput></td> --->
		</tr>
	</table>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
