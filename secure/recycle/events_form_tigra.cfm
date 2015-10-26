
	<script language="JavaScript">
		
	// initial calendar settings structure
	var CAL_INIT1 = {
		'formname' : 'events_add',
		'controlname' : 'pubdate',
		'controlonchange':true,
		'nohour'			: true,
		'nominute'			: true,
		'nosecond'			: true,
		'dataformat' : 'm/d/Y',
		'nobasecontrolpanelstyle' : true
	};
	var CAL_INIT2 = {
		'formname' : 'events_add',
		'controlname' : 'pulldate',
		'controlonchange':true,

		'nohour'			: true,
		'nominute'			: true,
		'nosecond'			: true,
		'dataformat' : 'm/d/Y',
		'nobasecontrolpanelstyle' : true
	};
	var CAL_INIT3 = {
		'formname' : 'events_add',
		'controlname' : 'startdate',
		'controlonchange':true,

		'nohour'			: true,
		'nominute'			: true,
		'nosecond'			: true,
		'dataformat' : 'm/d/Y h:i a',
		'nobasecontrolpanelstyle' : true
	};
	var CAL_INIT4 = {
		'formname' : 'events_add',
		'controlname' : 'enddate',
		'controlonchange':true,

		'nohour'			: true,
		'nominute'			: true,
		'nosecond'			: true,
		'dataformat' : 'm/d/Y h:i a',
		'nobasecontrolpanelstyle' : true
	};
	
	
	
	
	
	</script>
<cfoutput>
	<form action="events_add_preview.cfm" name="events_add" method="post" id="events_add">
	
		<table cellpadding="0" cellspacing="0" border="0" summary="Event Submission Form" class="tabulargrey">
		
<tr><td colspan="2" style="border-bottom: 1px solid ##999;padding:3px;background-color:##CCC;font-weight:bold;">Event Information</th></tr>

<tr><td colspan="2"><span class="maroon">*</span> = required field</td></tr>
	
