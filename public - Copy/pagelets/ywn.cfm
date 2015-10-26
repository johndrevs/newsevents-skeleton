<cfset siteid=101>


<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#variables.siteid#
</cfquery>
<cfquery name="getnews" datasource="#application.datasource_select#" maxrows="#getnewssource.maxrows#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	
order by priority</cfquery>


	<cfset daterangebeg=DateAdd("d", -(DayOfWeek(getnews.pubdate)-2), getnews.pubdate)>
	<cfset daterangebeg=#createodbcdatetime(daterangebeg)#>

<div class="pagelet_right">
<div class="pagelet_title">Your Upcoming Weekly News</div>
<div class="pagelet_content">
<div class="vspace10b"><em>Weekly newsletter for faculty &amp; staff</em></div>
<cfoutput query="getnews" startrow=1 maxrows=1><p><strong>#dateformat(daterangebeg, "dddd mmmm d, yyyy")#</strong></p></cfoutput>
<ul>
<cfoutput query="getnews"><li><a href="news_story.cfm?newsID=#newsid#&siteid=0">#shorttitle#</a></li></cfoutput>
</ul>

<dl>
<dt>Regular Features:</dt>
<dd> 
<a href="#">Faculty Commentary</a>, <a href="#">For Your Information</a>, <a href="#">Opportunities</a>, <a href="#">Kudos</a>, <a href="#">What's New</a></dd>
</dl>

<div align="right">...<a href="#">YWN Archives</a></div>
</div>
</div>	