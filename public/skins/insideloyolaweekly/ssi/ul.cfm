<cfsilent>
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where 0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
</cfsilent>
<ul style="margin:0;padding-left:15px;color:#a30046;">
  <cfoutput query="getnews">
    <li style="font-size: 12.5px;margin-left:0px;list-style:disc;margin-bottom: 5px;color:##a30046;"><a href="http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/internal.cfm?aud=#aud#&amp;newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="color: ##a30046;text-decoration:none;">#shorttitle#</a></li>
  </cfoutput>
</ul>