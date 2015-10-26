<cfquery datasource="#application.datasource_select#" name="getnewssourcewt">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=136
</cfquery>
<cfquery name="getnewswt" datasource="#application.datasource_select#" maxrows="#getnewssourcewt.maxrows#">
select news.newsid,news.desc_clob, shorttitle,created,byline,pubdate,pulldate,priority,article_link,link_override
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(136) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	

order by priority
</cfquery>

<cfquery datasource="#application.datasource_select#" name="getnewssourcelsc">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=137
</cfquery>
<cfquery name="getnewslsc" datasource="#application.datasource_select#" maxrows="#getnewssourcelsc.maxrows#">
select news.newsid,news.desc_clob, shorttitle,created,byline,pubdate,pulldate,priority,article_link,link_override
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(137) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	

order by priority
</cfquery><div class="pagelet_grey">
<div class="pagelet_greytitle">Facilities Update</div>
<div class="pagelet_content">
<div class="vspace10b"><em>Water Tower Campus:</em></div>
<ul>
<cfif getnewswt.recordcount gt 0>
<cfoutput query="getnewswt" group="newsid">
	<li><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_story.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></li>
</cfoutput>
<cfelse>
<li>There are no updates currently available for publication.</li>
</cfif>
</ul>

<div class="vspace10b"><em>Lake Shore Campus:</em></div>
<ul>
<cfif getnewslsc.recordcount gt 0>
<cfoutput query="getnewslsc" group="newsid">
	<li><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_story.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></li>
</cfoutput>
<cfelse>
<li>There are no updates currently available for publication.</li>
</cfif>
</ul>

</div>
</div>	