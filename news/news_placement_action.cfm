<cfif  parameterexists (form.publishsite)>
<cfset url.news_ref_level=2>
<cfelseif  parameterexists (form.reject)>
<cfset url.news_ref_level=0>
<cfelseif  parameterexists (form.unpublish)>
<cfset url.news_ref_level=1>
<cfelseif  parameterexists (form.unpost)>
<cfset url.news_ref_level=4>
</cfif>


<cfquery name="levelchange" datasource="#application.datasource_update#">
UPDATE CUNVMCS.news_ref
set news_ref_level=#url.news_ref_level#, actiondate=SYSDATE
where news_refid=#form.news_refid#
</cfquery>

<Cfset notify=#form.notify#>
<cfinclude template="../templates/notify.cfm">

<cflocation url="news_placement.cfm?newsid=#form.newsid#" addtoken="No">