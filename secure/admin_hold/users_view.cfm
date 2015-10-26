<cfset bodyid = "article">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="../css/typography.css" type="text/css" media="screen">
<link rel="stylesheet" href="../css/design.css" type="text/css" media="screen">
	<title>Loyola University Chicago News and Events</title>


</head><cfif parameterexists(bodyid)>
<cfoutput><body id="#variables.bodyid#"></cfoutput>
<cfelse><body id="home">
</cfif>

<h1 id="masthead"><img src="../images/nande.gif" width="261" height="57" alt="Loyola University Chicago News and Events"></h1>
<cfquery name="getuser" datasource="#application.datasource_select#" maxrows=1>
SELECT      users.lastname, logintracking.logindate, users.firstname,email
FROM         CUNVMCS.users, CUNVMCS.logintracking 

WHERE       users.userid = logintracking.userid and users.userid=#url.userid#
order by logindate desc</cfquery>

<div id="content">
		

	
 <cfoutput query="getuser">
 	<table width="100%">
 		<tr><td><span class="comments"><strong>Name:</strong></span></td><td> #lastname#, #firstname#<br/></td></tr>
 		<tr><td><span class="comments"><strong>Last Login:</strong></span></td><td> #dateformat(logindate, "mmm. d, yyyy")# #timeformat(logindate, "h:mm:ss")#<br/></td></tr>
 		<tr><td><span class="comments"><strong>E-mail:</strong></span></td><td><a href="mailto:#email#">#email#</a></td></tr>
 	</table></cfoutput> 


	</div>
	</div></body>
