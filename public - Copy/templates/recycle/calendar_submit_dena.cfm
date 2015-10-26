
<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT site_name, siteid
FROM CUNVMCS.sites
</cfquery>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
</cfquery>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Loyola University Chicago: University Calendar</title>
	
<meta name="keywords" content="Loyola University Chicago" />
<meta name="description" content="Loyola University Chicago" />	

<link rel="Stylesheet" href="http://www.luc.edu/styles/news_events.css" type="text/css" />
<script language="JavaScript" src="/newsevents/scripts/calendar2.js"></script>
<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/mouseover.js" type="text/javascript"></script>
<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/selectjump.js" type="text/javascript"></script>
</head>

<body bgcolor="#DDDDDD" onload="MM_preloadImages('http://www.luc.edu/images/azindex_btn_f2.gif','http://www.luc.edu/images/contact_btn_f2.gif','http://www.luc.edu/images/directories_btn_f2.gif','http://www.luc.edu/images/loyolahome_btn_f2.gif','http://www.luc.edu/images/calendar_btn_f2.gif');">

<!-- main header table -->
<table id="header" summary="header container" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><!-- header column 1 -->
<td id="column1" width="230" valign="top"><a href="http://www.luc.edu/"><img src="http://www.luc.edu/images/logo_school.gif" width="230" height="79" alt="Loyola University Chicago Home" border="0" /></a></td>

<!-- header column 2 -->
<td id="column2" width="100%" valign="top" align="right"><cfinclude template="/newsevents/public/ssi/topnav.cfm"><div style="text-align:left;"><img src="images/hdr_calendar.gif" width="400" height="60" alt="University Calendar" /></div></td></tr>
</table>
<!-- end header table -->



<!-- content table -->
<table id="content" summary="content container" width="100%" cellpadding="0" cellspacing="0" border="0">

<!-- true content row -->
<tr valign="top">
<td class="content"><div class="text70">


<!-- calendar table output -->
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="calendar">

<!-- top link row -->
<tr><td align="right" id="linkrow"><div style="padding-bottom:7px;"><a href="/news/"><img src="http://www.luc.edu/images/univnews.gif" alt="University News" border="0" height="10" width="114" /></a></div></td></tr>
<!-- end top link row -->


<!-- header row -->
<cfoutput><tr><th align="center" bgcolor="##F0F0F0"><div class="floatleft">&laquo; <a href="calendar.cfm">Back to Calendar</a></div>
<h2>Submit an Event</h2>
</th></tr></cfoutput>
<!-- end header row -->


<!-- event output row -->
<tr>
<td><p style="width:600px;">Please use the form below to submit an event to Loyola University Chicago's calendar. If the event meets the <a href="calendar_guidelines.cfm">basic guidelines</a>, it will be added to the university calendar within five working days. For questions or comments, please contact Lenzlee Schnell, University Marketing and Communications, via e-mail at <a href="mailto:lschnel@luc.edu">lschnel@luc.edu</a>, or by phone at 312-915-8680.</p>


<cfset public=0>
<cfinclude template="/newsevents/secure/templates/events_form_dena.cfm">

</td>
</tr>
<!-- end event output row -->


</table>
<!-- end calendar table output -->



</div></td>
</tr>
<!-- end true content row -->

<!-- row for promise -->
<tr><td colspan="3" id="bottomstripe"><a href="http://www.luc.edu/loyolapromise/"><img src="http://www.luc.edu/images/promise_tag.gif" width="352" height="18" alt="The Loyola Promise" border="0" /></a></td></tr>


</table>
<!-- end main content table -->

<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/calendar_footer.shtml">


</body>
</html>
