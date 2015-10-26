
<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="getplacement" datasource="#application.datasource_select#">
SELECT      news_ref.userid, news_ref.siteid, news_ref.actiondate, news_ref.news_ref_level, news.created, news.pubdate, news.pulldate, news.shorttitle, news.longtitle, sites.site_name, users.user_name, users.lastname, users.firstname, news.newsid, news_ref.news_refid
FROM         CUNVMCS.news, CUNVMCS.news_ref, CUNVMCS.users, CUNVMCS.sites 
WHERE       news_ref.userid = users.userid AND news_ref.siteid = sites.siteid AND news_ref.newsid = news.newsid AND news.newsid=#url.newsid# and news_ref_level <>4
order by news_ref_level desc
</cfquery>

<cfset used=valuelist(getplacement.siteid)>

<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT distinct SITES.SITEID, SITES.SITE_NAME
FROM CUNVMCS.SITES
WHERE sites.isactive =1 and SITEID in (#session.publish#) and SITES.siteid  NOT IN(#variables.used#)
</cfquery>

<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT distinct SITES.SITEID, SITES.SITE_NAME
FROM CUNVMCS.SITES
WHERE sites.isactive =1 and SITEID in (#session.post#) and SITES.siteid  NOT IN(#variables.used#)
</cfquery>

<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>Existing Placements</h2>
<cfif getplacement.pubdate GTE #now()# or getplacement.pulldate LTE #now()#><strong>This event is inactive</strong>
			</cfif>	
		<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<cfoutput query="getplacement" group="news_ref_level" groupcasesensitive="Yes">
			<tr>
				<td colspan="4"><strong>The article "#shorttitle#"					
				<cfif news_ref_level is 1>is posted to the following sites				
				<cfelseif news_ref_level is 2>is published to the following sites				
				<cfelseif news_ref_level is 0>has been rejected for the following sites by the site's publisher
				</cfif></strong></td>
			</tr>
			<cfoutput>
				<form action="news_placement_action.cfm" method="post">
					<tr>
						<td>#site_name#</td>
						<td>#dateformat(actiondate,"mm.dd.yyyy")#</td>
						<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a></td>
						<td>							
						<cfif ListContains(#session.publish#, #siteid#)>								
							<cfif news_ref_level is 1>
								<input type="submit" name="publishsite" value="publish to this site" class="button">
								<input type="submit" name="reject" value="reject for this site" class="button">							
							<cfelseif news_ref_level is 2>
								<input type="submit" name="unpublish" value="unpublish on this site" class="button">
							</cfif>
						<cfelseif getplacement.userid is session.userid>
							<input type="submit" name="unpost" value="unpost to this site" class="button">
						<cfelse>
						You don't have publish access to this site
						</cfif>
						&nbsp;</td>
					</tr>
					<input type="hidden" name="news_refid" value="#news_refid#">
					<input type="hidden" name="newsid" value="#url.newsid#">
					<input type="hidden" name="notify" value="#getplacement.userid#">
				</form>
			</cfoutput>
		</cfoutput>
	</table>
	
	<h3>Further Placements</h3>
	<form action="news_placement_action2.cfm" method="post">
		<cfoutput>
			Publish Article to:
			<br/>				
			<cfif getpublish.recordcount gt 0>
				<select name="publish" size="3" multiple>
					<cfloop query="getpublish">
						<option value="#siteid#">#site_name#</option>
					</cfloop>
				</select>
				<br/>
				<br/>
			<cfelse>
			You either do not currently have access to publish to any sites or this article is already published  to the sites you do.
				<br/>
				<br/>
			</cfif>
			Post Article to:
			<br/>				
			<cfif getpost.recordcount gt 0>
				<select name="post" size="3" multiple>
					<cfloop query="getpost">
						<option value="#siteid#">#site_name#</option>
					</cfloop>
				</select>
				<br/>
				<br/>
			<cfelse>
			You either do not currently have access to post to any sites or this article is already posted to the sites you do.
				<br/>
				<br/>
			</cfif>
							<cfif getpost.recordcount gt 0 or getpublish.recordcount gt 0>
				<input type="submit" value="place more sites" class="button">
				<input type="hidden" name="newsid" value="#url.newsid#">
			</cfif>
		</cfoutput>
	</form>
	
<cfinclude template="../templates_new/footer.cfm">