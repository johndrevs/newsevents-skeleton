<!---<cfoutput>#form.ME_AB#</cfoutput>--->
<cfif parameterexists(session.LoggedIn) >
 <cfelse>x<cflocation url="faculty_form_query.cfm" addtoken="No">  <cfabort>
  </cfif>
 <cfif parameterexists(form.ME_AB)>
<cfset form.ME_AB=1>
<cfelse>
<cfset form.ME_AB=0>
</cfif>
 <cfif parameterexists(form.interest)>
<cfset form.interest=1>
<cfelse>
<cfset form.interest=0>
</cfif>
<cfif parameterexists(form.ME_AP)>
<cfset form.ME_AP=1>
<cfelse>
<cfset form.ME_AP=0>
</cfif>
<cfif parameterexists(form.ME_O)>
<cfset form.ME_O=1>
<cfelse>
<cfset form.ME_O=0>
</cfif>
<cfif parameterexists(form.ME_R)>
<cfset form.ME_R=1>
<cfelse>
<cfset form.ME_R=0>
</cfif>
<cfif parameterexists(form.PA_A)>
<cfset form.PA_A=1>
<cfelse>
<cfset form.PA_A=0>
</cfif>
<cfif parameterexists(form.PA_C)>
<cfset form.PA_C=1>
<cfelse>
<cfset form.PA_C=0>
</cfif>
<cfif parameterexists(form.PA_E)>
<cfset form.PA_E=1>
<cfelse>
<cfset form.PA_E=0>
</cfif>
<cfif parameterexists(form.CONTACT)>
<cfset form.CONTACT=1>
<cfelse>
<cfset form.CONTACT=0>
</cfif>
<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.FACULTY_SURV(FACULTY_SURV_ID,LID,EXPERTISE, ME_AB,ME_AP,ME_R,ME_O,INTEREST,PA_A,PA_B,PA_C,PA_D,PA_E,PA_F, CONTACT)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,'#FORM.LID#', '#FORM.EXPERTISE#', #FORM.ME_AB#, #FORM.ME_AP#, #FORM.ME_R#, #FORM.ME_O#, #FORM.INTEREST#, #FORM.PA_A#, '#FORM.PA_B#', #FORM.PA_C#, '#FORM.PA_D#', #FORM.PA_E#, '#FORM.PA_F#', '#FORM.CONTACT#')
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
<tr>
<td valign="top" id="botpad" colspan="2"><div id="lrfloat">
<div id="pageblurb">The Loyola University Faculty Experts Database is brought to you by University Marketing and Communications. <a href="news@luc.edu">Contact us</a> with any questions.</div><!-- div: quick links --><!--#include virtual="/ssi/quicklinks.shtml" --></div></td></tr>


<!-- filter bar row -->
<tr><td id="filterbar" colspan="2"><a href="http://www.luc.edu/calendar"><img src="images/ucalendar_grey.gif" alt="University Calendar" border="0" height="15" width="138" align="right" /></a><form method="get" action="http://google.luc.edu/search"><input type="hidden" name="site" value="luc"/><input type="hidden" name="client" value="luc"/><input type="hidden" name="proxystylesheet" value="luc"/><input type="hidden" name="output" value="xml_no_dtd"/><div><img src="images/news_search.gif" width="84" height="12" alt="" /></div><div><input type="text" class="searchbox" name="q" maxlength="255" value="" /><input type="image" src="http://www.luc.edu/images/go_btn.gif" alt="Search" align="top" /></div></form>

</td></tr>
<!-- end filter bar row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- true content row -->
<tr valign="top">
<!-- column 1 -->
<td width="75%"><div class="text70">
<div class="column">				Thank you for taking the time to take our survey. 
</div></div></td>
</tr>
<!-- end true content row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- row for promise -->
<tr><td colspan="2" id="bottomstripe"><img src="http://www.luc.edu/images/space.gif" width="352" height="18" alt="space" border="0" /></td></tr>


</table>
<!-- end main content table -->

<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/news_footer.cfm">


</body>
</html>