<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml: lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Loyola University Chicago: Inner Template</title>
</head>

<cfif isDefined("url.siteid") IS 0>
	<cfset url.siteid = 0>
</cfif>
<cfif isDefined("url.audience") IS 0>
	<cfset url.audience = 0>
</cfif>
<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>


<p><cfinclude template="news_navdrop.cfm"></p>

<cfif isDefined("url.newsid")>
	<cfinclude template="news_content.cfm">
<cfelse>
	<cfinclude template="news_headlines.cfm">
</cfif>



