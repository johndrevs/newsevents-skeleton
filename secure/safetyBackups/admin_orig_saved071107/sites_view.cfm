<!--- --->

<cfquery name="getsites" datasource="#application.datasource_select#">
SELECT      sites.site_name, sites.uri, sites.description, sites.creator, users.firstname, users.lastname
		FROM         CUNVMCS.sites,CUNVMCS.users 
		WHERE       sites.creator = users.userid
		and siteid=#url.siteid#
</cfquery>
<cfinclude template="/newsevents/secure/templates/top_small.cfm">	
<cfoutput query="getsites">
<cfquery name="getaccess" datasource="#application.datasource_select#">
SELECT      distinct AUTH_TBL.userid, AUTH_TBL.siteid, AUTH_TBL.auth_level, users.lastname, users.firstname
			FROM         CUNVMCS.AUTH_TBL, CUNVMCS.users 
			WHERE       AUTH_TBL.userid = users.userid and AUTH_TBL.siteid=#siteid#
			
			group by AUTH_TBL.userid,AUTH_TBL.siteid, AUTH_TBL.auth_level, users.lastname, users.firstname</cfquery>

<table width="100%" border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
		<tr>
			<td><strong>Name:</strong></td>
			<td>#site_name#
<p><cfif description neq '1'>#description#</cfif></p>
</td>
		</tr>
		<tr>
			<td><strong>URI:</strong></td>
			<td><a href="#uri#">#uri#</a></td>
		</tr>
		<tr>
			<td><strong>Created by:</strong></td>
			<td>#firstname# #lastname#</td>
		</tr></cfoutput>
		<tr>
			<td><strong>Non-Administrator Access by:</strong></td>
			<td>
			<cfoutput query="getaccess" group="userid">
				<a href="/newsevents/admin/users_view.cfm?userid=#userid#">#lastname#, #firstname#</a>					
				<cfif auth_level is 1>(post)		
				<cfelseif auth_level is 2>(publish)
				<cfelse>
				</cfif>
				<br/>
			</cfoutput></td>
		</tr>
	</table>

		
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">	 