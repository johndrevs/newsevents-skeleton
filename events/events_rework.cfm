
<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="getevents" datasource="#application.datasource_select#">
select eventid, shortdesc,longdesc,pubdate,pulldate,startdate,enddate,events_cost,events_link,ispublic,rsvp,rsvp_public,INFO_CLOB,userid,locationid,sponsor,contact,events_link,specificlocation
from CUNVMCS.events_tbl
where	events_tbl.eventid=#url.eventid#
</cfquery>

<cfquery name="getrelatedaudience" datasource="#application.datasource_select#">
SELECT      audienceid
FROM         CUNVMCS.events_audref 
where	eventid=#url.eventid#
</cfquery>

<cfset relatedaudience=valuelist(getrelatedaudience.audienceid)>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
</cfquery>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
</cfquery>

<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>Rework Event</h2>
<p>The following form will allow you to rework or edit an event on the News and Events system. Please be aware that by reworking this event you are changing it on every site that it will be published on. If you would like to control the placement of this event, please choose the 'control placement' button from the manage events menu.</p>
	<cfoutput>
		<form action="events_rework_preview.cfm" method="post" name="events_add" id="events_add">		
		<table>
		<tr>
			<td>Publish Date:
<a href="javascript:cal1.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
			<br/>
			<input type="Text" name="pubdate" value="#dateformat(getevents.pubdate, "mm/dd/yyyy")#">
			<br/>
			<br/>Pull Date:<a href="javascript:cal2.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
			<br/>
			<input type="text" name="pulldate" value="#dateformat(getevents.pulldate, "mm/dd/yyyy")#">
			<br/>
			<br/>Event Start Date and Time
<a href="javascript:cal3.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
			<br/>
			<input type="Text" name="startdate" value="#dateformat(getevents.startdate, "mm/dd/yyyy")# #timeformat(getevents.startdate, "H:mm:ss")#">
			<br/>
			<br/>Event End Date and Time:<a href="javascript:cal4.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
			<br/>
			<input type="text" name="enddate" value="#dateformat(getevents.enddate, "mm/dd/yyyy")# #timeformat(getevents.enddate, "H:mm:ss")#">
			<br/>
			<br/>Short Event Name:(#application.short# characters)
			<br/>
			<input type="text" name="shortdesc" size="50" maxlength="#application.short#" class="form" value="#getevents.shortdesc#">
			<br/>
			<br/>Long Event Name:(#application.long# characters)
			<br/>
			<input type="text" name="longdesc" size="50" maxlength="#application.long#" class="form" value="#getevents.longdesc#">
			<br/>
			<br/>Link <!--(will create event as a link to page)-->
			<br/>
			<input type="text" name="events_link" size="50" maxlength="#application.long#" class="form" value="#getevents.events_link#">
			<br/>
			<br/>Sponsor
			<br/>
			<input type="text" name="sponsor" size="50" maxlength="#application.long#" class="form" value="#getevents.sponsor#">
			<br/>
			<br/>Contact <!--(will create event as a link to page)-->
			<br/>
			<input type="text" name="contact" size="50" maxlength="#application.long#" class="form" value="#getevents.contact#">
			<br/>
			<br/>General Location:
			<br/>
			<select name="locationid">
				<option value="0">Please Choose</option>
				<cfloop query="getlocations">
					<option value="#locationid#" <cfif getevents.locationid eq locationid>selected</cfif>>#location_name#</option>
				</cfloop>
			</select>
			<br />
			<br />
			Specific Location:
			<br />
			<input type="text" name="specificlocation" size="50" maxlength="#application.long#" class="form" value="#getevents.specificlocation#">
			<br />
			<br />
			Is this event a public event?<br />
			yes <input type="radio" name="ispublic" value="1" <cfif getevents.ispublic gt 0> checked</cfif>> 
			no <input type="radio" name="ispublic" value="0"<cfif getevents.ispublic eq 0> checked</cfif>>
			<br />
			<br />
			Cost
			<br />
			<input type="text" name="events_cost" size="50" maxlength="100" class="cost" value="#getevents.events_cost#">
			<br />
			<br />
			Information:
			<br /> 
			<textarea cols="45" rows="15" name="information" class="form">#getevents.info_clob#</textarea>
			<br />
			<br /></td>
			<td valign="top">Select the audience for this event (multiple allowed):
			<br />
			<select name="audience" size="6" multiple>
				<cfloop query="getaudiences">
					<option value="#audienceid#" <cfif listcontains(relatedaudience,audienceid)>selected</cfif>>#title#</option>
				</cfloop>
			</select></td>
		</tr>
	</table>
		
			<input type="submit" value="preview" class="button">
			<input type="hidden" name="eventid" value="#getevents.eventid#">
			<input type="hidden" name="notify" value="#getevents.userid#">
			<input type="hidden" name="userid" value="#getevents.userid#">
		</form>	</cfoutput>
		
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

<cfinclude template="/newsevents/templates_new/footer.cfm">

