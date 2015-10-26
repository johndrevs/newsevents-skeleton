
<cfinclude template="/newsevents/templates/securityheader.cfm">
<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT      level,site_name
FROM         CUNVMCS.news_ref,CUNVMCS.sites 
where newsid=#url.newsid# and news_ref_level=2 and news_ref.siteid=sites.siteid
</cfquery>
<cfif getpublish.recordcount gt 0>	
	<cfset page='news'>	
	<cfset sort='no'>
	<cfinclude template="/newsevents/templates_new/top.cfm">
	
<h2>Rework News Item</h2>
<p><strong>This news item is published to the following sites:</strong><br/>
		<cfoutput query="getpublish">
			#site_name#<br/>
		</cfoutput>
</p>

		<cfif session.administrator is 1>
<p>In order to rework the article you will need to unpublish it from all sites by clicking on the button below.</p>

<p>
			<form action="news_unpublishall.cfm" method="post">
				<cfoutput>
					<input type="hidden" name="newsid" value="#newsid#">
				</cfoutput>
				<input type="submit" name="rework" value="unpublish all" class="button">
			</form>	
Please be advised that by unpublishing from all sites you are removing it from publication. Once the item has been reworked, you will need to place it again.
		<cfelse>
In order to rework this article it must be unpublished by the system administrator. To contact the system administrator, please<a href="">click here</a>.</p>
		</cfif><br /><br /><br />
<cfinclude template="/newsevents/templates_new/footer.cfm">

	<cfelse>
		<cfoutput>
			<cflocation url="news_rework.cfm?newsid=#url.newsid#" addtoken="No">
		</cfoutput>
	</cfif>


