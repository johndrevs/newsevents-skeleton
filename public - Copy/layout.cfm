

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/typography2.css" type="text/css" media="screen"><link rel="stylesheet" href="../css/design2.css" type="text/css" media="screen"><link rel="stylesheet" href="../css/design_home2.css" type="text/css" media="screen"><link rel="stylesheet" href="../css/layout2.css" type="text/css" media="screen">

	<title>Loyola University Chicago News and Events</title>

	<script language="JavaScript" src="../scripts/calendar2.js"></script>
	<script language="JavaScript" src="../scripts/confirmdelete.js"></script>

</head><cfif parameterexists(bodyid)>
<cfoutput><body id="#variables.bodyid#"></cfoutput>
<cfelse><body id="home">
</cfif>



<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" id="home">
	<div class="content"><table width="100%" border="1" cellspacing="0" cellpadding="0">
<tr>
			<td colspan="3" bgcolor="#EBF4FA"><img src="images/nande.gif" width="261" height="57" alt="Loyola University Chicago News and Events"></td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="#54A4DE"><img src="images/spacer.gif" width="1" height="8" alt=""></td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="#BBD9EE">
			<ul id="globalNav">
					<li class="active" id="articlesLink"><a href="/">News</a></li>
					<li id="eventsLink"><a href="/contribute/">Events</a></li>
					<li id="adminLink"><a href="/newsletter/">Administration</a></li>
				</ul>
			</td>
		</tr>
<tr>
			<td width="180" align="right"><cfinclude template="../templates/news_adminnav.cfm"></td>
			<td width="70%" class="content">&nbsp;</td>
			<td width="30%" class="sidebar"><cfinclude template="../templates/access_sidebar.cfm"></td>
		</tr> 
	</table></div>
	
	
	

<cfinclude template="../templates/footer.cfm">



</body>
</html>
