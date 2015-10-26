<!--- Sets default skin as site none --->
<cfif isDefined("form.skin")>
  <cfset url.skin = form.skin>
  <cfelseif isDefined("url.skin") IS 0>
  <cfset url.skin = 'default'>
</cfif>
<cfquery name="getevents" datasource="#application.datasource_select#">
select eventid, shortdesc,longdesc,pubdate,pulldate,startdate,enddate,events_cost as cost,events_link,events_link_override,ispublic,rsvp,rsvp_public,INFO_CLOB as information,userid,locationid,sponsor,contact,contactinfo,events_link,specificlocation,invited,registration_link
from CUNVMCS.events_tbl
where	0=1
</cfquery>
<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT site_name, siteid, ispublic
FROM CUNVMCS.sites
where ispublic=1 and calendar=1 and isactive=1
order by site_name

</cfquery>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
order by title
</cfquery>
<cfquery name="getrelatedaudience" datasource="#application.datasource_select#">
SELECT      audienceid
FROM         CUNVMCS.events_audref 
where	0=1
</cfquery>

<cfset relatedaudience=valuelist(getrelatedaudience.audienceid)>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
order by location_name
</cfquery>





<div id="calendar_submit">
<h2>Submit an Event</h2>
<p>Please use the form below to submit an event to Loyola University Chicago's Web calendar. If the event meets <a href="calendar_guidelines.cfm">the basic guidelines</a>, it will be added to the university calendar within five working days. Use of this form will allow other university departments to view/post your event on their respective sites.
Please fill in ALL fields to ensure accuracy and proper distribution. Loyola's Web calendar is available for public viewing on the Internet. </p>

<p>For questions or comments, please contact Lenzlee Ruiz, University Marketing and Communications (Web Team), via e-mail at <a href="mailto:lruiz1@luc.edu">lruiz1@luc.edu</a>, or by phone at 312-915-8680.</p>


<cfset public=0>
<cfinclude template="../secure/templates/events_add_set.cfm">
<form action="events_add_preview.cfm" name="events_add" method="post" id="events_add" class="form-horizontal">
<cfinclude template="../secure/templates/events_form.cfm">
<input name="audience" type="hidden" value="21,22,23,24,24,41,42" />
</form>




<cfif parameterexists(url.skin) and url.skin neq 'none'>
  <cfinclude template="skins/#url.skin#/bottom.cfm">
  <cfelse>
</cfif>