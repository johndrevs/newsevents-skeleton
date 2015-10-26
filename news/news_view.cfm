
<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<link rel="stylesheet" href="/newsevents/css/new.css" type="text/css" media="screen">
<title>Loyola University Chicago News and Events</title>
</head>
			
<img src="/newsevents/images/nande.gif" width="261" height="57" alt="Loyola University Chicago News and Events">

<cfquery name="getnews" datasource="#application.datasource_select#">
select content2, pubdate, pulldate,lastmod, shorttitle, bylinetitle,dateline, news.newsid, longtitle,created,byline,users.firstname,users.lastname,users.userid,users.user_admin,DESC_CLOB
from CUNVMCS.news,CUNVMCS.users
where news.newsID=#url.newsid# and news.userid=users.userid
</cfquery>
<cfset temp = "#getnews.content2#">
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
<cfset content="#getnews.content2#">
<cfset firstname="#getnews.firstname#">
<cfset lastname="#getnews.lastname#">
<cfset userid="#getnews.userid#">
<cfset user_admin="#getnews.user_admin#">

<cfinclude template="/newsevents/templates_new/news_layout.cfm">

