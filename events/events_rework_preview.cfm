<cfinclude template="/newsevents/templates/securityheader.cfm">


<cfquery name="getlocation" datasource="#application.datasource_select#">
		select location_name
		from CUNVMCS.locations
		where	locationid=#form.locationid#
	</cfquery>

<cfset temp = "#form.information#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset formatinformation= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset information="#formatinformation#">
<cfset pubdate="#form.pubdate#">
<cfset pulldate="#dateadd("h",23, form.pulldate)#">
<cfset startdate="#form.startdate#">
<cfset enddate="#form.enddate#">
<cfset longdesc="#form.longdesc#">
<cfset shortdesc="#form.shortdesc#">
<cfset events_link="#form.events_link#">
<cfset sponsor="#form.sponsor#">
<cfset contact="#form.contact#">
<cfset specificlocation="#form.specificlocation#">
<cfset locationid="#form.locationid#">
<cfset location_name="#getlocation.location_name#">
<cfset events_link="#form.events_link#">
<cfset ispublic="#form.ispublic#">
<!--for RSVP down the line-->
<!--- <cfset rsvp="#form.rsvp#">
<cfset rsvpp="#form.rsvpp#"> --->
<cfset rsvp="0">
<cfset rsvpp="0">
<cfset events_cost="#form.events_cost#">
<cfset audience="#form.audience#">


<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

		<h2>Preview Event</h2>
<p>The events that you reworked will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>

<cfinclude template="../templates/events_layout.cfm">


<cfoutput>
<form action="events_rework_action.cfm" method="post">

<input type="hidden" name="information" value="#replace(form.information, chr(34), "*", "ALL")#">
<input type="hidden" name="pubdate" value="#variables.pubdate#">
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
<input type="hidden" name="audience" value="#variables.audience#">
	<cfif isdefined("form.post")>	<input type="hidden" name="post" value="#variables.post#"></cfif>
	<cfif isdefined("form.publish")>	<input type="hidden" name="publish" value="#variables.publish#"></cfif>
<input type="hidden" name="eventid" value="#form.eventid#"><input type="hidden" name="notify" value="#form.userid#">

			

<input type="submit" value="upload to site" class="button"> <input type="button" value="back" onClick="history.go(-1)" class="button"></form>
</cfoutput>


<cfinclude template="/newsevents/templates_new/footer.cfm">