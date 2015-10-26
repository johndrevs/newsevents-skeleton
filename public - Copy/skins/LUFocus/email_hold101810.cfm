<cfif parameterexists(url.date)>
  <cfset now=createodbcdate(url.date)>
  <cfelse>
  <cfset now=createodbcdate(now())>
</cfif>
<cfinclude template="siteids.cfm">
<cfset site_id=#tn_id#>
<cfset title='TOP NEWS'><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>LU Focus Digest</title>
</head>
<body style="margin: 0px auto;">
<table cellpadding="0" cellspacing="0" width="770" align="center"><tr>
<td align="center" style="font: 12px/15px Arial, Helvetica, sans-serif;"><cfif HTTP_REFERER contains 'generate'>
<p>If you are unable to view this e-mail, please <a href="http://www.luc.edu/focus/" style="color:#a30046">click on this link</a>. Or, find this week's <em>Loyola Focus</em> in <a href="http://www.luc.edu/locus" style="color:#a30046;">LOCUS student news</a>.</p>
<cfelse>
<p>Look for this week's <em>LU Focus</em> news in <a href="http://www.luc.edu/locus" style="color:#a30046;">LOCUS student news</a> as well.</p>
</cfif></td></tr></table><table cellpadding="0" cellspacing="0" width="770" align="center"><tr>
<td colspan="3" valign="top" height="99" style="font-size:1px;line-height:1px;"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/index.cfm?date=#dateformat(now, "mm/dd/yyyy")#"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/logo-top.gif" width="770" height="99" border="0" alt="LU Focus Digest"></a></cfoutput></td></tr><tr>
<td height="17" valign="top" style="font-size:1px; line-height:1px"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/index.cfm?date=#dateformat(now, "mm/dd/yyyy")#"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/logo-bottom-left.gif" alt="" border="0" width="686" height="17"></a></cfoutput></td>
<td valign="top" bgcolor="#dedede" align="right" width="77" style="font: 12px/15px Arial, Helvetica, sans-serif;"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/index.cfm?date=#dateformat(now, "mm/dd/yyyy")#" style="color:##333333; text-decoration:none;">#dateformat(now,"mm/dd/yyyy")#</a></cfoutput></td>
<td valign="top" height="17" style="font-size:1px;line-height:1px"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/index.cfm?date=#dateformat(now, "mm/dd/yyyy")#"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/logo-bottom-right.gif" alt="" border="0" width="7" height="17"></a></cfoutput></td>
</tr><tr><td><table cellpadding="0" cellspacing="0" width="686"><tr>
<td width="1" bgcolor="#cacaca" height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
<td width="685"><!-- --></td></tr></table></td>
<td height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
<td><table cellpadding="0" cellspacing="0" width="7"><tr><td width="6"><!-- --></td>
<td width="1" bgcolor="#cacaca" height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
</tr></table></td></tr><tr><td colspan="3"><table cellpadding="0" cellspacing="0" width="100%"><tr>
<td width="1" bgcolor="#cacaca" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td>
<td width="15" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td>
<td height="275" style="font-size:0; line-height:0"><cfsilent>
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where 0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')
order by priority
</cfquery></cfsilent><cfloop query="getnews" startrow="1" endrow="1">
<a href="http://cfls02.adms.luc.edu/newsevents/public/skins/LUFocus/internal.cfm?newsID=27290&siteid=0&date=09/27/2010"><img src="http://cfls02.adms.luc.edu/newsevents/public/skins/LUFocus/supports/092710_2careerfair.jpg" alt="" border="0" height="275" width="740"></a>
</cfloop></td>
<td width="12" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td>
<td bgcolor="#cacaca" width="1" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td>
</tr></table></td></tr><tr><td><table cellpadding="0" cellspacing="0" width="686"><tr>
<td width="1" bgcolor="#cacaca" height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
<td width="685"><!-- --></td></tr></table></td>
<td height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
<td><table cellpadding="0" cellspacing="0" width="7"><tr><td width="6"><!-- --></td>
<td width="1" bgcolor="#cacaca" height="14"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="14" width="1"></cfoutput></td>
</tr></table></td></tr><tr><td colspan="3"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="1" bgcolor="#cacaca"><!-- --></td><td width="21" bgcolor="#ffffff"><!-- --></td>
<td width="500" valign="top"><table cellpadding="0" cellspacing="0" width="500"><tr><td><cfoutput query="getnews" maxrows="1" startrow="2">
<cfsilent>
<cfquery name="getnews2" datasource="#application.datasource_select#">
select desc_clob
from CUNVMCS.news
where newsID=#getnews.newsid#
</cfquery>
</cfsilent><strong style="font:bold 20px/28px 'Times New Roman', Times, serif;"><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="text-decoration:none; color:##a30046;">#getnews.shorttitle#</a></strong><br>
<span style="font:16px/16px 'Times New Roman', Times, serif; color:##000000;">#replace(getnews2.desc_clob, "*", "&quot;", "all")# <a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="text-decoration:none; color:##a30046; font-weight:bold"> More...</a></span> <br>
<br></cfoutput> <cfoutput query="getnews" maxrows="1" startrow="3">
<cfsilent>
<cfquery name="getnews2" datasource="#application.datasource_select#">
select desc_clob
from CUNVMCS.news
where newsID=#getnews.newsid#
</cfquery>
</cfsilent>
<strong style="font:bold 16px/16px 'Times New Roman', Times, serif;"><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="text-decoration:none; color:##a30046;">#getnews.shorttitle#</a></strong><br>
<span style="font:14px/16px 'Times New Roman', Times, serif; color:##000000;">#getnews2.desc_clob#<a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="text-decoration:none; color:##a30046; font-weight:bold"> More...</a></span><br>
<br>
</cfoutput><cfoutput query="getnews" maxrows="1" startrow="4">
<cfsilent>
<cfquery name="getnews2" datasource="#application.datasource_select#">
select desc_clob
from CUNVMCS.news
where newsID=#getnews.newsid#
</cfquery></cfsilent><strong style="font:bold 14px/16px 'Times New Roman', Times, serif;"><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="text-decoration:none; color:##a30046;">#getnews.shorttitle#</a></strong><br>
<span style="font:14px/16px 'Times New Roman', Times, serif; color:##000000;">#getnews2.desc_clob#</span> </cfoutput></td></tr><tr>
<td height="10"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="1" height="10"></cfoutput></td>
</tr><tr><td><table cellpadding="0" cellspacing="0" width="500" align="left"><cfloop query="getnews" startrow="5" endrow="8"><tr>
<td width="20"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/bullet.gif" alt="" style="border:none"></cfoutput></td>
<td style="font:14px/22px 'Times New Roman', Times, serif"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/internal.cfm?newsID=#newsid#&amp;siteid=0&amp;date=#dateformat(now, "mm/dd/yyyy")#" style="color:##a30046; text-decoration:none">#shorttitle#</a></cfoutput> </td>
</tr></cfloop></table></td></tr><tr>
<td><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="52" width="1"></cfoutput></td>
</tr><tr><td><table cellpadding="0" cellspacing="0" width="495" align="left">
<tr><td width="240" style="font: bold 14px/14px Arial, Helvetica, sans-serif; color:#666666"><strong>ACADEMICS</strong><br><br></td>
<td width="6"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="6" height="1"></cfoutput></td>
<td width="1"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="1" height="1"></cfoutput></td>
<td width="18"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="18" height="1"></cfoutput></td>
<td width="230" style="font: bold 14px/14px Arial, Helvetica, sans-serif; color:#666666"><strong>FYI</strong><br>
<br></td></tr><tr><td valign="top" style="font:12px/14px Arial, Helvetica, sans-serif; color:#666;"><cfset site_id=#ac_id#>
<cfset title='Academics'>
<cfinclude template="ssi/ul.cfm"></td><td></td><td bgcolor="#cccccc"><!-- --></td><td></td><td valign="top" style="font:12px/14px Arial, Helvetica, sans-serif; color:#666;"><cfset site_id=#etc_id#>
<cfset title='FYI'>
<cfinclude template="ssi/ul.cfm"></td></tr></table></td></tr></table></td>
<td width="7" bgcolor="#ffffff"><!-- --></td><td width="6" bgcolor="#e8e8e8"><!-- --></td><td width="229" bgcolor="#e8e8e8" valign="top"><table cellpadding="0" cellspacing="0" width="229">
<tr><td height="13"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="13" width="1"></cfoutput></td></tr>
<cfoutput><tr onClick="parent.location='http://#cgi.server_name#/newsevents/public/skins/LUFocus/calendar.cfm'">
</cfoutput>
<td height="31" bgcolor="#a30046" style="color:#ffffff;"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/calendar.cfm" style="font:12px/14px Arial, Helvetica, sans-serif;color:##ffffff;margin-left:10px;font-weight:bold; text-decoration:none">Student Calendar</a></cfoutput></td>
</tr><tr><td height="31" align="center" style="color:#ffffff;"><table cellpadding="0" cellspacing="0" width="229"><tr>
<td width="1" bgcolor="#666666"><!-- --></td><td><cfset loopfrom=1>
<cfset loopto=7>
<cfparam name="url.month" default="#DatePart('m', url.date)#">
<cfparam name="url.year" default="#DatePart('yyyy', url.date)#">
<cfparam name="url.week" default="#DatePart('ww', url.date)#">
<cfparam name="url.day" default="#DatePart('d', url.date)#">
<cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
<cfset daterangebeg=#createodbcdatetime(daterangebeg)#>
<cfset currentdate = daterangebeg>
<cfset currentdate2 = daterangebeg>
<cfset currentdate3 = CreateDate(year, month, day)>
<cfset site_id=#ue_id#>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ffffff"  style="font:12px/14px Arial, Helvetica, sans-serif;color:#ffffff; text-decoration:none">
<tr><cfloop index="LoopDay" from="#loopfrom#" to="#loopto#">
<cfset url.day = "#DatePart('d', currentdate)#">
<cfset url.month = "#DatePart('m', currentdate)#">
<cfset url.year = "#DatePart('yyyy', currentdate)#">
<cfoutput><td width="30" align="center"<cfif datecompare(currentdate,daterangebeg,"d") EQ 0> bgcolor="##a30046"<cfelse> bgcolor="##999999"</cfif> style="text-align:center;" onClick="parent.location='http://#cgi.server_name#/newsevents/public/calendar.cfm?month=#datepart('m',now)#&amp;year=#datepart('yyyy',now)#&amp;day=#datepart('d',DateAdd('d',7,url.day))#&amp;skin=focus&amp;siteid=#site_id#'">#dateformat(currentdate,"ddd")#<br>
#dateformat(currentdate,"d")#</td>
</cfoutput>
<cfset currentdate = DateAdd("d", 1, currentdate)>
</cfloop></tr><tr bgcolor="#ffffff">
<cfloop index="LoopDay" from="#loopfrom#" to="#loopto#">
<cfset url.day = "#DatePart('d', currentdate2)#">
<cfset url.month = "#DatePart('m', currentdate2)#">
<cfset url.year = "#DatePart('yyyy', currentdate2)#">
<td width="30" align="center" valign="top"><cfoutput>
<cfif datecompare(currentdate2,daterangebeg,"d") EQ 0>
<img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/arrow.gif" alt="">
<cfelse>
</cfif>
</cfoutput></td>
<cfset currentdate2 = DateAdd("d", 1, currentdate2)>
</cfloop></tr></table></td><td width="1" bgcolor="#666666"><!-- --></td></tr></table></td></tr><tr><td bgcolor="#ffffff"><table cellpadding="0" cellspacing="0" width="229">
<tr><td width="1" bgcolor="#666666"><!-- --></td><td width="12"><!-- --></td><td width="202"><cfsilent>
<cfquery datasource="#application.datasource_select#" name="getevent2">
SELECT distinct events_tbl.eventID, shortdesc,  startdate, events_link_override,events_link,enddate
FROM CUNVMCS.events_tbl
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate3,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate3,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate3,"yyyy-mm-dd")#' and enddate is NULL))
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
and events_ref.siteid in (#site_id#)
and events_ref.events_ref_level =2)
order by events_tbl.startdate
</cfquery>
</cfsilent>
<table cellpadding="0" cellspacing="0" width="202" align="left"><cfoutput query="getevent2">
<cfif currentrow gt 1>
<tr><td colspan="2" height="1" bgcolor="##cccccc" style="font-size:0; line-height:0"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></td></tr>
</cfif>
<tr><td colspan="2" height="7" style="font-size:0; line-height:0"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="7" width="1"></td></tr>
<tr><td width="2"><!-- --></td>
<td style="font: 12px/14px Arial, Helvetica, sans-serif; color:##333333;"><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/calendar_detail.cfm?eventID=#eventID#" style="color: ##666666;text-decoration:none;margin:0px;padding:0px;">#shortdesc#</a><br><br></td></tr>
</cfoutput>
<tr><td colspan="2" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td></tr>
<tr><td colspan="2"><table cellpadding="0" cellspacing="0" width="202" align="left">
<tr><td colspan="3"height="21"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="21" width="1"></cfoutput></td></tr>
<tr><td width="3"><!-- --></td>
<td width="21"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/calendar.cfm?month=#datepart('m',now)#&amp;year=#datepart('yyyy',now)#&amp;day=#datepart('d',now)#&amp;skin=focus&amp;siteid=#site_id#"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/ico-calendar.gif" alt="" width="14" height="13" border="0"></a></cfoutput></td>
<td style="font: 12px/14px Arial, Helvetica, sans-serif"><cfoutput><a href="http://#cgi.server_name#/newsevents/public/calendar.cfm?month=#datepart('m',now)#&amp;year=#datepart('yyyy',now)#&amp;day=#datepart('d',now)#&amp;skin=focus&amp;siteid=#site_id#" style="text-decoration:none; color:##a30046">Complete Student Calendar</a></cfoutput></td></tr>
<tr><td colspan="3"height="16" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="16" width="1"></cfoutput></td></tr>
</table></td></tr></table></td><td width="13"><!-- --></td><td width="1" bgcolor="#666666"><!-- --></td></tr>
<tr><td colspan="5" height="1" bgcolor="#696969" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="1" width="1"></cfoutput></td></tr></table></td></tr>
<tr><td height="36"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="36" width="1"></cfoutput></td></tr>
<tr><td><cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/submit.cfm"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/submit-content.gif" width="227" height="108" border="0" alt="Suggest a news item or event for LU Focus"></a></cfoutput></td></tr>
<tr><td height="42"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" height="42" width="1"></cfoutput></td>
</tr></table></td><td width="5" bgcolor="#e8e8e8"><!-- --></td><td width="1" bgcolor="#cacaca"><!-- --></td></tr>
<tr><td height="1" colspan="8" bgcolor="#cacaca" style="font-size:0; line-height:0"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="1" height="1"></cfoutput></td></tr></table></td></tr>
<tr><td colspan="3" align="center" style="font-size:12px; line-height:32px;font-family:Arial, Helvetica, sans-serif; font-weight:bold; color:#666666; text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput><a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/about.cfm" style="text-decoration:none; color:##666666">ABOUT LU FOCUS</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/about.cfm" style="text-decoration:none; color:##666666"> CONTACT US</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="mailto:mniksic@luc.edu" style="text-decoration:none; color:##666666"> TELL US WHAT YOU THINK</a></cfoutput></td></tr>
<tr><td colspan="3" height="24"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="1" height="24"></cfoutput></td></tr>
<tr><td colspan="3" height="127" align="center" style="text-align:center;"><cfoutput><a href="http://www.luc.edu"><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/bottom-logo.gif" alt="" width="175" height="127" border="0"></a></cfoutput></td></tr>
<tr><td colspan="3" height="51"><cfoutput><img src="http://#cgi.server_name#/newsevents/public/skins/LUFocus/images/none.gif" alt="" width="1" height="51"></cfoutput></td></tr>
</table>
</body>
</html>