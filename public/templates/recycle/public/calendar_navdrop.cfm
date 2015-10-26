<script language="JavaScript">
<!--
function leapto(form) {
var myindex=form.dest.selectedIndex
parent.top.location.href=(form.dest.options[myindex].value);
}
//-->
</script>

<cfquery datasource="#application.datasource_select#" name="getsitelist">
SELECT siteid, site_name
FROM CUNVMCS.sites
</cfquery>

<cfquery datasource="#application.datasource_select#" name="getaudiencelist">
SELECT audienceid,title
FROM CUNVMCS.audiences
</cfquery>
 <form>
Calendars
	<select name="dest" size="1" onChange="leapto(this.form)">
		<option value="#" selected="selected">Other Calendars...</option>
		<cfoutput>
			<option value="#variables.location#?view=#url.view#&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=0&audience=#url.audience#" <cfif url.siteid is 0>selected</cfif>>Master Calendar</option>
		</cfoutput>
		<cfoutput query="getsitelist">
			<option value="#variables.location#?view=#url.view#&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#getsitelist.siteid#&audience=#url.audience#" <cfif url.siteid is getsitelist.siteid>selected</cfif>>#site_name#</option>
		</cfoutput>
	</select>
</form>

<form>
Audiences
	<select name="dest" size="1" onChange="leapto(this.form)">
		<cfoutput>
			<option value="#variables.location#?view=#url.view#&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=0" <cfif url.audience is 0>selected</cfif>>All audiences</option>
		</cfoutput>
		<cfoutput query="getaudiencelist">
			<option value="#variables.location#?view=#url.view#&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#getaudiencelist.audienceid#" <cfif url.audience is getaudiencelist.audienceid>selected</cfif>>#title#</option>
		</cfoutput>
	</select>
</form>

<form>
Search for event
<input size="8" type="text" name="SText">&nbsp;<input type="Submit" value="Search">
</form>
To submit an event for posting on this calendar please <a href="events_add.cfm">click here</a> 