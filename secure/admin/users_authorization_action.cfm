<cfif isdefined("form.post") or isdefined("form.publish")>
<cfquery name="updateuseraccess" datasource="#application.datasource_update#">
delete from     CUNVMCS.AUTH_TBL

where userid=#form.userid#
</cfquery>
		<cfoutput>#form.publish#</cfoutput>
		assosciates publish			
		

		
		<cfif isdefined("form.publish")>
			<cfloop list="#form.publish#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.AUTH_TBL(userid, siteID,auth_level)
					VALUES(#form.userid#, #n#,2)
				</cfquery>
			</cfloop>
		</cfif>
        
      <!--- Lenzlee removed bc wasn't working
       <cfquery name="updateuseraccess" datasource="#application.datasource_update#">
update     CUNVMCS.AUTH_TBL
SET       userid='#form.userid#', siteID='#n#'
where userid=#form.userid#
</cfquery>--->

		
	<cfelse>
You must choose at least one site to post or publish to.
	</cfif>

<cflocation url="users_list.cfm" addtoken="No">
