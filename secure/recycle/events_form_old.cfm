<cfoutput>
	<form action="events_add_preview.cfm" method="post" name="events_add" id="events_add">
		<table <cfif variables.public eq 1>class="tabulargrey"</cfif>>
			<tr>
				<td>Publish Date*:
<a href="javascript:cal1.popup();"><img src="/newsevents/images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
				<input type="Text" name="pubdate"><br/><br/>
Pull Date*:<a href="javascript:cal2.popup();"><img src="/newsevents/images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
				<input type="text" name="pulldate"><br/><br/>
Event Start Date and Time*:
<a href="javascript:cal3.popup();"><img src="/newsevents/images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
				<input type="Text" name="startdate"><br/><br/>
Event End Date and Time:<a href="javascript:cal4.popup();"><img src="/newsevents/images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
				<input type="text" name="enddate"><br/><br/>
Short Event Name*:(#application.short# characters)<br/>
				<input type="text" name="shortdesc" size="50" maxlength="#application.short#" class="form"><br/><br/>
Long Event Name:(#application.long# characters)<br/>
				<input type="text" name="longdesc" size="50" maxlength="#application.long#" class="form"><br/><br/>
Link <br/>
				<input type="text" name="events_link" size="50" maxlength="100" class="form"><br/><br/>
Would you like this link be the primary page for your event?<!--(will create event as a link to page)--><br/>
		yes	<input type="radio" name="events_link_override" value="1"> no <input type="radio" name="events_link_override" value="0" checked><br/><br/>
Sponsor<br/>
				<input type="text" name="sponsor" size="50" maxlength="100" class="form"><br/><br/>
Contact <!--(will create event as a link to page)--><br/>
				<input type="text" name="contact" size="50" maxlength="100" class="form"><br/><br/>
General Location:<br/>
				<select name="locationid">
					<option value="0">Please Choose</option>
					<cfloop query="getlocations">
						<option value="#locationid#">#location_name#</option>
					</cfloop>
				</select><br/><br/>
Specific Location<br/>
				<input type="text" name="specificlocation" size="50" maxlength="100" class="form"><br/><br/>
Is this event a public event?<br/>
yes
				<input type="radio" name="ispublic" value="1" checked>no
				<input type="radio" name="ispublic" value="0" checked><br/><br/>
<!--for RSVP down the line-->
<!--Do you want to set up an RSVP list?<br/>
yes
				<input type="radio" name="rsvp" value="1" checked>no
				<input type="radio" name="rsvp" value="0" checked><br/>
<br/>
Would you like to make this RSVP list public?<br/>
yes
				<input type="radio" name="rsvpp" value="1" checked>no
				<input type="radio" name="rsvpp" value="0" checked><br/>
<br/>
-->

Cost<br/>
				<input type="text" name="cost" size="50" maxlength="100" class="cost"><br/><br/>
Information:<br/>
				<textarea cols="45" rows="15" name="information" class="form"></textarea><br/><br/>
</td>
				<td valign="top">					
				<cfif variables.public eq 1><cfif getpublish.recordcount gt 0>					
				Publish Event to:<br/>
					<select name="publish" size="3" multiple>
						<cfloop query="getpublish">
							<option value="#siteid#">#SITE_NAME# Calendar</option>
						</cfloop>
					</select><br/><br/>
				<cfelse>
You do not currently have access to publish to any calendars<br/><br/>
				</cfif></cfif>
				
				<cfif getpost.recordcount gt 0>					
				Post Event to:<br/>
					<select name="post" size="3" multiple>
						<cfloop query="getpost">
							<option value="#siteid#">#SITE_NAME# calendar</option>
						</cfloop>
					</select><br/><br/>
				<cfelse>
You do not currently have access to post to any calendars<br/><br/>
				</cfif>
				
				
				Select the audience for this event (multiple allowed):<br/>
				<select name="audience" size="3" multiple>
					<cfloop query="getaudiences">
						<option value="#audienceid#">#title#</option>
					</cfloop>
				</select><br/><br/></td>
			</tr>
		</table>

			<input type="submit" value="preview" class="button">
	</form></cfoutput>
	<script language="JavaScript">
		<!-- // create calendar object(s) just after form tag closed
			 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
			 // note: you can have as many calendar objects as you need for your application
			var cal1 = new calendar2(document.forms['events_add'].elements['pubdate']);
			cal1.year_scroll = true;
			cal1.time_comp = false;
			var cal2 = new calendar2(document.forms['events_add'].elements['pulldate']);
			cal2.year_scroll = true;
			cal2.time_comp = false;
			var cal3 = new calendar2(document.forms['events_add'].elements['startdate']);
			cal3.year_scroll = true;
			cal3.time_comp = true;
			var cal4 = new calendar2(document.forms['events_add'].elements['enddate']);
			cal4.year_scroll = true;
			cal4.time_comp = true;
			
		//-->
		</script>