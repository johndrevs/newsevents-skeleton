
	<cfoutput><table cellpadding="5" cellspacing="1" border="0">
		<tr>
			<td class="ViewHeading" colspan="2">Schedule information</td>
		</tr>
		<tr>
			<td class="ViewLeft">Event</td>
			<td class="ViewRight">#variables.shortdesc#</td>
		</tr>
		<tr>
			<td class="ViewLeft">When</td>
			<td class="ViewRight">#dateformat(variables.startdate,"dddd mmmm d yyyy")# at #timeformat(variables.startdate,"hh:mm tt")#<cfif enddate is not ''><br/>to<br/> #dateformat(variables.enddate,"dddd mmmm d yyyy")# at #timeformat(variables.enddate,"hh:mm tt")#</cfif></td>
		</tr>
		<tr>
			<td class="ViewLeft">Where</td>
			<td class="ViewRight">location</td>
		</tr>
		<tr>
			<td class="ViewHeading" colspan="2">Event details</td>
		</tr>
		<tr>
			<td class="ViewLeft">Access</td>
			<td class="ViewRight">&raquo; <cfif variables.ispublic is 1>This event has been marked as open to the public.<cfelseif variables.ispublic is 0>This event has not been marked as open to the public.</cfif></td>
		</tr>
		<cfif rsvp is 1>
		<tr>
			<td class="ViewLeft">RSVP</td>
			<td class="ViewRight">&raquo; <cfif variables.rsvpp is 1>This event requires an RSVP.<br/> <a href="">Click here to see an attendee list</a><cfelseif variables.rsvpp is 0>This event requires an RSVP or Ticket</cfif></td>
		</tr>
		</cfif>
		<cfif link is not ''>
		<tr>
			<td class="ViewLeft">Link</td>
			<td class="ViewRight">#variables.link#</td>
		</tr>
		</cfif>
		<tr>
			<td class="ViewLeft">Contact</td>
			<td class="ViewRight">&nbsp; </td>
		</tr>
		<tr>
			<td class="ViewLeft">Sponsors</td>
			<td class="ViewRight">&nbsp; </td>
		</tr>
		<cfif information is not ''>
		<tr>
			<td class="ViewLeft" colspan="2">Information</td>
			
		</tr>
		<tr>
			<td colspan="2" class="ViewRight">#Information#</td>
		
		</tr>
		</cfif>
		<tr>
			<td class="ViewLeft">Calendar</td>
			<td class="ViewRight">Dependant on Site<br/>
&raquo;<a href="##">
               Information about this calendar</a><br/>
&raquo;<a href="##">
               Other events on this calendar</a><br/>
&raquo;<a href="##">All events on the Master Calendar</a></td>
		</tr>
	</table></cfoutput>