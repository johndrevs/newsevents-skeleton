<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Loyola University Chicago: University Calendar</title>
	
<meta name="keywords" content="Loyola University Chicago" />
<meta name="description" content="Loyola University Chicago" />	

<link rel="Stylesheet" href="/styles/news_events.css" type="text/css" />

<script language="JavaScript" src="/scripts/javascripts/mouseover.js" type="text/javascript"></script>
<script language="JavaScript" src="/scripts/javascripts/selectjump.js" type="text/javascript"></script>
</head>

<body bgcolor="#DDDDDD" onload="MM_preloadImages('/images/azindex_btn_f2.gif','/images/contact_btn_f2.gif','/images/directories_btn_f2.gif','/images/loyolahome_btn_f2.gif','/images/calendar_btn_f2.gif');">

<!-- main header table -->
	<table id="header" summary="header container" width="100%" cellpadding="0" cellspacing="0" border="0">	<!-- header row 1 -->
		<tr>
			<td id="column2" colspan="2" align="right" valign="top" width="100%"><cfinclude template="/newsevents/public/ssi/topnav.cfm"></td>
		</tr>	
<!-- header column 2 -->
		<tr>
			<td id="column1" width="230" valign="top"><a href="http://www.luc.edu"><img src="http://www.luc.edu/display/images/306_logo_school.gif" width="230" height="60" alt="Loyola University Chicago Home" border="0"/></a></td>
			<cfif url.siteid EQ 0>
			<td id="column2" width="100%" valign="top" align="right"><div style="text-align:left;"><img src="images/hdr_calendar.gif" width="400" height="60" alt="University Calendar" /></div></td>
			<cfelse>
<td id="column2_filtered" width="100%" valign="top" align="right"><img src="http://www.luc.edu/images/space.gif" width="400" height="60" alt=" " /></div></td></cfif>
		</tr>
	</table>	
<!-- end header table -->



<!-- content table -->
<table id="content" summary="content container" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top" id="botpad"><div id="lrfloat">
<div id="pageblurb">
<h1 class="maroon">Mission &amp; Ministry Calendar</h1>
<ul>
<li><a href="/events/">View Full University Calendar</a></li>
</ul></div><!-- div: quick links --><!--#include virtual="/ssi/quicklinks.shtml" --></div></td></tr>


<!-- filter bar row -->
<tr><td id="filterbar"><form id="quicklinks_drop2" action="#"><div><strong>VIEW:</strong> <a href="#">Today</a> | <a href="#">Week</a> | <a href="#">Month</a></div><div><select name="dest" size="1" onchange="leapto(this.form)">
<option value="#">All Events</option>
<option value="#">------------------</option>
<option value="#">Graduate School of Business</option>
<option value="#">Law School</option>
<option value="#" selected="selected">Mission &amp; Ministry</option>
<option value="#">------------------</option>
</select></div>
<div><select name="dest" size="1" onchange="leapto(this.form)">
<option value="#" selected="selected">All Audiences</option>
<option value="#">------------------</option>
<option value="#">Prospective Students</option>
<option value="#">Current Students</option>
<option value="#">Parents and Family</option>
<option value="#">Alumni and Friends</option>
<option value="#">Faculty and Staff</option>
<option value="#">------------------</option>
</select></div><input type="image" src="/images/go_btn.gif" alt="Search" align="top" />
</form></td></tr>
<!-- end filter bar row -->



<!-- true content row -->
<tr valign="top">
<td class="content"><div class="text70">



<!-- calendar table output -->
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="calendar">
<!-- top link row -->
<tr><td colspan="7" align="right" id="linkrow"><a href="#"><img src="images/submitevent_btn.gif" width="130" height="17" alt="Submit an Event" border="0" align="left" /></a><a href="/news/"><img src="/images/univnews.gif" alt="University News" border="0" height="10" width="114" /></a></td></tr>
<!-- end top link row -->

<!-- header row -->
<tr><th colspan="7" align="center" bgcolor="#F0F0F0">
<div class="floatleft">&laquo; <a href="#">Prev</a></div><div class="floatright"><a href="#">Next</a> &raquo;</div>
<h2>Week of Sunday, July 3, 2005</h2>
</th></tr>
<!-- end header row -->

<tr><td class="wkndhdr">SUN</td><td class="wkhdr">MON</td><td class="wkhdr">TUE</td><td class="wkhdr">WED</td><td class="wkhdr">THU</td><td class="wkhdr">FRI</td><td class="wkndhdr">SAT</td></tr>

<!-- event output row -->
<tr>
<td class="wknd"><h3><a href="#">26</a></h3>
<ul>
<li>5 PM - 6 PM<br /><a href="calendar_detail.shtml">Information Session</a></li>
<li>All Day<br /><a href="calendar_detail.shtml">Discover Loyola Orientation</a></li>
</ul></td>
<td><div id="on"><h3><a href="#">27</a></h3></div>
<ul>
<li>8 AM<br /><a href="calendar_detail.shtml">Breakfast w/ the Big G</a></li>
</ul></td>
<td><h3><a href="#">28</a></h3>
<ul>
<li>3 PM<br /><a href="calendar_detail.shtml">Jesuit BBQ</a></li>
<li>8 PM<br /><a href="calendar_detail.shtml">Intro to PHP and mySQL</a></li>
</ul></td>
<td><h3><a href="#">29</a></h3>
<ul>
<li>6:30 PM<br /><a href="calendar_detail.shtml">Volunteer Trip to Soup Kitchen</a></li>
</ul></td>
<td><h3><a href="#">30</a></h3></td>
<td><h3><a href="#">1</a></h3>
<ul>
<li>2:30 PM<br /><a href="calendar_detail.shtml">Storming the Castle</a></li>
</ul></td>
<td class="wknd"><h3><a href="#">2</a></h3>
<ul>
<li>3 PM<br /><a href="calendar_detail.shtml">Open Mic</a></li>
<li>8 PM - 1 AM<br /><a href="calendar_detail.shtml">Karaoke on the Jes Res Lawn</a></li>
</ul></td>
</tr>
<!-- end event output row -->

<!-- bottom link row -->
<tr><td colspan="7" align="right" id="linkrow2"><a href="#"><img src="images/submitevent_btn2.gif" width="130" height="17" alt="Submit an Event" border="0" /></a></td></tr>
<!-- end bottom link row -->
</table>
<!-- end calendar table output -->



</div></td>
</tr>
<!-- end true content row -->

<!-- row for promise -->
<tr><td colspan="3" id="bottomstripe"><a href="/loyolapromise/"><img src="/images/promise_tag.gif" width="352" height="18" alt="The Loyola Promise" border="0" /></a></td></tr>


</table>
<!-- end main content table -->

<!-- custom footer -->
<!--#include virtual="ssi/calendar_footer.shtml" -->


</body>
</html>
