<!--- This pagelet relies upon the University News - Headlines site to have a site id of 41 --->
<cfset siteid=41>


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

<div class="pagelet">
<div class="pagelet_title">Top Stories</div>
<div class="pagelet_content">



<cfif getnews.recordcount gt 0>
<cfoutput query="getnews">

<cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery>

<cfif currentrow is 1>				
	<cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg')><img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l" /><cfelseif  getnews.image_link neq ''><img src="#getnews.image_link#" alt="#getnews.shorttitle#" border="0" align="left"></cfif>


<feature class="headlinesright">
			
			<h2>Feature Video</h2>
			<a href="http://www.luc.edu/partner/campaignnews/cuneogardens.html"><img src="/newsevents/public/pagelets/cuneo.jpg" alt="Click to View Video" title="Click to View Video" border="0" width="250" height="155"></a>

</feature>


			<dl>
				<dt><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></dt>
				<dd>#replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")# <strong><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>More...</a></strong></dd>
			</dl>
			

					<ul class="headlines">
						
<cfelseif currentrow neq 4>
	<li><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></li>
</cfif>
</cfoutput>
</ul>

<cfelse>
There are no Headlines currently available for publication.
</cfif>

<br><br>
<!-- end story output -->
</div>
</div>	