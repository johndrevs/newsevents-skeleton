<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where 0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
<dl>
  <cfoutput query="getnews">
   <cfsilent> <cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT NEWS.DESC_CLOB
FROM CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery></cfsilent>
    <dt>
      <cfif link_override EQ 1>
        <a href="#article_link#" style="color: ##a30046;text-decoration:none">
        <cfelse>
        <a href="http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/internal.cfm?aud=#aud#&amp;newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="font-size: 11px;color: ##a30046;text-decoration:none;">
      </cfif>
      #shorttitle#</a></dt>
    <cfif getnews2.DESC_CLOB neq ''>
      <dd style="margin:0 0 10px 0;list-style:none;font-size: 11.5px;padding:0px;">#replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")# </dd>
    </cfif>
  </cfoutput>
</dl>