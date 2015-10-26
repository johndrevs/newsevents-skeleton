
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority

</cfquery>

	<dl>
		<cfoutput query="getnews"><cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery><cfif currentrow eq 1><dt class="prime"><cfelse><dt></cfif><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?aud=#aud#&newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></dt>
				<dd>#replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")# <strong><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?aud=#aud#&newsID=#newsid#&siteid=0"></cfif>More...</a></strong></dd></cfoutput>
		
	</dl>