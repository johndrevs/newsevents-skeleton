

<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Loyola University Chicago News and Events</title><link rel="stylesheet" href="/newsevents/css/new.css" type="text/css" media="screen">
<script language="JavaScript" src="/newsevents/scripts/calendar2.js"></script>
<script language="JavaScript" src="/newsevents/scripts/confirmdelete.js"></script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0">
	<div class="content">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" bgcolor="#F2F2F2"><img src="/newsevents/images/nande.gif" width="261" height="57" alt="Loyola University Chicago News and Events"></td>
			</tr>
			<tr>
				<td colspan="2" align="right" bgcolor="#990033"><img src="/newsevents/images/spacer.gif" width="1" height="8" alt=""></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#FEEDC5">
				<table border="0" cellspacing="0" cellpadding="0" class="globalnav" bgcolor="#FEEDC5">
					<tr>
						<td><img src="/newsevents/images/spacer.gif" width="180" height="28" alt=""></td>
						<td valign="bottom"><cfinclude template="/newsevents/templates_new/global_nav.cfm"></td>
						<td width="100%" align="right"><a href="/newsevents/index.cfm" class="more">News and Events Dashboard</a> | <a href="/newsevents/logout.cfm" class="more">Logout of News and Events </a></td>
					</tr>
				</table></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#ffffff"><img src="/newsevents/images/spacer.gif" width="1" height="5" alt=""></td>
			</tr>
			<tr>
				<td align="left" valign="top" background="/newsevents/images/beige_bg.gif"><img src="/newsevents/images/spacer.gif" width="180" height="5" alt="">
				<cfif parameterexists(variables.page) and variables.page neq 'admin'>
					<cfinclude template="/newsevents/templates_new/#variables.page#_adminnav.cfm">
				</cfif>
				<cfif sort neq 'no'>
					<br /><br /><cfinclude template="/newsevents/templates_new/#variables.page#_sortnav.cfm">
				</cfif></td>
				<td width="100%" valign="top" class="main_body">