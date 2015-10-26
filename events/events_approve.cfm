<cfinclude template="/newsevents/templates/securityheader.cfm">

<!--sort nav variables	(variables passed through sortnav in templates folder)-->	
	<cfparam name="variables.sort" default="created">	
	<cfif parameterexists(url.sortby)>		
		<cfset sortby=(url.sortby)>
	<cfelse>
		<cfset sortby='created'>
	</cfif>
	
	<cfparam name="site" default="0">	
	<cfif parameterexists(url.site)>		
		<cfset site=(url.site)>
	<cfelse>
		<cfset site=0>
	</cfif>
	
	<cfif parameterexists(url.where)>		
		<cfset where=(url.where)>		
		<cfset crit=(url.crit)>
	<cfelse>
		<cfset where=0>		
		<cfset crit=0>
	</cfif>	
<!--end sort nav variables	-->
	
	<cfquery name="getevents" datasource="#application.datasource_select#">
		SELECT      users.lastname, users.firstname, users.user_admin,events_tbl.startdate, sites.site_name, events_tbl.pubdate, events_tbl.pulldate, events_tbl.eventid, events_tbl.shortdesc, events_tbl.userid, event_refid
		FROM         CUNVMCS.events_tbl, CUNVMCS.events_ref, CUNVMCS.sites, CUNVMCS.users 
		WHERE       events_tbl.eventid = events_ref.eventid AND events_ref.siteid = sites.siteid AND events_ref.userid = users.userid and events_ref.events_ref_level=1 and sites.isactive=1			
		<cfif site is 1>and (pubdate <= #now()# and pulldate >= #now()#)		
		<cfelseif site is 2>and (pubdate >= #now()# or pulldate <= #now()#)
		</cfif>
		<cfif session.administrator eq 0>and  events_ref.siteid IN (#session.publish#)
		</cfif>
		order by #variables.sortby#
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
	<cfset end=#getevents.recordcount#-#variables.paginatelevel#>
<!--end pagination variables-->
	

<cfset page='events'>
<cfset sort='yes'>
<cfinclude template="/newsevents/templates_new/top.cfm">
	

			<h2>Events</h2>
			<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
<tr>
	<th>Event</th>
	<th>Author</th>
	<th>Event Date</th>
	<th>Publish Date</th>
	<th>Site</th>
	<th>Actions</th>
</tr>
<cfif getevents.recordcount is 0>
<tr>
	<td colspan=5>There are no news items waiting to be published to your sites with this criteria</td>
</tr>
<cfelse>
<cfoutput query="getevents" STARTROW=#variables.startindex# MAXROWS=#variables.paginatelevel#><form action="events_action.cfm" method="post"><tr>
	<td><a class="date" href="##"onClick="window.open('events_view.cfm?eventid=#eventid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shortdesc#</a></td>
	<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a><cfif user_admin is 1>*</cfif></td>
	<td>#dateformat(startdate,"mm.dd.yyyy")#</td>
	<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
	<td>#site_name#</td>
	<td><input type="submit" name="publish" value="publish to this site" class="button"></td>
</tr><input type="hidden" name="eventid" value="#eventid#"><input type="hidden" name="site_name" value="#site_name#"><input type="hidden" name="shortdesc" value="#shortdesc#"><input type="hidden" name="event_refid" value="#event_refid#"></form></cfoutput></cfif>

<!--Pagination table row-->
	<cfoutput>
		<tr>
			<td colspan="4">records #variables.startindex#-				
			<cfif getevents.recordcount GT variables.nextpub>					
				#variables.nextpub#
				of #getevents.recordcount#
			<cfelse>#getevents.recordcount#
			</cfif></td>			
			<td colspan="2" class="right">				
			<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&site=#variables.site#&sort=#variables.sort#">first records</a>
			</cfif>
			<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&site=#variables.site#&sort=#variables.sort#">previous #variables.paginatelevel# records</a>
			</cfif>
			<cfif getevents.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&site=#variables.site#&sort=#variables.sort#">next #variables.paginatelevel# records</a>
			</cfif>
			<!--- <cfif getevents.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&site=#variables.site#&sort=#variables.sort#">last records</a>
			</cfif> --->next=#variables.next# nextpub=#variables.nextpub# rc=#getevents.recordcount# last=#variables.last#</td>
		</tr>
	</cfoutput>
<!--end pagination table row-->

</table>

		
		
			


<cfoutput><script LANGUAGE=javascript><!--
function OnChange(dropdown)
{
	var myindex = dropdown.selectedIndex
    var baseURL= "events_approve.cfm?sortby=#variables.sort#&site="
        top.location.href = baseURL + dropdown.options[myindex].value;
    
    return true;
}
//-->
</script></cfoutput>

		<form method="get" action="events_approve.cfm" id="form1" name="form1">
			<select name="select1" onChange='OnChange(this.form.select1);'>
				<option value="4" <cfif site is 4>selected</cfif>>--filter on---</option>
				<option value="3" <cfif site is 3>selected</cfif>>Show all</option>
				<option value="1" <cfif site is 1>selected</cfif>>Show active</option>
				<option value="2" <cfif site is 2>selected</cfif>>Show inactive</option>
			</select>
		</form>
	
<cfinclude template="/newsevents/templates_new/footer.cfm">