<tr><td><span class="maroon">*</span>Event Title:<br>(#application.short# characters max)</td><td><input type="text" name="shortdesc" size="50" maxlength="#application.short#" class="form"></td></tr>

<tr><td><span class="maroon">*</span>Publish Date:</td><td><script language="JavaScript">
					// calendar constructor
					// 1st param is structure defined above
					// 2nd param is template structure descrived in cal_tpl.js file linked in the header
					new calendar(CAL_INIT1, CAL_TPL);
				</script> (format: mm/dd/yyyy)</td></tr>
				
			
<tr><td><span class="maroon">*</span>Pull Date:</td><td><script language="JavaScript">
					// calendar constructor
					// 1st param is structure defined above
					// 2nd param is template structure descrived in cal_tpl.js file linked in the header
					new calendar(CAL_INIT2, CAL_TPL);
				</script> (format: mm/dd/yyyy)</td></tr>
				
				
<tr><td><span class="maroon">*</span>Event Start Date/Time:</td><td><script language="JavaScript">
					// calendar constructor
					// 1st param is structure defined above
					// 2nd param is template structure descrived in cal_tpl.js file linked in the header
					new calendar(CAL_INIT3, CAL_TPL);
				</script> <br>(format: mm/dd/yyyy 07:00 PM)<br />Check here if this is an all day event <input type="checkbox" name="allday" value="1"></td></tr>
				
				
<tr><td><span class="maroon">*</span>Event End Date/Time:</td><td><script language="JavaScript">
					// calendar constructor
					// 1st param is structure defined above
					// 2nd param is template structure descrived in cal_tpl.js file linked in the header
					new calendar(CAL_INIT4, CAL_TPL);
				</script><br>(format: mm/dd/yyyy 07:00 PM)</td></tr>
				
				
<tr><td>General Location:</td><td><select name="locationid">
					<option value="0">Please Choose</option>
					<cfloop query="getlocations">
						<option value="#locationid#">#location_name#</option>
					</cfloop>
				</select></td></tr>
				
				
<tr><td>Specific Location:</td><td><input type="text" name="specificlocation" size="50" maxlength="100" class="form"></td></tr>
<tr><td>Contact Info:</td><td><input type="text" name="contact" size="50" maxlength="100" class="form"></td></tr>				
				
<tr><td>Cost/Admission:</td><td><input type="text" name="cost" size="50" maxlength="100" class="cost"></td></tr>
				
				
<tr><td>Event Open To:</td><td><input type="text" name="invited" size="50" maxlength="100" class="form"></td></tr>
				
<tr><td colspan="2">Is this event a public event?&nbsp;&nbsp;<input type="radio" name="ispublic" value="1" checked>yes&nbsp;&nbsp;<input type="radio" name="ispublic" value="0" checked>no</td></tr>

<tr><td>Sponsor:</td><td><input type="text" name="sponsor" size="50" maxlength="100" class="form"></td></tr>				
<tr><td>Event Website:</td><td><input type="text" name="events_link" size="50" maxlength="100" class="form"><br>(ex: http://www.luc.edu)</td></tr>
				
				
<cfif variables.public eq 1><tr><td colspan="2">Would you like the event Website to be the detail page for your event?<!--(will create event as a link to page)-->&nbsp;&nbsp;<input type="radio" name="events_link_override" value="1">yes&nbsp;&nbsp;<input type="radio" name="events_link_override" value="0" checked>no</td></tr>

			
<tr><td>Registration Website:</td><td><input type="text" name="registration_link" size="50" maxlength="100" class="form"><br>(ex: http://www.luc.edu)</td></tr></cfif>

<!--for RSVP down the line-->
<!--<tr><td>Do you want to set up an RSVP list?</td><td>yes <input type="radio" name="rsvp" value="1" checked>
no <input type="radio" name="rsvp" value="0" checked></td></tr>
<tr><td>Would you like to make this RSVP list public?</td><td>yes <input type="radio" name="rsvpp" value="1" checked>
no <input type="radio" name="rsvpp" value="0" checked></td></tr>
-->


<tr><td colspan="2">Short Description: (#application.long# characters max)<br><textarea cols="50" rows="4" name="longdesc" maxlength="#application.long#" class="form"></textarea></td></tr>
				
<tr><td colspan="2">Event Description:<br><textarea cols="50" rows="8" name="information" class="form"></textarea></td></tr>



<tr><td colspan="2" style="border-bottom: 1px solid ##999;padding:3px;background-color:##CCC;font-weight:bold;">Calendar Placement Information</th></tr>	

<cfif variables.public eq 1><tr>

<cfif getpublish.recordcount gt 0>
<td>Publish Event to:</td><td>
					<select name="publish" size="5" multiple>
						<cfloop query="getpublish">
							<option value="#siteid#">#SITE_NAME# Calendar</option>
						</cfloop>
					</select></td>
					
<cfelse><td colspan="2">You do not currently have access to publish to any calendars</td></cfif>

</tr></cfif>
				
				
				
<cfif getpost.recordcount gt 0><tr>
					
<td>Post Event to:<br>All published events are displayed on the main University Calendar<br>(Ctrl+click for multiple)</td><td>
					<select name="post" size="5" multiple>
						<cfloop query="getpost">
							<option value="#siteid#">#SITE_NAME# calendar</option>
						</cfloop>
					</select></td>
<cfelse><td colspan="2">You do not currently have access to post to any calendars</td>				
				
</tr></cfif>


				
<tr><td>Event Audience:<br>(Ctrl+click for multiple)</td><td>
				<select name="audience" size="5" multiple>
					<cfloop query="getaudiences">
						<option value="#audienceid#">#title#</option>
					</cfloop>
				</select></td>
			</tr>
			
<tr><td colspan="2" align="right"><input type="submit" name="Submit" value="Preview Event" STYLE="border-color: ##B8A782; font-weight: bold; color: ##990033; sans-serif; border-width: 1px; background-color: ##FFFDE8; cursor: hand; margin: 5px;"></td></tr>			
		</table>



</form></cfoutput>




<script language="JavaScript">
// initialization block for all calendars on the page
// A_CALENDARS array contains references to each calendar instance
for (var n = 0; n < A_CALENDARS.length; n++) {
	A_CALENDARS[n].create();
}
</script>