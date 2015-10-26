<!---
  Purpose of login.cfm:
    Authenticate a user against LDAP and load the commuter parking application
    if she or he successfully logged in.

  Most of the code was taken from "Programming ColdFusion MX" by Rob
  Brooks-Bilson, 2nd edition.

  The LDAP authentication code was written by Nitha Medasani and incorporated
  into this file. The original code can be found in the following directory on
  maia: /var/www/html/templates/ldap/

  My comments are tagged with my user ID and a date, e.g.:
  mtoh: October 5, 2005

  Created by: Melvin Toh <mtoh@luc.edu>
  Created on: October 5, 2005
  
  Modified and Included in FIS modules 1 & 2 by Linda Moser on 12/5/05
--->

 <cfset request.datasource_read = "read_lwd" /> 
<cfif CGI.request_method is "Post">


<!--- Boolean UserAuth is used to indicate authenticated  
      user. This variable should be set in the session scope or
      as a cookie --->
  <cfcookie name="UserAuth" value=false expires="now">
  <cfparam name="UserSearchFailed" type="boolean"
           default=false>

<!--- search for the user's dn, this is used below to
      authenticate the user NOTE: We must do this as the
      Directory Manager in order to return the password.  --->
  <cftry>
    <cfldap action="QUERY"
            name="ValidateUser"
            attributes="uid,dn"
            start="o=LOYOLA"
            scope="subtree"
            server="localhost"
            port="389"
            filter="(&(cn=#Left(form.UserName, 30)#)(objectclass=inetOrgPerson))"
            maxrows="1">
  <cfcatch type="Any">
 
    <cfset UserSearchFailed = true>
  </cfcatch>
  </cftry>

  <!--- If the login is successful, log the user in. Otherwise, redirect
        them back to the login.cfm page --->
  <cfif ValidateUser.RecordCount eq 1>
    <cftry>
      <cfldap action="QUERY"
              name="ValidateUser"
              attributes="cn,givenName,sn,mail,LUClid,uid"
              start="o=LOYOLA"
              scope="SUBTREE"
              filter="cn=#form.UserName#"
              server="localhost"
              rebind="yes"
              port="389" 
              username="#ValidateUser.dn#"
              password="#form.Password#"
              maxrows="1">
    <cfcatch type="Any">
      <cfcookie name="UserAuth" value=false expires="now">
      <cfset inval_string = "Invalid credentials">
      <cfset net = #cfcatch.detail#>
    </cfcatch>
    </cftry>

    <cfif not IsDefined("net")>
      <!--- Set session.LoggedIn to true, logging the user in --->
      <cflock name="sLogin_Lock" timeout="30" type="Exclusive">
        <cfset session.LoggedIn = true>
      </cflock>
        <!--- If save username box is checked, set cookie --->
        <!---
          mtoh: October 5, 2005

          Store the UVID in the session scope so other templates can retrieve
          it. Note that I am making use of #form.UserName# and not the value
          returned from the LDAP query.
        --->
        <cfset session.UVID = Ucase(Trim(Left(#form.UserName#, 30)))>
 <cfset session.uid = ValidateUser.uid>
        <!---
          mtoh: October 10, 2005

          Store the first and last name in the session scope.
        --->
        <cfset session.firstName = ValidateUser.givenName>
        <cfset session.lastName = ValidateUser.sn>

        <!---
          mtoh: October 10, 2005

          Store the user's email address in the session scope.
        --->
        <cfset session.emailAddress = ValidateUser.mail>

        <!---
          mtoh: October 10, 2005

          Store the user's LID (Loyola ID) in the session scope.
        --->
    <cfquery name="qryGetLUWAREinfo" datasource="#application.datasource_select#" debug="yes">
 			SELECT lid, uvid
			FROM cunvmcs.vi_uniemp
			where UVID = '#session.UVID#'
		</cfquery><cfset session.loyolaId = qryGetLUWAREinfo.lid>
        <!---   If save username box is checked, set cookie --->
      <!---
        mtoh: October 5, 2005

        We won't be needing this functionality for now.
      --->
      <!---
      <cfif IsDefined('form.SaveUsername')>
        <cfcookie name="Username" value="#form.Username#">
      </cfif>
      --->

	<!---authentication succeeded: put credentials in db session--->
	

<!--- Set security access --->
	<cfif not isDefined("session.uvid")>
	      <cfset session.uvid = "">	
    </cfif>  






	
	<cfparam name="SESSION.USER" default=0>
	<cfparam name="session.uvid" default=0>

	
<!--- End security section --->  
	  
	  <!--- Redirect the user to the index.cfm page of our application --->
      <cflocation URL="faculty_form.cfm" addtoken="No">
    </cfif>
  </cfif>
  <!--- Redirect the user back to the login page and display the error message --->
  <cflocation URL="faculty_form_query.cfm?Message=#UrlEncodedFormat("Invalid Login. Please Try Again")#&username=#form.Username#" addtoken="No">
<cfelse>
  <cfparam name="form.Username" default="">
 <cfif IsDefined('cookie.Username')>
    <cfset form.Username = cookie.Username>
  </cfif> 
  
  <!--- If there was an invalid login, reuse the username --->
  <cfif IsDefined('URL.Username')>
    <cfset form.Username = URL.Username>
  </cfif>

  <!--- html start--->
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
<div id="pageblurb">The Loyola University Faculty Experts Database is brought to you by University Marketing and Communications. <a href="mailto:news@luc.edu">Contact us</a> with any questions.</div><!-- div: quick links --><!--#include virtual="/ssi/quicklinks.shtml" --></div></td></tr>


<!-- filter bar row -->
<tr><td id="filterbar" colspan="2"><a href="http://www.luc.edu/calendar"><img src="images/ucalendar_grey.gif" alt="University Calendar" border="0" height="15" width="138" align="right" /></a><form method="get" action="http://google.luc.edu/search"><input type="hidden" name="site" value="luc"/><input type="hidden" name="client" value="luc"/><input type="hidden" name="proxystylesheet" value="luc"/><input type="hidden" name="output" value="xml_no_dtd"/><div><img src="images/news_search.gif" width="84" height="12" alt="" /></div><div><input type="text" class="searchbox" name="q" maxlength="255" value="" /><input type="image" src="http://www.luc.edu/images/go_btn.gif" alt="Search" align="top" /></div></form>

</td></tr>
<!-- end filter bar row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- true content row -->
<tr valign="top">
<!-- column 1 -->
<td width="75%"><div class="text70">
<div class="column">  

<p>University Marketing and Communications (UMC) needs your help to complete an important public and media relations initiative.  We have created an online Newsroom experts' database as a resource for media and other external audiences who are looking for a comment, viewpoint or perspective on a particular subject, issue, trend or timely event.</p>  

<p>The goal of the database is to uphold and enhance the strong academic reputation of the university by raising the visibility and awareness of Loyola's faculty and staff.</p>   

<p>By filling out the survey, your name and area of expertise may be added once evaluated by University Marketing and Communications.  Thank you in advance for filling out the survey as completely as possible.  </p>




<cfform name="ValidateUser" action="#CGI.script_name#" method="Post">
<table border="0" cellspacing="0" cellpadding="5" class="tabular">
<tr>
	<th colspan="2"><cfif IsDefined('URL.Message')>
    <cfoutput>#Trim(URL.Message)#</cfoutput><cfelse>Please enter your universal id and password:
 </cfif></th>
<tr>
	<td><strong>Universal ID:</strong></td><td><cfinput type="Text" name="Username" size="30" maxlength="30" value="#form.Username#"></td>
</tr>
<tr>
	<td><strong>Password:</strong></td><td> <cfinput type="Password" name="Password" size="30" maxlength="255"></td>
</tr>
<tr>
	<td><input type="Submit" name="Submit" value="Submit"></td>
</tr>
</table>
<input type="hidden" name="Username_required" value="You must supply a username">
  <input type="hidden" name="Password_required" value="You must supply a password">
</cfform>
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
</cfif>

