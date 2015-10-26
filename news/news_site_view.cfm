
<cfinclude template="/newsevents/templates/securityheader.cfm">
	
<cfif parameterexists (form.siteid)>	
	<cfset form.siteid=#form.siteid#>
<cfelse>
	<cfset thekey = "test">	
	<cfset form.siteid=#decrypt(url.siteid,thekey)#>
</cfif>

<cfquery name="getsiteinfo" datasource="#application.datasource_select#">
SELECT      site_name, uri, description, maxrows
FROM         CUNVMCS.sites 
where siteid=#form.siteid#
</cfquery>

<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#form.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	
order by priority
</cfquery>

<cfset ids=valuelist(getnews.newsid)>

<cfquery name="getnewsmax" datasource="#application.datasource_select#">
select news.newsid
from CUNVMCS.news, CUNVMCS.news_ref
		where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#form.siteid#) and news_ref.news_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')
</cfquery>

<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>Control News Items by Site</h2>
	<cfoutput><p>The box below represents the presentation order of the active news items on the <strong>#getsiteinfo.site_name#</strong> site. This will only display the active news items for your site and if there is a restriction on the number of news items presented, this will be reflected as well. Please note that the actual appearance of the <strong>#getsiteinfo.site_name#</strong> site will be different.</p>
	
<p><strong>#getsiteinfo.site_name#</strong></p>
	</cfoutput>
	
	<p><table  border="0" cellspacing="1" cellpadding="4" class="tabulargrey">	
		<cfif getnews.recordcount lt 1>
			<tr>
				<td>There are no news items currently active for this site</td>
			</tr>		
		<cfelseif getnews.recordcount is 1>
			<cfoutput query="getnews">
				<tr>
					<td><a href="##" onClick="window.open('news_view.cfm?newsid=#newsid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
					<td>&nbsp;</td>
				</tr>
			</cfoutput>
		<cfelse>
			<cfset previousnewsid=0>
			<cfoutput query="getnews">
			<cfif currentrow lt getnews.recordcount>				
				<cfset followingnewsid=ListGetAt(ids, (currentrow+1))>
			</cfif>
			<cfset priority=currentrow>					

				<td><a href="##" onClick="window.open('news_view.cfm?newsid=#newsid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a><!--p=#previousnewsid# f=#followingnewsid# now=#newsid# pri=#variables.priority#--></td>
				<td>					
				<cfif currentrow gt 1><a href="news_priorityupdate.cfm?siteid=#form.siteid#&newsid=#newsid#&move=up&previousnewsid=#previousnewsid#&priority=#variables.priority#"><img src="/newsevents/images/up.gif" alt="" width="47" height="11" border="0"></a>
				</cfif></td>
				<td>					
				<cfif currentrow lt getnews.recordcount><a href="news_priorityupdate.cfm?siteid=#form.siteid#&newsid=#newsid#&move=down&followingnewsid=#followingnewsid#&priority=#variables.priority#"><img src="/newsevents/images/down.gif" alt="" width="47" height="11" border="0"></a>
				</cfif></td>
</tr>			
			<cfset previousnewsid=#newsid#>
			</cfoutput>
		</cfif>
	</table>
	<cfoutput>
<p>		There are currently #getnewsmax.recordcount# news items active for this site.
		<br/>The site publishes the #getsiteinfo.maxrows# top news items.			
		<cfif (getnewsmax.recordcount-getsiteinfo.maxrows) lte 0>There are still #evaluate((getnewsmax.recordcount-getsiteinfo.maxrows)*-1)# places to be filled.
		<cfelse>There are #evaluate(getnewsmax.recordcount-getsiteinfo.maxrows)# news items on deck.
		</cfif></p>

	</cfoutput>
<cfinclude template="/newsevents/templates_new/footer.cfm">