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

<cfquery name="getnews" datasource="#application.datasource_select#">
select news.newsid,news.desc_clob, shorttitle,created,byline,pubdate,pulldate,priority
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#url.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	

order by priority
</cfquery>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Loyola University Chicago: University News</title>
	
<meta name="keywords" content="Loyola University Chicago" />
<meta name="description" content="Loyola University Chicago" />	

<link rel="Stylesheet" href="http://www.luc.edu/styles/news_events.css" type="text/css" />

<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/mouseover.js" type="text/javascript"></script>
<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/selectjump.js" type="text/javascript"></script>
</head>

<body bgcolor="#DDDDDD" onload="MM_preloadImages('/images/azindex_btn_f2.gif','/images/contact_btn_f2.gif','/images/directories_btn_f2.gif','/images/loyolahome_btn_f2.gif','/images/calendar_btn_f2.gif');">

<!-- main header table -->
<table id="header" summary="header container" width="100%" cellpadding="0" cellspacing="0" border="0">
<!-- header row 1 -->
<tr>
	<td id="column2" colspan="2" align="right" valign="top" width="100%"><cfinclude template="/newsevents/public/ssi/topnav.cfm"></td></tr>
<!-- header column 2 -->
<tr>
	<td id="column1" width="230" valign="top"><a href="http://www.luc.edu"><img src="http://www.luc.edu/display/images/306_logo_school.gif" width="230" height="60" alt="Loyola University Chicago Home" border="0" /></a></td>
	<td id="column2" width="100%" valign="top" align="right"><div style="text-align:left;"><img src="images/hdr_news.gif" width="400" height="60" alt="University News" /></div></td></tr>
</table>
<!-- end header table -->



<!-- content table -->
<table id="content" summary="content container" width="100%" cellpadding="0" cellspacing="0" border="0">


<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- true content row -->
<tr valign="top">
<!-- column 1 -->
<td width="75%"><div class="text70">
<cfoutput><div class="column">

<!-- headlines pagelet -->
<div class="pagelet_grey">
<div class="pagelet_title"><h2><cfif url.siteid EQ 0>University Newsroom<cfelse>#getpublication.site_name#</cfif></h2></div>
<div class="pagelet_content">

<dl class="pub">
<cfloop query="getnews"><dt><a href="news_story.cfm?newsid=#newsid#">#shorttitle#</a></dt>
<dd>#DESC_CLOB#
<br><a href="news_story.cfm?newsid=#newsid#">Read More</a></dd></cfloop>

</dl>





</div>
</div>	</cfoutput>
<!-- end headlines pagelet -->






</div></div>

</td>

<!-- column 2 -->
<td width="25%" class="dashrule"><div class="column_right">
<div class="text70">

<!-- main nav -->

<cfinclude template="/newsevents/public/ssi/news_nav.cfm">



<!-- end main nav -->

<div class="comments">
<h4>Upcoming Events:</h4>
<ul>
<li><a href="#">GSB Open House - Sept 20</a></li>
<li><a href="#">Blackeyed Peas Concert - Oct 24</a></li>
</ul>
<div align="right">...<a href="/calendar/">More Events</a></div>
</div>






</div></div></td>
</tr>
<!-- end true content row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- row for promise -->
<tr><td colspan="2" id="bottomstripe"><img src="http://www.luc.edu/images/space.gif" width="352" height="18" alt="space" border="0" /></td></tr>


</table>
<!-- end main content table -->

<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/calendar_footer.shtml">


</body>
</html>
