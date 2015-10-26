<cfquery name="getnews" datasource="#application.datasource_select#">
select content_clob,content_clob2, pubdate, pulldate, shorttitle, bylinetitle,dateline, news.newsid, longtitle,DESC_CLOB,created,byline,image_link,link_override,article_link
from CUNVMCS.news
where newsID=#url.newsid#
</cfquery>
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
<cfquery datasource="#application.datasource_select#" name="getpublication">
SELECT site_name
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>

<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<cfoutput>
<title>Inside Loyola Weekly: #dateformat(now,"mmm. d, yyyy")#</title>
	</cfoutput>
<link rel="stylesheet" href="http://yui.yahooapis.com/2.5.1/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css">
<link rel="stylesheet" href="ilw.css" type="text/css">
</head>
<body>
	
	<div id="doc" class="yui-t5">
		<div id="hd">			
			<h1>Inside Loyola Weekly</h1>
			<span class="date">02/04/2008</span>
			<span id="difficulty"><a href="">If you are having trouble viewing this email, please got to htto://www.luc.edu/ilweekly</a></span>
		</div>
		<div id="bd">
			<div id="yui-main">
				<div class="yui-b" id="main">
	<cfoutput>
		<cfif variables.shorttitle eq variables.longtitle or variables.longtitle is ''>
			<div align="center"><h3>#variables.shorttitle#</h3>
			</div>		
		<cfelseif variables.shorttitle is ''>
			<div align="center"><h3>#variables.longtitle#</h3>
			</div>
		<cfelse>
<!---<h2>#variables.shorttitle#</h2>  --->
			<div align="center"><h3>#variables.longtitle#</h3>
			</div>
		</cfif>
		<div id="content_text">
<p><!--- <strong>Media Contact:</strong><br>
<br>
--->
#variables.byline#
			<br/><!--- Loyola University Chicago<br>
--->
#variables.bylinetitle#</p>
<strong>#variables.dateline#</strong><!--- &mdash; --->				
			<cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg')><img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l"/>			
			<cfelseif  variables.image_link neq ''><img src="#variables.image_link#" alt="#variables.shorttitle#" border="0" align="left">
			</cfif>
			#variables.FormatBody#
	</cfoutput>
<cfinclude template="/newsevents/public/skins/focus/bottom.cfm">

