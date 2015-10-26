<cfif parameterexists(url.date)>
<cfset now2=createodbcdate(url.date)>
<cfelse>
<cfset now2=createodbcdate(now())>
</cfif>
<cfinclude template="siteids.cfm">
<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<cfoutput><title>Inside Loyola Weekly: #dateformat(now2,"mmm. d, yyyy")#</title></cfoutput>
<link rel="Stylesheet" href="http://www.luc.edu/ilweekly/interior1.css" type="text/css"/>
</head>

<body>
	<table width="660" border="0" cellspacing="0" cellpadding="5" align="center" class="tabulargrey">
		<tr width="100%" bgcolor="#a30046" colspan="2">
			<td colspan="2" width="100%" bgcolor="#a30046"><a href="http://www.luc.edu/ilweekly"><img src="http://www.luc.edu/ilweekly/images/ilwmast1.jpg" alt="" border="0"></a></td>
		</tr>
		<tr>
			<td width="100%" class="text">
			<!-- impt info here -->
			<a name="imptinfo"></a>
			<img src="http://www.luc.edu/ilweekly/images/imptinfo.jpg">		
			<cfinclude template="ssi/importantinformation.cfm">
			<div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>		
			<!-- end of impt info here -->
			
			<a name="fyi"></a>
			
<hr noshade>
<!-- info around campus here -->	
<table width="100%">
		<tr>
			<td colspan="4" width="100%"><img src="http://www.luc.edu/ilweekly/images/fyi.jpg"></td>
		</tr>
		<tr>
			<td width="25%"><a href="#lsc"><img src="http://www.luc.edu/ilweekly/images/lsc.jpg" alt="Lake Shore Campus" border="0"></a></td>
			<td width="25%"><a href="#wtc"><img src="http://www.luc.edu/ilweekly/images/wtc.jpg" alt="Water Tower Campus" border="0"></a></td>
			<td width="25%"><a href="#maywood"><img src="http://www.luc.edu/ilweekly/images/maywood.jpg" alt="Maywood Campus" border="0"></a></td>
			<td width="25%"><a href="#romectr"><img src="http://www.luc.edu/ilweekly/images/romectr.jpg" alt="John Felice Rome Center" border="0"></a></td>
		</tr>
		<tr>
			<td width="100%" colspan="4">Please click on the images above and find out useful information about each campus.<hr noshade></td>
		</tr>
		<tr>
			<td width="100%" colspan="4">
			<a name="lsc"></a>
<h3>Lake Shore Campus News</h3>	
		<cfset siteid=#ac_lsc_id#>
		<cfinclude template="ssi/campusnews.cfm">
<p>To learn more about the Lake Shore Campus, <a href="http://www.luc.edu/about/lsc/" target="_blank">click here</a>.</p>
			<div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>
			<hr noshade></td>
		</tr>
		<tr width="100%" colspan="4">
			<td width="100%" colspan="4">
			<a name="maywood"></a>
<h3>Maywood Campus News</h3>	
		<cfset siteid=#ac_lumc_id#>
		<cfinclude template="ssi/campusnews.cfm">
<p>To learn more about the Maywood Campus, <a href="http://www.luc.edu/about/visitor/visitlumc.shtml" target="_blank">click here</a>.</p>
			<div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>
			<hr noshade></td>
		</tr>
		<tr width="100%" colspan="4">
			<td width="100%" colspan="4">
			<a name="romectr"></a>
<h3>Rome Center Campus News</h3>
		<cfset siteid=#ac_rome_id#>
		<cfinclude template="ssi/campusnews.cfm">
<p>To learn more about the Rome Center Campus, <a href="http://www.luc.edu/romecenter/" target="_blank">click here</a>.</p>
			<div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>
			<hr noshade></td>
		</tr>
		<tr width="100%" colspan="4">
			<td width="100%" colspan="4">
			<a name="wtc"></a>
<h3>Water Tower Campus News</h3>
		<cfset siteid=#ac_wtc_id#>
		<cfinclude template="ssi/campusnews.cfm"></td>
		</tr>	<!-- end of info around campus here -->
	</table></td>
	<!-- side bar starts here -->
	<td width="224">
	<div id="menu">
	<div class="text">
<cfoutput><p><strong>For the week of #dateformat(now2,"mmm. d, yyyy")#</strong></p></cfoutput>

<p>&laquo; <a href="#events">Upcoming Events</a><br>
&laquo; <a href="#fyi">Information Around Campus</a><br>
&laquo; <a href="#whatsnew">What's New</a><br>
&laquo; <a href="#kudos">Kudos</a><br>
&laquo; <a href="#opps">Opportunities</a><br>
&laquo; <a href="#commentaries">Experts' Commentary</a></p>

<a name="events"></a>
<img src="http://www.luc.edu/ilweekly/images/events1.jpg">
<cfinclude template="ssi/upcomingevents.cfm">

<p><strong>more events at: </strong><br>
<a target="_blank" href="http://www1.luc.edu/calendar/">University Calendar &raquo;</a><br/></p>

<p><div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>	</p>


<a name="kudos"></a>
<img src="http://www.luc.edu/ilweekly/images/kudos.jpg">
<cfinclude template="ssi/kudos.cfm">

<p><div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>	</p>

<!-- experts' commentaries here -->
			
<a name="commentaries"></a>
<img src="http://www.luc.edu/ilweekly/images/expertscom1.jpg">
<cfinclude template="ssi/expertscommentary.cfm">

<p><div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div>	</p><!-- end of experts' com -->
	</div>
		
	</div></td>
</tr>	
<!-- side bar ends here -->

<tr>
		<td colspan="2" width="100%">
<hr noshade>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="simple">
			<tr>
				<!-- opps here -->
				<td width="50%" class="text">				
					<a name="opps"></a>
					<img src="http://www.luc.edu/ilweekly/images/opps.jpg">
					<cfinclude template="ssi/opportunities.cfm">
				<p><div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div></p></td>
				<!-- opps ends here -->
				
				<!-- what's new -->
				<td width="50%" class="text">
				<a name="whatsnew"></a>
				<img src="http://www.luc.edu/ilweekly/images/new.jpg">
				<cfinclude template="ssi/whatsnew.cfm">
				<p><div align="right" class="top">	^ <a href="#top">BACK TO TOP</a></div></p></td>
				<!-- end of what's new -->
			</tr>
		</table></td>
	</tr>
		



	
</table><!-- footer --><table width="660" align="center">
<tr>
	<td colspan="2" width="100%">
<div class="text" align="center"><strong>
&curren;   <a href="http://www.luc.edu/ilweekly/about.shtml">About IL Weekly</a>  &curren;   <a href="http://www.luc.edu/ilweekly/contactus.shtml">Contact Us</a>  &curren;  <a href="mailto:ahughes1@luc.edu,mkiley2@luc.edu,schris6@luc.edu">Submit Entries</a>  &curren;   <a href="http://www.luc.edu/ilweekly/feedback.shtml">Tell Us What You Think</a>  &curren;</strong>
		</div></td>
	</tr><tr>
	<td><br /><p><div class="text" align="center"><a href="http://www.luc.edu/"><img src="http://www.luc.edu/ilweekly/images/ceremonial.gif" alt="Loyola University Chicago" border="0"></a></div></p></td>
</tr>
</table><!-- end of footer -->

</body>
</html>
