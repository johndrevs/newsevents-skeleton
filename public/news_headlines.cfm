


<cfquery name="getnews" datasource="#application.datasource_select#">
SELECT 
  NEWS.NEWSID, NEWS.SHORTTITLE, NEWS.LONGTITLE, 
   NEWS_REF.PRIORITY
FROM 
  CUNVMCS.NEWS, 
  CUNVMCS.NEWS_REF
WHERE 
(   NEWS_REF.NEWSID=NEWS.NEWSID ) and NEWS.ISACTIVE=1 AND news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') <cfif url.siteid is not 0>and news_ref.siteid in (#url.siteid#)</cfif>
group by NEWS.NEWSID, NEWS.SHORTTITLE, NEWS.LONGTITLE, 
   NEWS_REF.PRIORITY

</cfquery>

<cfif url.siteid is 0>
	<h2>University Wide News</h2>
<cfelse>
	<cfoutput>
#getnewssource.site_name# News
	</cfoutput>
</cfif>
<br/>
<br/>
<cfoutput query="getnews">
<cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery>

	<cfif currentrow is 1>

				<cfif fileexists('#application.dir#\public\images\#newsid#.jpg')>
				<img src="newsevents/public/images/#newsid#.jpg" alt="" border="0">
				</cfif>

<p><a href="news.cfm?newsid=#newsid#"><strong>#shorttitle#</strong></a><br/>
#getnews2.DESC_CLOB# <a href="news.cfm?newsid=#newsid#">more...</a></p>
			
	<cfelse>
		<cfif currentrow is 2>
			<table>
		</cfif>
		<cfif getnews.currentrow mod 2>
		<cfelse>
			<tr>
		</cfif>
		<td width="249" valign="top">
		<cfif currentrow is 2>
			
<strong>University Headlines</strong>
		
		</cfif>
		
				<p>&raquo; <a href="news.cfm?newsid=#newsid#">#longtitle#</a><br />
				
				#getnews2.DESC_CLOB##currentrow#</p>
				
		</td>
		<cfif getnews.currentrow mod 2>
			</tr>
		</cfif>
	</cfif>
</cfoutput>
		</table>