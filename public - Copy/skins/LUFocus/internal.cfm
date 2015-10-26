

<cfquery name="getnews" datasource="#application.datasource_select#">
select content_clob,content_clob2, pubdate, pulldate, shorttitle, bylinetitle,dateline, news.newsid, longtitle,DESC_CLOB,created,byline,image_link,link_override,article_link
from CUNVMCS.news
where newsID=#url.newsid#
</cfquery>
<cfset pagetitle=getnews.shorttitle>
<cfinclude template="ssi/top.cfm">
<cfquery name="gettop" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#tn_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
<cfset toplist=valuelist(gettop.newsid)>
<cfset toplist=ListAppend(toplist, 0)>
<cfset top=ListGetAt(toplist, 1)>
<cfif top eq url.newsid><cfset image=0><cfelse><cfset image=1></cfif>
<cfset temp = "#getnews.content_clob##getnews.content_clob2#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset description="#getnews.DESC_CLOB#">
<cfset pubdate="#getnews.pubdate#">
<cfset pulldate="#getnews.pulldate#">
<cfset longtitle="#getnews.longtitle#">
<cfset shorttitle="#getnews.shorttitle#">
<cfset byline="#getnews.byline#">
<cfset bylinetitle="#getnews.bylinetitle#">
<cfset dateline="#getnews.dateline#">
<cfset content="#getnews.content_clob#">
<cfset image_link="#getnews.image_link#">
<cfset article_link="#getnews.article_link#">
<cfset link_override="#getnews.link_override#">
<cfif isDefined("url.siteid")>
  <cfset url.siteid=#url.siteid#>
  <cfelse>
  <cfset url.siteid=0>
</cfif>


 <div id="contenttext"><cfoutput>
    <cfif variables.shorttitle eq variables.longtitle or variables.longtitle is ''>
      <h1>#variables.shorttitle#</h1>
      <cfelseif variables.shorttitle is ''>
      <h1>
      #variables.longtitle#
      </h3>
      <cfelse>
      <!---<h2>#variables.shorttitle#</h2>  --->
      <h1>#variables.longtitle#</h1>
    </cfif>
    <p>
      <!--- <strong>Media Contact:</strong><br><br>--->
      #variables.byline# <br/>
      <!--- Loyola University Chicago<br>--->
      #variables.bylinetitle#</p>
    <strong>#variables.dateline#</strong>
    <!--- &mdash; --->
    <cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg') and image eq 1>
      <img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l"/>
      <cfelseif  variables.image_link neq '' and image eq 1>
      <img src="#variables.image_link#" alt="#variables.shorttitle#" border="0" align="left">
    </cfif>
    #variables.FormatBody# </cfoutput>
  <ul class="bullets-list">
    <cfloop query="getnews" startrow="5" endrow="7">
      <cfoutput>
        <li><a href="">#shorttitle#</a></li>
      </cfoutput>
    </cfloop>
  </ul>
</div></div>
<!-- sidebar start -->
<cfinclude template="ssi/sidebar.cfm">
<!-- sidebar end -->

<cfinclude template="ssi/bottom.cfm">
