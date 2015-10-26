<cfif isdefined("form.post") or isdefined("form.publish")>

		
		assosciates publish			
		
		<cfif isdefined("form.post")>
			<cfloop list="#form.post#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.AUTH_TBL(userid, siteID,auth_level)
					VALUES(#form.userid#, #n#,1)
				</cfquery>
			</cfloop>
		</cfif>
		
		<cfif isdefined("form.publish")>
			<cfloop list="#form.publish#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.AUTH_TBL(userid, siteID,auth_level)
					VALUES(#form.userid#, #n#,2)
				</cfquery>
			</cfloop>
		</cfif>
		
		
		
	<cfelse>
You must choose at least one site to post or publish to.
	</cfif>
<cflocation url="users_list.cfm" addtoken="No">
