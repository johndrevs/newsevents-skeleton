<!--- Sets default skin as site none --->
<cfif isDefined("form.skin")>
  <cfset url.skin = form.skin>
  <cfelseif isDefined("url.skin") IS 0>
  <cfset url.skin = 'default'>
</cfif>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="styles/newsevents.css" rel="stylesheet" type="text/css">


<cfif parameterexists(url.skin) and url.skin neq 'none'>
  <cfinclude template="skins/#url.skin#/top.cfm">
  <cfelse>
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
<cfif isdefined("calendarlist_filter")>AND siteid in (#calendarlist_filter#)</cfif>
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

<!---<cfif parameterexists(url.skin) and url.skin eq 'il'><cfinclude template="/newsevents/public/skins/insideloyolaweekly/top.cfm"><div class="yui-g" id="leads" style="font-size: 13px; padding:5px 15px; font-family:Georgia, Times, serif;">	<cfelseif parameterexists(url.skin) and url.skin eq 'focus'><cfinclude template="/newsevents/public/skins/LUFocus/ssi/top.cfm"><div id="contenttext"><h1> Submit an Event</h1>
<p>Please use the form below to submit an event item to the <em>LU Focus</em> student calendar. If the event meets basic guidelines, it will be added to an upcoming publication. Use of this form will allow other University departments to view/post your event on their respective sites as well. Please fill in ALL fields to ensure accuracy and proper distribution. </p>
<p>If you have editorial questions or comments about the student calendar, please contact Katie Stasiak at <a href="mailto:kstasia@luc.edu">kstasia@luc.edu</a> or 312.915.7080.</p>

<p>All events sponsored by student organizations must be approved by the Department of Student Activities and Greek Affairs before being added to the student calendar. For more information, contact Kimberly Moore at <a href="mailto:kmoore5@luc.edu">kmoore5@luc.edu</a> or 773.508.3924.</p>
<cfelse><cfinclude template="/newsevents/public/ssi/header_61807.cfm">
<div id="content_text">
</cfif>--->



<div id="calendar_submit">
<h2>Submit an Event</h2>
<p>Please use the form below to submit an event to Loyola University Chicago's Web calendar. If the event meets <a href="calendar_guidelines.cfm">the basic guidelines</a>, it will be added to the university calendar within five working days. Use of this form will allow other university departments to view/post your event on their respective sites.
Please fill in ALL fields to ensure accuracy and proper distribution. Loyola's Web calendar is available for public viewing on the Internet. </p>

<p>For questions or comments, please contact University Marketing and Communications (Web Team), via e-mail at <a href="mailto:umc@luc.edu">umc@luc.edu</a>.</p>


<cfset public=0>
<cfinclude template="../secure/templates/events_add_set.cfm">
<cfoutput><form action="events_add_preview.cfm?skin=#url.skin#" name="events_add" method="post" id="events_add" class="form-horizontal"></cfoutput>
<cfinclude template="../secure/templates/events_form.cfm">
</form>



<cfif parameterexists(url.skin) and url.skin neq 'none'>
  <cfinclude template="skins/#url.skin#/bottom.cfm">
  <cfelse>
</cfif>