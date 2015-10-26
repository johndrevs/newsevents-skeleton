<!--- <cfinclude template="../application.cfm"> --->
<cfinclude template="securityheader.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="/newsevents/css/home.css" type="text/css" media="screen">

	<title>Loyola University Chicago News and Events</title>

	<script language="JavaScript" src="/newsevents/scripts/calendar2.js"></script>
	<script language="JavaScript" src="/newsevents/scripts/confirmdelete.js"></script>

</head><cfif isDefined("bodyid")>
<cfoutput><body id="#variables.bodyid#"></cfoutput>
<cfelse><body id="home">
</cfif>

<h1 id="masthead"><img src="/newsevents/secure/images/nande.gif" width="261" height="57" alt="Loyola University Chicago News and Events"></h1>

