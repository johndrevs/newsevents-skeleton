<!--- Only for Administrator access --->
<cfinclude template="../templates/adminonly.cfm">
<cfinclude template="/newsevents/templates/securityheader.cfm">



<cfquery name="getlocations" datasource="#application.datasource_select#">
select location_name,locationid
		from CUNVMCS.locations
		where locationid <>21
		and isactive=1
</cfquery>
<!--pagination variables-->		
	<cfif parameterexists(url.startindex)>	
	<cfset startindex=#url.startindex#>
	<cfelse>
		<cfset startindex=1>
	</cfif>
<cfset last=#variables.startindex#-#variables.paginatelevel#>
<cfset next=#variables.startindex#+#variables.paginatelevel#>
<cfset nextpub=#variables.startindex#+#variables.paginatelevel#-1>
<cfset beginning=1>
<cfset end=#getlocations.recordcount#-#variables.paginatelevel#>
<!--end pagination variables-->

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">
	
	<h2>Locations</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Name</th>
			<th>Actions</th>
		</tr>			
		<cfif getlocations.recordcount lt 1>
			<tr>
				<td colspan="2">There are currently no locations available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getlocations">
				<form action="admin_action.cfm" method="post">
					<tr>
						<td><a href="##" onClick="window.open('locations_view.cfm?locationid=#locationid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#location_name#</a></td>
						<td>
						<input type="submit" name="delete" value="delete" class="button" onClick="return confirmdelete()">
						<input type="submit" name="edit" value="edit" class="button"></td>
					</tr>
					<input type="hidden" name="itemid" value="#locationid#">
				</form>
			</cfoutput>
		</cfif>
		<!--Pagination table row-->
		<cfoutput>
			<tr>
				<td>records #variables.startindex#-					
				<cfif getlocations.recordcount GT variables.nextpub>#variables.nextpub# of #getlocations.recordcount#
				<cfelse>#getlocations.recordcount#
				</cfif></td>
				<td class="right">					
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&site=#variables.site#&sort=#variables.sort#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&site=#variables.site#&sort=#variables.sort#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getlocations.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&site=#variables.site#&sort=#variables.sort#">next #variables.paginatelevel# records</a>
				</cfif>
				<cfif getlocations.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&site=#variables.site#&sort=#variables.sort#">last records</a>
				</cfif>
				next=#variables.next# nextpub=#variables.nextpub# rc=#getlocations.recordcount# last=#variables.last#</td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
	
<cfinclude template="/newsevents/templates_new/footer.cfm">