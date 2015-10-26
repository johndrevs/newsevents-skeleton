<cfquery name="getevents" datasource="#application.datasource_select#">
select to_char(startdate, 'yyyy-mm') x, events_tbl.eventid, shortdesc, startdate, enddate, locationid, specificlocation, contact,contactinfo, events_cost, invited, ispublic, sponsor, events_link, events_link_override

from CUNVMCS.events_tbl, CUNVMCS.events_ref

where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and (events_ref.siteid=142 or events_ref.siteid=139 or events_ref.siteid=140 or events_ref.siteid=141) and events_ref.events_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') 

<cfif parameterexists(url.siteid)>and  events_ref.siteid=#url.siteid#</cfif>

group by  events_tbl.eventid, shortdesc, enddate, locationid, specificlocation, contact, contactinfo, events_cost, invited, ispublic, sponsor, events_link, events_link_override,to_char(startdate, 'mm'),startdate

order by x,startdate 
</cfquery>

<cfif getevents.recordcount gt 1>

</cfif>

<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Loyola University Chicago: University Calendar</title>
<meta name="keywords" content="Loyola University Chicago"/>
<meta name="description" content="Loyola University Chicago"/>
<link rel="Stylesheet" href="artsalive.css" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0">
	<table border="0" cellpadding="0" cellspacing="0" class="textable">
		<tr>
			<td width="450" valign="top" class="textable">
			
			<p class="text">Celebrate the arts at Loyola University Chicago! Join us for exciting events featuring professional and student artists, musicians and actors.</p>

<cfif parameterexists(url.siteid)>

<cfquery name="getsiteinfo" datasource="#application.datasource_select#">
SELECT      site_name, uri, description, maxrows
FROM         CUNVMCS.sites 
where siteid=#url.siteid#
</cfquery>
				<cfoutput query="getsiteinfo">
					<span class="calendar">#replace(site_name, "Arts Alive-", "")#</span><br/>
				</cfoutput>
</cfif>

	<cfif getevents.recordcount lt 1>
		<p class="text">There are no events currently listed for this calendar</p>
	<cfelse>
	
	<cfoutput query="getevents" group="x">
			<span class="date">#dateformat(startdate,"mmmm yyyy")#</span>
		<br/>
		<br/>
		<cfoutput><cfquery name="getlocation" datasource="#application.datasource_select#" maxrows="1">
select location_name,location_link
from cunvmcs.locations
where locationid=#getevents.locationid#
</cfquery>
		<cfquery name="getevent3" datasource="#application.datasource_select#" maxrows="15">
		SELECT info_clob
		FROM CUNVMCS.events_tbl
		WHERE  eventid=#getevents.eventid#
		</cfquery>
		
						<p class="text">
						<span class="heading">#getevents.shortdesc#</span><br/>
						<span class="text">							
						<cfif getevents.locationid neq ''>
						#getlocation.location_name#
						</cfif>
						
						<cfif getevents.specificlocation neq ''>
						#getevents.specificlocation#
						</cfif>
						<br/>
						
						<cfif timeformat(getevents.startdate,"h:mm:tt") EQ '1:00:am'>
						#dateformat(getevents.startdate,"dddd mmmm d, yyyy")#								
						<cfif enddate is not '' and datecompare(getevents.startdate,getevents.enddate,"d") NEQ 0>
						 to #dateformat(getevents.enddate,"dddd mmmm d, yyyy")#
						</cfif>
						<cfelseif getevents.enddate IS ''>#dateformat(getevents.startdate,"dddd mmmm d, yyyy")#  #timeformat(getevents.startdate,"h:mm TT")#						
						<cfelseif datecompare(getevents.startdate,getevents.enddate,"d") NEQ 0>#dateformat(getevents.startdate,"dddd mmmm d, yyyy")# at #timeformat(getevents.startdate,"h:mm TT")#
							<br/>to
							<br/>#dateformat(getevents.enddate,"dddd mmmm d, yyyy")# at #timeformat(getevents.enddate,"h:mm TT")#						
						<cfelseif datecompare(getevents.startdate,getevents.enddate,"m") EQ 0  and parameterexists(form.enddateno) neq 1>#dateformat(getevents.startdate,"dddd mmmm d, yyyy")# from #timeformat(getevents.startdate,"h:mm TT")# - #timeformat(getevents.enddate,"h:mm tt")#
						<cfelse>
						</cfif>
						
						<cfif getevent3.info_clob neq ''><cfset temp = "#getevent3.info_clob#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
						<p class="text">#variables.FormatBody#</p>
						</cfif>
						
						<table cellpadding="0" cellspacing="0" border="0" id="detail_table">								
							<cfif getevents.contact is not ''>
								<tr>
									<td class="label">CONTACT:</td>
									<td>#getevents.contact# #getevents.contactinfo#</td>
								</tr>
							</cfif>
							<cfif getevents.events_cost is not ''>
								<tr>
									<td class="label">ADMISSION:</td>
									<td>#getevents.events_cost#</td>
								</tr>
							</cfif>
							<tr>
								<td class="label">OPEN TO:</td>
								<td>
								<cfif getevents.invited is not ''>#invited#<br/></cfif>
								<cfif getevents.ispublic is 1>This event has been marked as open to the public.								
								<cfelseif getevents.ispublic is 0>This event has not been marked as open to the public.
								</cfif></td>
							</tr>								
							<cfif getevents.sponsor is not ''>
								<tr>
									<td class="label">SPONSOR:</td>
									<td>#getevents.sponsor#</td>
								</tr>
							</cfif>
							<cfif getevents.events_link is not ''>
								<tr>
									<td class="label">WEBSITE:</td>
									<td><a href="#getevents.events_link#">#getevents.events_link#</a>										
									<cfif isDefined("events_link_override") and getevents.events_link_override EQ 1><br/>
(This link will serve as the primary page for the event)
									<cfelse>
									</cfif></td>
								</tr>
							</cfif>
						</table></span></p>
					</cfoutput>
				</cfoutput>
			</cfif></td>
		</tr>
		<tr>
			<td align="right"><br /><br /><img src="images/logo.gif" alt="" width="216" height="127" border="0"></td>
		</tr>
	</table>
	<div class="sidebarnav"><font color="#990000">Search    events by:
		<br/></font> <a href="index.cfm">All Arts Alive Events</a>
		<br/><a href="index.cfm?siteid=140">Fine Arts</a>
		<br/><a href="index.cfm?siteid=141">Crown Gallery</a>
		<br/><a href="index.cfm?siteid=142">Music</a>
		<br/><a href="index.cfm?siteid=139">Theatre</a>
		<br/>
		<br/>
		<br/><font color="#990000">Department Links:
		<br/></font> <a href="http://www.luc.edu/finearts/">Fine Arts</a>
		<br/><a href="http://www.luc.edu/music/">Music</a>
		<br/><a href="http://www.luc.edu/theatre/">Theatre</a>
		<br/><a href="http://www.luc.edu/finearts/gallery_shows.shtml">Crown Gallery</a>
	</div>
</body>
</html>
