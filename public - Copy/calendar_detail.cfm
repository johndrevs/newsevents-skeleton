<cfparam name="month" default="#DatePart('m', Now())#">
<cfparam name="year" default="#DatePart('yyyy', Now())#">
<cfparam name="week" default="#DatePart('ww', Now())#">


<!--- Sets default calendar as site id=0 --->
<cfif isDefined("form.siteid")>
	<cfset url.siteid = form.siteid>
<cfelseif isDefined("url.siteid") IS 0>
	<cfset url.siteid = 0>
</cfif>

<!--- Sets default view for audience is none selected 
<cfif isDefined("form.audience")>
	<cfset url.audience = form.audience>
<cfelseif isDefined("url.audience") IS 0>--->
	<cfset url.audience = 0>
<!---</cfif>--->
<!--- If no variable for date exists, set current date = to today --->
<cfif isDefined("url.month") IS 0>
	<cfset url.month = "#DatePart('m', Now())#">
</cfif>

<cfif isDefined("url.year") IS 0>
	<cfset url.year = "#DatePart('yyyy', Now())#">
</cfif>


<cfif isDefined("url.day") IS 0>
	<cfset url.day = "#DatePart('d', Now())#">
<cfelseif url.day gt 27 and url.month is 2>
<cfset url.day = 27>
<cfelseif url.day is 31>
<cfset url.day = 30>

</cfif>

<cfif isDefined("url.week") IS 0>
	<cfset url.week = "#DatePart('ww', Now())#">
</cfif>

<cfif isDefined("url.range") IS 0>
	<cfset url.range = 'ww'>
</cfif>

<!--- Sets Default view --->
<cfif isDefined("url.view") IS 0>
	<cfset url.view = 'ww'>
</cfif>

<!--- Sets default skin as site none --->
<cfif isDefined("form.skin")>
	<cfset url.skin = form.skin>
<cfelseif isDefined("url.skin") IS 0>
	<cfset url.skin = 'default'>

</cfif>

<!--- query event information based on url.eventid --->
<cftry><cfquery name="getevents" datasource="#application.datasource_select#" maxrows=1>
SELECT 
  EVE.EVENTID, EVE.USERID, 
  EVE.CREATED, EVE.PUBDATE, EVE.STARTDATE, 
  EVE.ENDDATE, EVE.PULLDATE, EVE.SHORTDESC, 
  EVE.LONGDESC,  EVE.lastmod, EVE.INFO_CLOB as information, EVE.EVENTS_LINK,  EVE.EVENTS_LINK_OVERRIDE,
  EVE.LOCATIONID, EVE.SPECIFICLOCATION, EVE.SPONSOR, 
  EVE.CONTACT,EVE.CONTACTINFO, EVE.CREATOR, EVE.RSVP_PUBLIC, 
  EVE.RSVP, EVE.EVENTS_COST, EVE.ISPUBLIC, REGISTRATION_LINK,INVITED,EVE.INFO_CLOB,Eve.events_cost as cost
FROM 

  CUNVMCS.EVENTS_TBL EVE
WHERE EVE.eventid=#url.eventid#</cfquery>
<cfcatch>
There is no event indicated in your request. Please return to the <a href="http://www.luc.edu/calendar">calendar</a> and choose an event.<cfoutput>#cfcatch.message#</cfoutput>
<cfabort>
</cfcatch>
</cftry>
<cfquery name="getlocation" datasource="#application.datasource_select#" maxrows=1>
select location_name,location_link
from cunvmcs.locations
where locationid=#getevents.locationid#</cfquery>
	
<!--- Set event detail information for display in event layout --->
<cfset temp = "#getevents.info_clob#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset geteventsatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset information="#geteventsatBody#">
<cfset pubdate="#getevents.pubdate#">
<cfset pulldate="#getevents.pulldate#">
<cfset startdate="#getevents.startdate#">
<cfset enddate="#getevents.enddate#">
<cfset longdesc="#getevents.longdesc#">
<cfset shortdesc="#getevents.shortdesc#">
<cfset sponsor="#getevents.sponsor#">
<cfset contact="#getevents.contact#">
<cfset contactinfo="#getevents.contactinfo#">
<cfset specificlocation="#getevents.specificlocation#">
<cfset locationid="#getevents.locationid#">
<cfset location_name="#getlocation.location_name#">
<cfset location_link="#getlocation.location_link#">
<cfset events_link="#getevents.events_link#">
<cfset events_link_override="#getevents.events_link_override#">
<cfset ispublic="#getevents.ispublic#">
<cfset invited="#getevents.invited#">
<cfset registration_link="#getevents.registration_link#">
<!--- <!--for RSVP down the line-->
<cfset rsvp="#getevents.rsvp#"> 
<cfset rsvpp="#getevents.rsvpp#"> --->
<cfset rsvp="0">
<cfset rsvpp="0">
<cfset events_cost="#getevents.events_cost#">
<cfset audience="1">


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

  <cfif url.siteid EQ 0>
    <h2 class="unical">University Calendar</h2>
    <ul id="submitevent">
      <li><a href="calendar_submit.cfm"> Submit an Event</a> </li>
    </ul>
    <cfelse>
    <!--- Query for site name --->
    <cfquery datasource="#application.datasource_select#" name="getcalendar">
SELECT site_name
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>
    <h2 class="indical"><cfoutput> #getcalendar.site_name# Calendar </cfoutput> </h2>
    <ul id="submitevent">
      <li><a href="calendar.cfm">View Full University Calendar</a></li>
      <li><a href="calendar_submit.cfm"> Submit an Event</a> </li>
    </ul>
  </cfif>



<!-- end header row -->

			
<cfif parameterexists(url.skin) and url.skin eq 'gsb'>
<cfinclude template="/newsevents/secure/templates/events_layout_gsb.cfm"><cfelse>
<cfinclude template="/newsevents/secure/templates/events_add_set.cfm">
<cfinclude template="/newsevents/secure/templates/events_layout.cfm"></cfif>
<cfoutput>
<ul id="eventdetail_links">
<!---<li><a href="rfc2445.ics">Add to your calendar</a></li>--->
	<li><a href="calendar.cfm?month=#url.month#&year=#url.year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">Back to Calendar</a></li>
<li><a href="calendar_submit.cfm?month=#url.month#&year=#url.year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">Submit Event</a></li>
</cfoutput></ul>
<!-- bottom link row -->

<!-- end calendar table output -->

<cfif parameterexists(url.skin) and url.skin neq 'none'>
  <cfinclude template="skins/#url.skin#/bottom.cfm">
  <cfelse>
</cfif>

