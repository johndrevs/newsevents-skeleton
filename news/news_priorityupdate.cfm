
<cfif url.move is 'up'>
	<cfset previous=url.priority>
	<cfset newpriority=url.priority-1>
	<cfquery name="updatedowner" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET      priority=#variables.previous#
where newsid=#url.previousnewsid# and siteid=#url.siteid#
	</cfquery>
	<cfquery name="updateupper" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET      priority=#variables.newpriority#
where newsid=#url.newsid# and siteid=#url.siteid#
	</cfquery>
<cfelseif url.move is 'down'>
	<cfset previous=url.priority>
	<cfset newpriority=url.priority+1>
	<cfquery name="updatedowner" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET      priority=#variables.previous#
where newsid=#url.followingnewsid# and siteid=#url.siteid#
	</cfquery>
	<cfquery name="updateupper" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET      priority=#variables.newpriority#
where newsid=#url.newsid# and siteid=#url.siteid#
	</cfquery>
</cfif>
<cfset thekey = "test">
<cfoutput>
	<cflocation url="news_site_view.cfm?siteid=#URLEncodedFormat(Encrypt(url.siteid, thekey))#" addtoken="No">
</cfoutput>
