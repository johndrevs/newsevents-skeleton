
	<cfoutput><table width="65%" border="0" cellspacing="1" cellpadding="5" class="tabulargrey">
		<tr>
			<th colspan="2">Schedule information</th>
		</tr>
		<tr>
			<td>Event</td>
			<td>#variables.shortdesc#</td>
		</tr>
		<tr>
			<td>When</td>
			<td>
<cfif enddate is ''>		
		#dateformat(variables.startdate,"dddd mmmm d yyyy")#  #timeformat(variables.startdate,"h:mm tt")#	
	<cfelseif datecompare(variables.startdate,variables.enddate,"d") NEQ 0>
		#dateformat(variables.startdate,"dddd mmmm d yyyy")# at #timeformat(variables.startdate,"h:mm tt")#
		<br/>to
		<br/>#dateformat(variables.enddate,"dddd mmmm d yyyy")# at #timeformat(variables.enddate,"h:mm tt")#	
	<cfelseif datecompare(variables.startdate,variables.enddate,"d") EQ 0>
		#dateformat(variables.startdate,"dddd mmmm d yyyy")# at #timeformat(variables.startdate,"h:mm tt")# - #timeformat(variables.enddate,"h:mm tt")#
	</cfif></td>
		</tr>
		<cfif location_name is not '' or specificlocation is not ''>
		<tr>
			<td>Where</td>
			<td>&raquo;<cfif variables.locationid NEQ 21 AND location_name is not '' >#variables.location_name#, #variables.specificlocation#<cfelse>#variables.specificlocation#</cfif></td>
		</tr>
		</cfif>
		<tr>
			<th colspan="2">Event details</th>
		</tr>
		<tr>
			<td>Access</td>
			<td>&raquo; <cfif variables.ispublic is 1>This event has been marked as open to the public.<cfelseif variables.ispublic is 0>This event has not been marked as open to the public.</cfif></td>
		</tr>
		<cfif rsvp is 1>
		<tr>
			<td>RSVP</td>
			<td>&raquo; <cfif variables.rsvpp is 1>This event requires an RSVP.<br/> <a href="">Click here to see an attendee list</a><cfelseif variables.rsvpp is 0>This event requires an RSVP or Ticket</cfif></td>
		</tr>
		</cfif>
		<cfif events_link is not ''>
		<tr>
			<td>Link</td>
			<td><a href="#variables.events_link#">#variables.events_link#</a> <cfif variables.events_link_override EQ 1><br />(This link will serve as the primary page for the event)<cfelse></cfif></td>
		</tr>
		</cfif>
		<cfif contact is not ''>
		<tr>
			<td>Contact</td>
			<td>#variables.contact#</td>
		</tr>
		</cfif>
		<cfif sponsor is not ''>
		<tr>
			<td>Sponsors</td>
			<td>#variables.sponsor#</td>
		</tr>
		</cfif>
		<cfif events_cost is not ''>
		<tr>
			<td>Cost</td>
			<td>#variables.events_cost#</td>
		</tr>
		</cfif>
		<cfif information is not ''>
		<tr>
			<td colspan="2" align="left"><strong>Information</strong><br />#variables.Information#</td>
		
		</tr>
		</cfif>
		<cfif isDefined("url.calendar")>
		<cfquery datasource="#application.datasource_select#" name="getcalendar">
							SELECT site_name
							FROM CUNVMCS.sites
							where siteid=#url.calendar#
</cfquery>
		
		
		<tr>
			<td>Calendar</td>
			<td><cfif url.calendar is 0>Master Calendar<cfelse><cfoutput>#getcalendar.site_name#</cfoutput></cfif><br/>
&raquo;<a href="calendar_info.cfm?calendar=#url.calendar#">
               Information about this calendar</a><br/>
&raquo;<a href="calendar.cfm?calendar=#url.calendar#">
               Other events on this calendar</a><br/>
&raquo;<a href="calendar.cfm">All events on the Master Calendar</a></td>
		</tr>
		</cfif>
	</table></cfoutput>