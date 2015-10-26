
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
			<img src="/newsevents/images/nande.gif" alt="Loyola University Chicago" width="261" height="57" border="0" align="center">				
			<cfoutput>
		<div class="AlertGood">				
			<cfif isdefined("url.message")>
			#url.message#
			<cfelse>
Just enter your Username below, and we'll email your password to the email address we have on file. If you don't remember your username, please contact #application.adminemail#.
			</cfif>
		</div>
	</cfoutput>
			<form action="forgot_process.cfm" method="post">
				<dl>
					<dt>Username:</dt>
					<dd>
					<input name="user_name" type="text" id="user_name"/></dd>
					
					<dd>
					<input type="submit" value="E-Mail Password" class="button"></dd>
				</dl>					
				<cfif parameterexists(url.location)>
					<cfoutput>
						<input type="hidden" name="location" value="#url.location#">
					</cfoutput>
				</cfif>
			</form>
		</div>
	</div>
</body>
</html>
