<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>

<cfif getnews.recordcount gt 0>
 <cfoutput> <h4>#title#</h4></cfoutput>
  <ul>
    <cfoutput query="getnews">
      <li><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&siteid=0&date=#dateformat(now, "mm/dd/yyyy")#">#shorttitle#</a>
        <cfif title eq 'ACADEMICS'>
          <cfquery name="getnews2" datasource="#application.datasource_select#">
select desc_clob
from CUNVMCS.news
where newsID=#getnews.newsid#
</cfquery>
          <p>#replace(getnews2.desc_clob, "*", "&quot;", "all")#</p>
        </cfif>
      </li>
    </cfoutput>
  </ul>
</cfif>
