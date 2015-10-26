
	<cfoutput><table cellpadding="5" cellspacing="1" border="0">
		<tr>
			<td class="ViewHeading" colspan="2">Schedule information</td>
		</tr>
		<tr>
			<td>Event</td>
			<td class="ViewRight">#variables.shortdesc#</td>
		</tr>
		<tr>
			<td>When</td>
			<td class="ViewRight"><cfif datecompare(variables.startdate,variables.enddate,"d") NEQ 0>#dateformat(variables.startdate,"dddd mmmm d yyyy")# at #timeformat(variables.startdate,"hh:mm tt")#
				<cfif enddate is not ''><br/>to<br/>
#dateformat(variables.enddate,"dddd mmmm d yyyy")# at #timeformat(variables.enddate,"hh:mm tt")#
				</cfif>
			<cfelse>
			#dateformat(variables.startdate,"dddd mmmm d yyyy")# at #timeformat(variables.startdate,"hh:mm tt")# - 
				<cfif enddate is not ''>#timeformat(variables.enddate,"hh:mm tt")#
				</cfif>
			</cfif></td>
		</tr>
		<cfif location_name is not '' or specificlocation is not ''>
		<tr>
			<td>Where</td>
			<td class="ViewRight"><cfif location_name is not ''>#variables.location_name#, #variables.specificlocation#<cfelse>#variables.specificlocation#</cfif></td>
		</tr>
		</cfif>
		<tr>
			<td class="ViewHeading" colspan="2">Event details</td>
		</tr>
		<tr>
			<td>Access</td>
			<td class="ViewRight">&raquo; <cfif variables.ispublic is 1>This event has been marked as open to the public.<cfelseif variables.ispublic is 0>This event has not been marked as open to the public.</cfif></td>
		</tr>
		<cfif rsvp is 1>
		<tr>
			<td>RSVP</td>
			<td class="ViewRight">&raquo; <cfif variables.rsvpp is 1>This event requires an RSVP.<br/> <a href="">Click here to see an attendee list</a><cfelseif variables.rsvpp is 0>This event requires an RSVP or Ticket</cfif></td>
		</tr>
		</cfif>
		<cfif events_link is not ''>
		<tr>
			<td>Link</td>
			<td class="ViewRight">#variables.events_link# <cfif variables.events_link_override EQ 1>(This link will serve as the primary page for the event)<cfelse> regular</cfif></td>
		</tr>
		</cfif>
		<cfif contact is not ''>
		<tr>
			<td>Contact</td>
			<td class="ViewRight">#variables.contact#</td>
		</tr>
		</cfif>
		<cfif sponsor is not ''>
		<tr>
			<td>Sponsors</td>
			<td class="ViewRight">#variables.sponsor#</td>
		</tr>
		</cfif>
		<cfif events_cost is not ''>
		<tr>
			<td>Cost</td>
			<td class="ViewRight">#variables.events_cost#</td>
		</tr>
		</cfif>
		<cfif information is not ''>
		<tr>
			<td colspan="2" align="left">Information</td>
			
		</tr>
		<tr>
			<td colspan="2" class="ViewRight">#Information#</td>
		
		</tr>
		</cfif>
		<cfif http_REFERER contains 'public'>
		<cfquery datasource="#application.datasource_select#" name="getcalendar">
							SELECT name
							FROM sites
							where siteid=#url.calendar#
</cfquery>
		
		
		<tr>
			<td>Calendar</td>
			<td class="ViewRight"><cfif url.calendar is 0>Master Calendar<cfelse><cfoutput>#getcalendar.name#</cfoutput></cfif><br/>
&raquo;<a href="calendar_info.cfm?calendar=#url.calendar#">
               Information about this calendar</a><br/>
&raquo;<a href="calendar.cfm?calendar=#url.calendar#">
               Other events on this calendar</a><br/>
&raquo;<a href="calendar.cfm">All events on the Master Calendar</a></td>
		</tr>
		</cfif>
	</table></cfoutput>