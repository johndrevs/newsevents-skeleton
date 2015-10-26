
<cfquery name="unpublishall" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET            news_ref_level=1
where newsid=#form.newsid#
</cfquery>

<cflocation url="news_rework_check.cfm?newsid=#form.newsid#" addtoken="No">