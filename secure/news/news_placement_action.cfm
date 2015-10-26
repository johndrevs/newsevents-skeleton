<cfif  isDefined("form.publishsite")>
<cfset url.news_ref_level=2>
<cfelseif  isDefined("form.reject")>
<cfset url.news_ref_level=0>
<cfelseif  isDefined("form.unpublish")>
<cfset url.news_ref_level=1>
<cfelseif  isDefined("form.unpost")>
<cfset url.news_ref_level=4>
</cfif>


<cfquery name="levelchange" datasource="#application.datasource_update#">
UPDATE CUNVMCS.news_ref
set news_ref_level=#url.news_ref_level#, actiondate=SYSDATE
where news_refid=#form.news_refid#
</cfquery>

<!--- <Cfset notify=#form.notify#>
<cfinclude template="/newsevents/secure/templates/notify.cfm"> --->

<cflocation url="news_placement.cfm?newsid=#form.newsid#" addtoken="No">