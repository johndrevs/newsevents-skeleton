		
	<cfif parameterexists(url.date)>	
	<cfset now=createodbcdate(url.date)>
	<cfelse>
		<cfset now=createodbcdate(now())>
	</cfif>
<cfinclude template="siteids.cfm">
	<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
	<cfoutput>
<title>Inside Loyola Weekly: #dateformat(now,"mmm. d, yyyy")#</title>
	</cfoutput>
<link rel="Stylesheet" href="http://www.luc.edu/ilweekly/interior1.css" type="text/css"/>
</head>
<body>
	<table width="660" border="0" cellspacing="0" cellpadding="5" align="center" class="tabulargrey">
		<tr width="100%" bgcolor="#a30046" colspan="2">
			<td width="100%" colspan="2" bgcolor="#A30046"><a href="http://www.luc.edu/ilweekly"><img src="http://www.luc.edu/ilweekly/images/ilwmast1.jpg" alt="" border="0"></a></td>
		</tr>
		<tr>
			<td width="100%" class="text">
			<table width="660">
				<tr>
					<td width="100%" class="text"><font face="Verdana" size="2">
					<cfoutput>
<strong>For the week of #dateformat(now,"mmm. d, yyyy")#</strong><br/>
<br/>
					<cfif HTTP_REFERER contains 'generate'>
					If you are having trouble viewing this email please click on this link:<br/>
<a href="http://info.luc.edu/newsevents/public/skins/insideloyolaweekly/email.cfm?date=#dateformat(now,"mm/dd/yyyy")#">#application.url#/public/skins/insideloyolaweekly/email.cfm?date=#dateformat(now,"mm/dd/yyyy")#</a>
						</cfif>
					</cfoutput>
<br/>
<br/>
					<p><strong>IN THIS ISSUE:</strong><br/>
								<cfset site_id=#importantinfo_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>AROUND CAMPUS-LSC</strong><br/>
								<cfset site_id=#ac_lsc_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>AROUND CAMPUS-WTC</strong><br/>
								<cfset site_id=#ac_wtc_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>AROUND CAMPUS-MAYWOOD</strong><br/>
								<cfset site_id=#ac_lumc_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>AROUND CAMPUS-ROME</strong><br/>
								<cfset site_id=#ac_rome_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>THIS WEEK'S OPPORTUNITIES:</strong><br/>
								<cfset site_id=#opps_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>WHAT'S NEW:</strong><br/>
								<cfset site_id=#whatsnew_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>KUDOS:</strong><br/>
								<cfset site_id=#kudos_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>EXPERTS' COMMENTARY:</strong><br/>
								<cfset site_id=#expertscommentary_id#>
				<cfinclude template="ssi/emailchannel.cfm">
</p>
					<p><strong>UPCOMING EVENTS:</strong><br/>
								<cfset site_id=#upcomingevents_id#>
				<cfinclude template="ssi/email_upcomingevents.cfm">
</p></td></font>
				</tr>
			</table></td>
		</tr>
	</table>	<!-- footer -->
	<table width="660" align="center">
		<tr>
			<td colspan="2" width="100%">
			<div class="text" align="center"><strong>
&curren;   <a href="http://www.luc.edu/ilweekly/about.shtml">About IL Weekly</a>  &curren;   <a href="http://www.luc.edu/ilweekly/contactus.shtml">Contact Us</a>  &curren;  <a href="mailto:ahughes1@luc.edu,mkiley2@luc.edu,schris6@luc.edu">Submit Entries</a>  &curren;   <a href="http://www.luc.edu/ilweekly/feedback.shtml">Tell Us What You Think</a>  &curren;</strong>
			</div></td>
		</tr>
		<tr>
			<td>
			<br/>
			<p>
			<div class="text" align="center"><a href="http://www.luc.edu/"><img src="http://www.luc.edu/ilweekly/images/ceremonial.gif" alt="Loyola University Chicago" border="0"></a>
			</div></p></td>
		</tr>
	</table>	<!-- end of footer -->
</body>
</html>
