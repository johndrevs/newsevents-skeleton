

<cfquery name="updatenews" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET       news_ref_level=2
where news_refid=#form.news_refid#
</cfquery>
	

<cflocation url="news_approve.cfm" addtoken="No">