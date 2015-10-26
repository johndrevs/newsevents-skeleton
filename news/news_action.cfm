<cfif parameterexists (form.newsid)>
<cfset url.newsid=#form.newsid#>
</cfif>


<cfif parameterexists (form.rework)>
<cfinclude template="news_rework_check.cfm">
<cfelseif  parameterexists (form.delete)>

<cfinclude template="news_delete_action.cfm">
<cfelseif  parameterexists (form.control)>
<cfinclude template="news_placement.cfm">

<cfelseif  parameterexists (form.publish)>
<cfinclude template="news_publish.cfm">

<cfelseif  parameterexists (form.view)>
<cfinclude template="news_site_view.cfm">

	<cfelse>
		dda
</cfif>