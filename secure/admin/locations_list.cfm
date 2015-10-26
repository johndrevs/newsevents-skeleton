<!--- Only for Administrator access --->
<cfinclude template="/newsevents/secure/templates/adminonly.cfm">




<cfquery name="getlocations" datasource="#application.datasource_select#">
select location_name,locationid
		from CUNVMCS.locations
		where locationid <>21
		and isactive=1
		order by location_name
</cfquery>
<!--pagination variables-->		
	<cfif isDefined("url.startindex")>	
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
<cfinclude template="/newsevents/secure/templates/top.cfm">
	
	<h2>Locations</h2>
	
	<p>Click on the location name to view information before editing.</p>
	
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
			<cfoutput query="getlocations" STARTROW=#variables.startindex# MAXROWS=#variables.paginatelevel#>
				<form action="admin_action.cfm" method="post">
					<tr>
						<td><a href="##" onClick="window.open('locations_view.cfm?locationid=#locationid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#location_name#</a></td>
						<td>
						<input type="submit" name="locationdelete" value="delete" class="button" onClick="return confirmdelete()">
						<input type="submit" name="locationedit" value="edit" class="button"></td>
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
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getlocations.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#">next #variables.paginatelevel# records</a>
				</cfif>
				<cfif getlocations.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#">last records</a>
				</cfif></td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">