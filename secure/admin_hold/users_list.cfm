<!--- Only for Administrator access --->
<cfinclude template="/newsevents/templates/adminonly.cfm">
<cfinclude template="/newsevents/templates/securityheader.cfm">

<!--sort nav variables	(variables passed through sortnav in templates folder)-->
	<cfparam name="variables.sort" default="created">	
		
	<cfif parameterexists(url.sort)>	
	<cfset sort=(url.sort)>
	<cfelse>
		<cfset sort='createtime'>
	</cfif>
	
	<cfparam name="isactive" default="1">
			
	<cfif parameterexists(url.isactive)>	
	<cfset isactive=(url.isactive)>
	<cfelse>
		<cfset isactive=1>
	</cfif>
	
	<cfif parameterexists(url.where)>	
	<cfset where=(url.where)>	
	<cfset crit=(url.crit)>
	<cfelse>
		<cfset where=0>	
	<cfset crit=0>
	</cfif>
	
	<!--end sort nav variables	-->
	
<cfquery name="getusers" datasource="#application.datasource_select#">
select firstname,lastname,email,createtime,user_admin,userid
from CUNVMCS.users
where 0=0 and userid <> 85
	
	<cfif parameterexists(isactive) and isactive is 1 or isactive is 0>		and isactive=#isactive#
	</cfif>
order by lastname
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
<cfset end=#getusers.recordcount#-#variables.paginatelevel#><!--end pagination variables-->

	
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">
		
	<h2>Users</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Name</th>
			<th>Date Created</th>
			<th>Email</th>
			<th>Actions</th>
		</tr>			
		<cfif getusers.recordcount lt 1>
			<tr>
				<td colspan="3">There are currently no users available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getusers">
				<form action="admin_action.cfm" method="post">
					<tr>
						<td><a href="##" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a>							
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
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&site=#variables.site#&sort=#variables.sort#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&site=#variables.site#&sort=#variables.sort#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getusers.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&site=#variables.site#&sort=#variables.sort#">next #variables.paginatelevel# records</a>
				</cfif>
				<cfif getusers.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&site=#variables.site#&sort=#variables.sort#">last records</a>
				</cfif>
				next=#variables.next# nextpub=#variables.nextpub# rc=#getusers.recordcount# last=#variables.last#</td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
	
<cfoutput><script LANGUAGE=javascript><!--
function OnChange(dropdown)
{
	var myindex = dropdown.selectedIndex
    var baseURL= "users_list.cfm?sortby=#variables.sort#&isactive="
        top.location.href = baseURL + dropdown.options[myindex].value;
    
    return true;
}
//-->
</script></cfoutput>

		<form method="get" action="users_list.cfm" id="form1" name="form1">
			<select name="select1" onChange='OnChange(this.form.select1);'>
				<option value="4" <cfif isactive is 4>selected</cfif>>--filter on---</option>
				<option value="3" <cfif isactive is 3>selected</cfif>>Show all</option>
				<option value="1" <cfif isactive is 1>selected</cfif>>Show active</option>
				<option value="0" <cfif isactive is 0>selected</cfif>>Show inactive</option>
			</select>
		</form>
<cfinclude template="/newsevents/templates_new/footer.cfm">