<!--- This pagelet relies upon the University News - Headlines site to have a site id of 41 --->
<cfset siteid=81>

<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#variables.siteid#
</cfquery>

<cfquery name="getnews" datasource="#application.datasource_select#" maxrows="#getnewssource.maxrows#">
select news.newsid,news.desc_clob, shorttitle,created,byline,pubdate,pulldate,priority,article_link,link_override
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	

order by priority
</cfquery>
<div class="pagelet_left">
<div class="pagelet_title">Inside Loyola Monthly Newsletter</div>
<div class="pagelet_content">
<div class="vspace10b">

<a href="http://www.luc.edu/insideloyola/"><img src="images/il.gif" alt="" width="200" height="42" border="0" align="right"></a></div>
<cfif getnews.recordcount gt 0>
<cfoutput query="getnews" startrow=1 maxrows=1><p><strong>#dateformat(getnews.pubdate, "mmmm, yyyy")#</strong></p></cfoutput>

<dl>
<cfoutput query="getnews" group="newsid">
	<dt><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_story.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></dt>
	<dd>#replace(getnews.DESC_CLOB, "*",chr(34), "ALL")#</dd>
</cfoutput>

</dl> 
<cfelse>
There are no Inside Loyola stories currently available for publication.
</cfif>
<div align="right"><a href="http://www.luc.edu/insideloyola/">Read Full Issue</a> | <a href="http://www.luc.edu/insideloyola/about.shtml">Archives</a></div>
</div>
</div>	