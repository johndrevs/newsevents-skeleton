<cfif isDefined("form.skin")>
  <cfset url.skin = form.skin>
  <cfelseif isDefined("url.skin") IS 0>
  <cfset url.skin = 'default'>
</cfif>

<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT site_name, siteid
FROM CUNVMCS.sites
</cfquery>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
</cfquery>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
</cfquery>




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

<div id="calendar_detail">



<p>The event that you entered will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>

<cfinclude template="../secure/templates/events_add_set.cfm">
<cfinclude template="../secure/templates/events_layout.cfm">
<cfset public=1>
<cfinclude template="../secure/templates/events_add_form.cfm">
	
<cfif parameterexists(url.skin) and url.skin neq 'none'>
  <cfinclude template="skins/#url.skin#/bottom.cfm">
  <cfelse>
</cfif>