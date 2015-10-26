


<cfquery name="getnews" datasource="#application.datasource_select#">
select content_clob, content_clob2,pubdate, pulldate,lastmod, shorttitle, bylinetitle,dateline, news.newsid, longtitle,created,byline,users.firstname,users.lastname,users.userid,users.user_admin,DESC_CLOB,image_link,article_link,link_override
from CUNVMCS.news,CUNVMCS.users
where news.newsID=#url.newsid# and news.userid=users.userid
</cfquery>

<cfset temp = "#getnews.content_clob##getnews.content_clob2#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset description="#getnews.DESC_CLOB#">
<cfset created="#getnews.created#">
<cfset pubdate="#getnews.pubdate#">
<cfset pulldate="#getnews.pulldate#">
<cfset lastmod="#getnews.lastmod#">
<cfset longtitle="#getnews.longtitle#">
<cfset shorttitle="#getnews.shorttitle#">
<cfset byline="#getnews.byline#">
<cfset bylinetitle="#getnews.bylinetitle#">
<cfset dateline="#getnews.dateline#">
<cfset image_link="#getnews.image_link#">
<cfset article_link="#getnews.article_link#">
<cfset link_override="#getnews.link_override#">
<cfset firstname="#getnews.firstname#">
<cfset lastname="#getnews.lastname#">
<cfset userid="#getnews.userid#">
<cfset user_admin="#getnews.user_admin#">

<cfinclude template="/newsevents/secure/templates/top_small.cfm">
<cfinclude template="/newsevents/secure/templates/news_layout.cfm">
<cfinclude template="/newsevents/secure/templates/footer.cfm">

