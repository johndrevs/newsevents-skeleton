<!--Update Image-->
<cfif #application.newsimage# is 1><cfif form.image is not 'none'>
		<cffile action="RENAME" source="D:\CFusionMX\wwwroot\NewsEvents\public\images\#form.image#.jpg" destination="D:\CFusionMX\wwwroot\NewsEvents\public\images\#form.newsid#.jpg">
	</cfif>
	</cfif>
	
<cfquery name="updatenews" datasource="#application.datasource_update#">
		update     CUNVMCS.news
SET       shorttitle='#form.shorttitle#', longtitle='#form.longtitle#', DESC_CLOB='#form.description#', byline='#form.byline#',bylinetitle='#form.bylinetitle#', dateline='#form.dateline#',content2='#form.content#',pubdate=to_date ('#dateformat(form.pubdate, "yyyy/mm/dd")##timeformat(form.pubdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'), pulldate=to_date ('#dateformat(form.pulldate, "yyyy/mm/dd")##timeformat(form.pulldate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),lastmod=SYSDATE
where newsid=#form.newsid#
</cfquery>

<Cfset notify=#form.notify#>
<cfinclude template="../templates/notify.cfm">
<!--- pubdate=#createodbcdate(form.pubdate)#, pulldate=#createodbcdate(form.pulldate)#,

 <cflocation url="index.cfm" addtoken="No">  --->