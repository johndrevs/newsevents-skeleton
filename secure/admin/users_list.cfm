<!--- Only for Administrator access --->
<cfinclude template="/newsevents/secure/templates/adminonly.cfm">

	<cfparam name="isactive" default="1">
			
	<cfif isDefined("url.isactive")>	
	<cfset isactive=(url.isactive)>
	<cfelse>
		<cfset isactive=1>
	</cfif>
	
	<cfif parameterexists(form.criteria)>
  <cfset criteria=form.criteria>
  <cfelseif isdefined("url.criteria")>

  <cfset criteria=replacenocase(url.criteria, 'http','', 'all')>
  <cfset criteria=replacenocase(url.criteria, '.html','', 'all')>
  <cfelse>
  <cfset criteria='none'>
</cfif>
<cfquery name="getusers" datasource="#application.datasource_select#">
select firstname,lastname,email,createtime,user_admin,userid
from CUNVMCS.users
where 0=0 and userid <> 85
	
	<cfif isDefined("isactive") and isactive is 1 or isactive is 0>		and isactive=#isactive#
	</cfif>
	<cfif criteria neq 'none'>and (lower(firstname) like LOWER('%#criteria#%') OR lower(lastname) like LOWER('%#criteria#%'))</cfif>
order by lastname
</cfquery>
<!--sort nav variables	(variables passed through sortnav in templates folder)-->
	
		
	
	

	
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
	<cfset end=#getusers.recordcount#-#variables.paginatelevel#>
<!--end pagination variables-->
	
	<!--end sort nav variables	-->
	


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
<cfset end=#getusers.recordcount#-#variables.paginatelevel#><!--end pagination variables-->




<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
		
	<h2>Users</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
    <tr><td colspan="4"><form method="post" action="#cgi.SCRIPT_NAME#">
    <span style="font-family: myriad-pro,sans-serif; font-size: 13px;">Search:</span>
    <cfoutput><input type="text" name="criteria" <cfif criteria neq 'none'> value="#criteria#"</cfif>></cfoutput>
    <input type="submit" value="search" class="button gray medium">
  </form></tr>
		<tr>
			<th>Name1</th>
			<th>Date Created</th>
			<th>Email</th>
			<th>Actions</th>
		</tr>			
		<cfif getusers.recordcount lt 1>
			<tr>
				<td colspan="3">There are currently no users available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getusers" STARTROW=#variables.startindex# MAXROWS=#variables.paginatelevel#>
           
				<form action="admin_action.cfm" method="post">
					<tr>
						<td><a href="##" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#lastname#, #firstname#</a>							
						<cfif getusers.user_admin is 1>							*
						</cfif></td>
						<td>#dateformat(createtime,"mm.dd.yyyy")#&nbsp;</td>
						<td>#email#</td>
						<td>
						<input type="submit" name="rework" value="edit" class="button">							
						<cfif session.administrator is 1>
							<input type="submit" name="delete_user" value="delete" class="button" onClick="return confirmdelete()">
						</cfif>
						<cfif session.administrator is 1>
							<input type="submit" name="access" value="control access" class="button">
						</cfif></td>
					</tr>
					<input type="hidden" name="itemid" value="#userid#">
				</form>
			</cfoutput>
		</cfif>
		<!--Pagination table row-->
	<cfoutput>
			<tr>
				<td colspan="2">records #variables.startindex#-					
				<cfif getusers.recordcount GT variables.nextpub>
				#variables.nextpub#	of #getusers.recordcount#
				<cfelse>
				#getusers.recordcount#
				</cfif></td>
				<td colspan="2" class="right">					
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&criteria=#criteria#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&criteria=#criteria#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getusers.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&criteria=#criteria#">next #variables.paginatelevel# records</a>
				</cfif>
				<cfif getusers.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&criteria=#criteria#">last records</a>
				</cfif>
				next=#variables.next# nextpub=#variables.nextpub# rc=#getusers.recordcount# last=#variables.last#</td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
	
<!--- <cfinclude template="/newsevents/secure/templates/filter.cfm"> --->
<cfinclude template="/newsevents/secure/templates/footer.cfm">