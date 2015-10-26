<cfoutput>
		<form action="/newsevents/events/events_add_action.cfm" method="post">
			<input type="hidden" name="pubdate" value="#variables.pubdate#">
			<input type="hidden" name="information" value="#replace(form.information, chr(34), "*", "ALL")#">
			<input type="hidden" name="pulldate" value="#variables.pulldate#">
			<input type="hidden" name="startdate" value="#variables.startdate#">
			<input type="hidden" name="enddate" value="#variables.enddate#">
			<input type="hidden" name="longdesc" value="#variables.longdesc#">
			<input type="hidden" name="shortdesc" value="#variables.shortdesc#">
			<input type="hidden" name="events_link" value="#variables.events_link#">
			<input type="hidden" name="sponsor" value="#variables.sponsor#">
			<input type="hidden" name="contact" value="#variables.contact#">
			<input type="hidden" name="specificlocation" value="#variables.specificlocation#">
			<input type="hidden" name="locationid" value="#variables.locationid#">
			<input type="hidden" name="ispublic" value="#variables.ispublic#">
			<input type="hidden" name="rsvp" value="#variables.rsvp#">
			<input type="hidden" name="rsvpp" value="#variables.rsvpp#">
			<input type="hidden" name="events_cost" value="#variables.events_cost#">				
			<cfif isdefined("form.post")>
				<input type="hidden" name="post" value="#variables.post#">
			</cfif>
			<cfif isdefined("form.publish")>
				<input type="hidden" name="publish" value="#variables.publish#">
			</cfif>
			<cfif isdefined("form.audience")>
				<input type="hidden" name="audience" value="#variables.audience#">
			</cfif>
			<cfif parameterexists(variables.public) and variables.public EQ 1>
				<input type="hidden" name="userid" value="85">
				<input type="hidden" name="location" value="events&iacute;_confirmation.cfm">
			<cfelse>
				<input type="hidden" name="userid" value="#session.userid#">
				<input type="hidden" name="location" value="index.cfm">
			</cfif>
			<input type="submit" value="upload to site" class="button">
			<input type="button" value="back" onClick="history.go(-1)" class="button">
		</form>
</cfoutput>