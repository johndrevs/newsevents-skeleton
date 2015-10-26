

<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT      news_ref_level,site_name,userid,sites.siteid
FROM         CUNVMCS.news_ref,CUNVMCS.sites 
where newsid=#url.newsid# and news_ref_level=2 and news_ref.siteid=sites.siteid
</cfquery>
<cfset publishby=valuelist(getpublish.userid)>
<cfset publishto=valuelist(getpublish.siteid)>
<cfset listNotFound = "" />
<cfloop index="word" list="#publishto#">
	<cfif NOT listFind(session.publish, word)>
		<cfset listNotFound = listAppend(listNotFound, word) />
	</cfif>
</cfloop>
<cfset howmany=listlen(listnotfound)>

	<cfset page='news'>	
	<cfset sort='no'>
	<cfinclude template="/newsevents/secure/templates/top.cfm">
	
<h2>Rework News Item</h2>
<cfif getpublish.recordcount gt 0>	
  <p><strong>This news item is published to the following site(s):</strong><br />
    <cfoutput query="getpublish"> #site_name#<br/>
    </cfoutput> </p>

		<cfoutput>
    <cfif howmany lt 1>
 <p><strong>In order to rework the news item you will need to release it from these sites by clicking on the button below.</strong>
			<form action="news_unpublishall.cfm" method="post">
				<cfoutput>
					<input type="hidden" name="newsid" value="#newsid#">
				</cfoutput>
				<input type="submit" name="rework" value="unpublish all" class="button">
			</form>	</p>
      <p>Please be advised that by releasing from these sites you are removing it from publication. Once the item has been reworked, you will need to place it again.</p>
		<cfelse>
<cfquery name="getsites" datasource="#application.datasource_select#">
select site_name,siteid,ispublic
		from CUNVMCS.sites
		where  siteid in (#variables.listnotfound#)
</cfquery>
      <p><strong>In order to rework this news item it must be unpublished on the following sites which you don't have access to:</strong>
     <p><cfloop query="getsites"> #site_name#<br /></cfloop></p>

      <p>To contact the system administrator to help in this process, please <a href="mailto:#application.adminemail#">click here</a>.</p>
    </cfif></cfoutput>
<cfinclude template="/newsevents/secure/templates/footer.cfm">

	<cfelse>
		<cfoutput>
			<cflocation url="news_rework.cfm?newsid=#url.newsid#" addtoken="No">
		</cfoutput>
	</cfif>


