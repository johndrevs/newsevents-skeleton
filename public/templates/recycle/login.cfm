
<cfset StructClear(session)>
<!doctype html public "-//W3C//DTD XHTML 1.0 TRANSITIONAL//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<title>News and Events Login</title><link rel="Stylesheet" href="/newsevents/css/new.css" type="text/css" media="screen"/>
</head>
<body class="login" onLoad="document.forms[0].elements[0].focus();">
	<div class="Container">
		<div id="Dialog">
			<img src="/newsevents/secure/images/nande.gif" alt="Loyola University Chicago" width="261" height="57" border="0" align="center">				
			<cfif isdefined("url.message")>
				<cfoutput>
					<div class="AlertGood">#url.message#</div>
				</cfoutput>
			</cfif>
			<form action="validatelogin.cfm" method="post">
				<dl>
					<dt>Username:</dt>
					<dd>
					<input name="user_name" type="text" id="user_name"/></dd>
					<dt>Password:</dt>
					<dd>
					<input type="password" name="passcode" id="passcode">
					<span>(<a href="forgot.cfm">I forgot my password</a>)</span></dd>
					<dd>
					<input type="submit" value="login" class="button"></dd>
				</dl>					
				<cfif isDefined("url.location")>
					<cfoutput>
						<input type="hidden" name="location" value="#url.location#">
					</cfoutput>
				</cfif>
			</form>
		</div>
	</div>
</body>
</html>
