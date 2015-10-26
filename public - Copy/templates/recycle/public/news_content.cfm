
<cfquery name="getnews" datasource="#application.datasource_select#">
select content_clob, pubdate, pulldate, shorttitle, bylinetitle,dateline, news.newsid, longtitle,DESC_CLOB,created,byline,news_ref.userid
from CUNVMCS.news,CUNVMCS.news_ref,CUNVMCS.AUTH_TBL
where news_ref.siteid=AUTH_TBL.siteid AND news.newsid=news_ref.newsid AND news.newsID=#url.newsid#</cfquery>

<cfset temp = "#getnews.content_clob#">
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

	<cfoutput>
<p><strong>#variables.longtitle#</strong><br/>
	<cfif '#variables.shorttitle#' neq '#variables.longtitle#'>#variables.shorttitle#</cfif>
</p>

<p>			
	<cfif #variables.byline# is not ''>#variables.byline#<br/></cfif>
	<cfif #variables.bylinetitle# is not ''>#variables.bylinetitle#<br/></cfif>
</p>
<p>			
	<cfif #variables.dateline# is not ''><strong>#variables.dateline#</strong> &mdash;</cfif>
	#variables.formatbody#
</p>
	</cfoutput>





		


