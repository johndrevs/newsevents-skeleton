<cfsilent><cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where 0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery></cfsilent>
<ul style="margin:0 0 15px 0;padding:0 0px;color:#a30046;list-style:none">
<cfoutput query="getnews" maxrows="6"><li style="font:12px/14px Arial, Helvetica, sans-serif; color:##666;margin-left:0px;padding:2px 0px;"><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="color: ##666;text-decoration:none;margin:0px;padding:0px;">#shorttitle#</a></li></cfoutput>
</ul>