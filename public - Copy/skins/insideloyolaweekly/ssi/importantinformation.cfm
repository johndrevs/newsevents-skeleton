<cfsilent>
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where 0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
</cfsilent>
<dl>
  <cfoutput query="getnews">
    <cfsilent>
    <cfquery name="getnews2" datasource="#application.datasource_select#">
select news.desc_clob from cunvmcs.news where news.newsid=#getnews.newsid#
</cfquery>
    </cfsilent>
    <cfif currentrow eq 1>
      <cfset image_link='#image_link#'>
      <cfset image_alt='#shorttitle#'>
      <dt style="font-size: 19px;font-weight:bold;">
        <cfelse>
      <dt style="font-weight:bold;font-size: 15px;">
    </cfif>
    <cfif link_override EQ 1>
      <a href="#article_link#" style="color: ##a30046;text-decoration:none;">
      <cfelse>
      <a href="http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/internal.cfm?aud=#aud#&amp;newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="color: ##a30046;text-decoration:none;">
    </cfif>
    #shorttitle#</a>
    </dt>
    <cfif currentrow eq 1>
      <dd style="padding:0 0 10px 0;margin:0;font-size:15px;">
        <cfelse>
      <dd style="padding:0 0 10px 0;margin:0;font-size:13px;">
    </cfif>
    #replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")# <strong>
    <cfif link_override EQ 1>
      <a href="#article_link#" style="color: ##a30046;text-decoration:none;">
      <cfelse>
      <a href="http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/internal.cfm?aud=#aud#&amp;newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="color: ##a30046;text-decoration:none">
    </cfif>
    More...</a></strong>
    </dd>
  </cfoutput>
</dl>