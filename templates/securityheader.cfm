		
	<cfif parameterexists(url.location)>	
	<cfset relocate='#url.location#'>
	<cfelse>
		<cfset relocate='no'>
	</cfif>
	<cfif isdefined("session.userid") and session.userid neq 0>			
		<cfif isdefined("session.memberloggedin")>				
			<cfif session.memberloggedin neq 'Y'>
				<cflocation url="#application.url#/logout.cfm?location=#variables.relocate#" addtoken="No">
			</cfif>
		<cfelse>
			<cflocation url="#application.url#/logout.cfm?location=#variables.relocate#" addtoken="No">
		</cfif>
	<cfelse>
		<cflocation url="#application.url#/logout.cfm?location=#variables.relocate#" addtoken="No">
	</cfif>
