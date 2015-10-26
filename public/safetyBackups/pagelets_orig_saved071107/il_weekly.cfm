<cfset siteid=101>


<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#variables.siteid#
</cfquery>
<cfquery name="getnews" datasource="#application.datasource_select#" maxrows="#getnewssource.maxrows#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	
order by priority</cfquery>


	

<div class="pagelet_right">
<div class="pagelet_title">Inside Loyola Weekly Newsletter</div>
<div class="pagelet_content">

<cfif getnews.recordcount gt 0>
<p><div class="vspace10b"><cfoutput query="getnews" startrow=1 maxrows=1><cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery><cfif link_override EQ 1><strong><a href="#article_link#"><cfelse><a href="news_story.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></strong><cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg')><img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l" /><cfelseif  getnews.image_link neq ''><img src="#getnews.image_link#" alt="#getnews.shorttitle#" border="0" align="left"></cfif><br>#replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")#</cfoutput></div></p>
<cfset daterangebeg=DateAdd("d", -(DayOfWeek(now())-2), now())>
	<cfset daterangebeg=#createodbcdatetime(daterangebeg)#>

<cfoutput query="getnews" startrow=1 maxrows=1><p><strong>#dateformat(daterangebeg, "dddd mmmm d, yyyy")#</strong></p></cfoutput>
<ul>
<cfoutput query="getnews" startrow=2><li><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_story.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></li></cfoutput>
</ul>
<cfelse>
There are no Inside Loyola stories currently available for publication.
</cfif>
<dl>
<dt>Regular Features:</dt>
<dd><a href="http://www.luc.edu/ilweekly/index.shtml#commentaries">Experts' Commentary</a>, <a href="http://www.luc.edu/ilweekly/index.shtml#fyi">Around Campus</a>, <a href="http://www.luc.edu/ilweekly/index.shtml#opps">Opportunities</a>, <a href="http://www.luc.edu/ilweekly/index.shtml#kudos">Kudos</a>, <a href="http://www.luc.edu/ilweekly/index.shtml#whatsnew">What's New</a></dd>
</dl>

<div align="right"><a href="http://www.luc.edu/ilweekly/">Read Full Issue</a> | <a href="http://www.luc.edu/ilweekly/about.shtml">Archives</a></div>
</div>
</div>	