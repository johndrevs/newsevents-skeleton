
	<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled</title>
</head>
	<cfquery name="getsites" datasource="#application.datasource_select#">
		SELECT      sites.site_name, sites.uri, sites.description, sites.creator, users.firstname, users.lastname
		FROM         CUNVMCS.sites,CUNVMCS.users 
		WHERE       sites.creator = users.userid
		and siteid=#url.siteid#
	</cfquery>
<body>
	<cfoutput query="getsites">
		<cfquery name="getaccess" datasource="#application.datasource_select#">
			SELECT      distinct AUTH_TBL.userid, AUTH_TBL.siteid, AUTH_TBL.auth_level, users.lastname, users.firstname
			FROM         CUNVMCS.AUTH_TBL, CUNVMCS.users 
			WHERE       AUTH_TBL.userid = users.userid and AUTH_TBL.siteid=#siteid#
			order by auth_level
		</cfquery>
		Name: #site_name#<br/>
#description#<br/>
URI: #uri#<br/>
Created by: #firstname# #lastname#<br/>
Non-Administrator Access by:<br/>
		<cfloop query="getaccess">
			#firstname# #lastname#				
			<cfif auth_level is 1>post<cfelse>publish</cfif>
<br/>
		</cfloop>
	</cfoutput>
</body>
</html>
