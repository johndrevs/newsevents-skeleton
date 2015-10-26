<!--- Only for Administrator access --->




<cfquery name="getsites" datasource="#application.datasource_select#">
select site_name,siteid,ispublic
		from CUNVMCS.sites
		where isactive=1
		order by site_name
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
<cfset end=#getsites.recordcount#-#variables.paginatelevel#>
<!--end pagination variables-->

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">	

	<h2>Sites</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Name</th>
			<th>Actions</th>
		</tr>			
		<cfif getsites.recordcount lt 1>
			<tr>
				<td colspan="2">There are currently no sites available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getsites">
				<form action="admin_action.cfm" method="post">
					<tr>
						<td><a href="##?siteid=#siteid#" class="date" onClick="window.open('sites_view.cfm?siteid=#siteid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#site_name#</a> <cfif getsites.ispublic is 1>(public)</cfif> </td>
						<td>
						<input type="submit" name="sitedelete" value="delete" class="button" onClick="return confirmdelete()">
						<input type="submit" name="siteedit" value="edit" class="button"></td>
					</tr>
					<input type="hidden" name="itemid" value="#siteid#">
				</form>
			</cfoutput>
		</cfif>
	</table>

<cfinclude template="/newsevents/secure/templates/footer.cfm">
