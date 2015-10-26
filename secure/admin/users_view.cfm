<cfquery name="getuser" datasource="#application.datasource_select#" maxrows="1">
SELECT      users.lastname, users.firstname, users.userid, logintracking.logindate, logintracking.userid, email
FROM         CUNVMCS.users, CUNVMCS.logintracking 

WHERE      users.userid=#url.userid#
order by logindate desc
</cfquery>

<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT CUNVMCS.AUTH_TBL.SITEID, CUNVMCS.sites.site_name, CUNVMCS.sites.siteid
FROM CUNVMCS.AUTH_TBL, CUNVMCS.sites
WHERE CUNVMCS.AUTH_TBL.USERID=#url.userid#  AND CUNVMCS.AUTH_TBL.AUTH_LEVEL=2 AND CUNVMCS.AUTH_TBL.SITEID=CUNVMCS.sites.siteid
</cfquery>

<cfquery name="getusers" datasource="#application.datasource_select#">
select firstname,lastname,email,createtime,user_admin,userid
from CUNVMCS.users
where 0=0 and userid=#url.userid#
</cfquery>

<cfinclude template="/newsevents/secure/templates/top_small.cfm">	

	<cfoutput query="getuser">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
			<tr>
				<td><strong>Name:</strong></td>
				<td>#lastname#, #firstname#
				<br/></td>
			</tr>
			<tr>
				<td><strong>Last Login:</strong></td>
				<td>#dateformat(logindate, "mmm. d, yyyy")# #timeformat(logindate, "h:mm:ss")#
				<br/></td>
			</tr>
			<tr>
				<td><strong>E-mail:</strong></td>
				<td><a href="mailto:#email#">#email#</a></td>
			</tr>
			</cfoutput>
			
			<cfif getusers.user_admin is 1>
	<tr>
				<td><strong>Publish Access:</strong></td>
				<td>
				<cfoutput query="getusers">
This user is an administrator and has full access rights.
				
			</cfoutput>
		</td></tr>
			</table>
					<cfelse>
		</cfif>
		
		<cfif getusers.user_admin is 0>
				
				<cfif getpublish.recordcount eq 0>
	<tr>
				<td><strong>Access:</strong></td>
				<td>
				No sites assigned to this user.
			</td></tr>
				<cfelse>
				</cfif>
				
				<cfif getpublish.recordcount gt 1>
	<tr>
				<td><strong>Access:</strong></td>
				<td>
				<cfloop query="getpublish">
			<cfoutput>
			#site_name#<br>
				Site ID: #siteid#<br><br>		
				
				</cfoutput></cfloop>
			</td></tr>
			
				<cfelse>
				
				<tr>					
		<cfoutput query="getpublish">
		<tr>
				<td><strong>Access:</strong></td>
				<td>#site_name#<br>
				Site ID: #siteid#
				</cfoutput></cfif>	
				</td>		
			</tr>
		</table>
	</cfif>
<cfinclude template="/newsevents/secure/templates/footer.cfm">	