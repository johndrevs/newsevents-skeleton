<cfif isDefined("form.newsid")>
<cfset url.newsid=#form.newsid#>
</cfif>


<cfif isDefined("form.rework")>
<cfinclude template="news_rework_check.cfm">

<cfelseif  isDefined("form.delete")>

<cfinclude template="news_delete_action.cfm">
<cfelseif  isDefined("form.control")>
<cfinclude template="news_placement.cfm">

<cfelseif  isDefined("form.publish")>
<cfinclude template="news_publish.cfm">

<cfelseif  isDefined("form.view")>
<cfinclude template="news_site_view.cfm">

	<cfelse>
		dda
</cfif>