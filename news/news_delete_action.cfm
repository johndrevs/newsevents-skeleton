
<cfquery name="getnews" datasource="#application.datasource_update#">
update CUNVMCS.news
set isactive=0
where newsid=#url.newsid#
</cfquery>

<cflocation url="index.cfm" addtoken="No">