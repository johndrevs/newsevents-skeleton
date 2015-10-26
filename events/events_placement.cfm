<cfinclude template="/newsevents/templates/securityheader.cfm">

	<cfquery name="getplacement" datasource="#application.datasource_select#">
		SELECT      events_ref.events_ref_level, events_ref.userid, events_ref.siteid, events_ref.actiondate, events_tbl.created, events_tbl.pubdate, events_tbl.pulldate, events_tbl.shortdesc, events_tbl.longdesc, sites.site_name, users.user_name, users.lastname, users.firstname, events_tbl.eventid, events_ref.event_refid
		FROM         CUNVMCS.events_tbl, CUNVMCS.events_ref, CUNVMCS.users, CUNVMCS.sites 
		WHERE       events_ref.userid = users.userid AND events_ref.siteid = sites.siteid AND events_ref.eventid = events_tbl.eventid AND events_tbl.eventid=#url.eventid# and events_ref_level <>4
		order by level desc
	</cfquery>
	<CFSET used=valuelist(getplacement.siteid)>
<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT distinct SITES.SITEID, SITES.site_name
FROM CUNVMCS.SITES
WHERE sites.isactive =1 and SITEID in (#session.publish#) and SITES.siteid  NOT IN(#variables.used#)
</cfquery>

<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT distinct SITES.SITEID, SITES.site_name
FROM CUNVMCS.SITES
WHERE sites.isactive =1 and SITEID in (#session.post#) and SITES.siteid  NOT IN(#variables.used#)
</cfquery>

<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">


	<h2>Existing Placements</h2>
		<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">			
		<cfif getplacement.pubdate GTE #now()# or getplacement.pulldate LTE #now()#>
			<tr>
				<th colspan="5"><strong>This news item is inactive</strong></td>
			</tr>
		</cfif>
		<cfoutput query="getplacement" group="events_ref_level" groupcasesensitive="Yes">
			<tr>
				<th colspan="2">The event "#shortdesc#				
				<cfif events_ref_level is 1>is posted to the following sites				
				<cfelseif events_ref_level is 2>is published to the following sites				
				<cfelseif events_ref_level is 0>has been rejected for the following sites by the site's publisher
				</cfif></th>
			</tr>
			<cfoutput>
			<tr>
				<form action="events_placement_action.cfm" method="post">
					<td>#site_name# (#dateformat(actiondate,"mm.dd.yyyy")# by #firstname# #lastname#)</td>
					<td>						
					<cfif ListContains(#session.publish#, #siteid#)>							
						<cfif events_ref_level is 1>
							<input type="submit" name="publishsite" value="publish to this site" class="button">
							<input type="submit" name="reject" value="reject for this site" class="button">						
						<cfelseif events_ref_level is 2>
							<input type="submit" name="unpublish" value="unpublish on this site" class="button">
						</cfif>
					<cfelseif getplacement.userid is session.userid>
						<input type="submit" name="unpost" value="unpost to this site" class="button">
					<cfelse>
You don't have publish access to this site
					</cfif>
					&nbsp;</td>
				</tr>
					<input type="hidden" name="event_refid" value="#event_refid#">
					<input type="hidden" name="eventid" value="#url.eventid#">
					<input type="hidden" name="notify" value="#getplacement.userid#">
				</form>
			</cfoutput>
		</cfoutput>
	</table>	
	
	<h2>Further Placements</h2>
	<form action="events_placement_action2.cfm" method="post">
		<cfoutput>
			Publish Event to:<br/>
			<cfif getpublish.recordcount gt 0>				
				<select name="publish" size="3" multiple>
					<cfloop query="getpublish">
						<option value="#siteid#">#site_name#</option>
					</cfloop>
				</select><br/><br/>
			<cfelse>
				You either do not currently have access to publish to any sites or this event is already published  to the sites you do.<br/><br/>
			</cfif>
			Post Event to:<br/>				
			<cfif getpost.recordcount gt 0>						
				<select name="post" size="3" multiple>
					<cfloop query="getpost">
						<option value="#siteid#">#site_name#</option>
					</cfloop>
				</select><br/><br/>
			<cfelse>
				You either do not currently have access to publish to any sites or this event is already posted to the sites you do.<br/><br/>
			</cfif>
			<cfif getpost.recordcount gt 0 or getpublish.recordcount gt 0><input type="submit" value="place more sites" class="button"></cfif><input type="hidden" name="eventid" value="#url.eventid#">
		</cfoutput>
	</form>
	
<cfinclude template="/newsevents/templates_new/footer.cfm">

