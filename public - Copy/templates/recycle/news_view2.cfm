<cfset bodyid = "article">
<cfinclude template="../templates/top.cfm">

<cfquery name="getnews" datasource="#application.datasource_select#">
select content, pubdate, pulldate, shorttitle, bylinetitle,dateline, news.newsid, longtitle,DESC_CLOB,created,byline,AUTH_TBL.level,news_ref.userid
from news,news_ref,AUTH_TBL
where news_ref.siteid=AUTH_TBL.siteid AND news.newsid=news_ref.newsid AND news.newsID=#url.newsid#</cfquery>

<cfset temp = "#getnews.content#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset description="#getnews.description#">
<cfset pubdate="#getnews.pubdate#">
<cfset pulldate="#getnews.pulldate#">
<cfset longtitle="#getnews.longtitle#">
<cfset shorttitle="#getnews.shorttitle#">
<cfset byline="#getnews.byline#">
<cfset bylinetitle="#getnews.bylinetitle#">
<cfset dateline="#getnews.dateline#">
<cfset content="#getnews.content#">



<div class="column" id="content">	


		<h2>View Article</h2>
<cfoutput>
<div id="feed"><p>News items will be displayed in the following manner.</p></div>
<cfinclude template="../templates/news_layout.cfm">
<cfif getnews.userid EQ session.userid or getnews.level EQ 2> <span id="actions"><a href="">edit this article</a> | <a href="news_delete.cfm?id=#newsid#">delete this article</a> </span></cfif>
</cfoutput>


</div>



<cfinclude template="../templates/footer.cfm">
<cfinclude template="../templates/globalnav.cfm">
<!--- <cfinclude template="../templates/news_sortnav.cfm">
	
	<cfinclude template="../templates/search.cfm"> --->
<cfinclude template="../templates/news_adminnav.cfm">
