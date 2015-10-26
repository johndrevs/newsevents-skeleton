<cftry>
<cfquery name="getevents" datasource="#application.datasource_select#">
select to_char(startdate, 'yyyy-mm') x, events_tbl.eventid, shortdesc, startdate, enddate, locationid, specificlocation, contact,contactinfo, events_cost, invited, ispublic, sponsor, events_link, events_link_override

from CUNVMCS.events_tbl, CUNVMCS.events_ref

where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and (events_ref.siteid=1078) and events_ref.events_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') 


group by  events_tbl.eventid, shortdesc, enddate, locationid, specificlocation, contact, contactinfo, events_cost, invited, ispublic, sponsor, events_link, events_link_override,to_char(startdate, 'mm'),startdate

order by x,startdate 
</cfquery>
<cfinclude template="/newsevents/public/ssi/header_61807.cfm"><h2>Follow Our Leaders</h2>
									
										
									<div id="content_text">

<p>Loyola's senior administrators, including President Michael J. Garanzini, S.J., and his Cabinet, speak at a variety of events throughout the academic year. The following is a list of events that are open to the University community and offer an opportunity for you to engage with the University administration on issues that matter to you.   </p>


<cfif parameterexists(url.siteid)>

<cfquery name="getsiteinfo" datasource="#application.datasource_select#">
SELECT      site_name, uri, description, maxrows
FROM         CUNVMCS.sites 
where siteid=#url.siteid#
</cfquery>
				
</cfif>

	<cfif getevents.recordcount lt 1>
		<p class="text">There are no events currently listed for this calendar</p>
	<cfelse>
	
	<cfoutput query="getevents" group="x">
			<h2>#dateformat(startdate,"mmmm yyyy")#</h2>
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
						<strong>#getevents.shortdesc#</strong><br/>
						<span class="text">							
												
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

						<br/>

						<cfif getevents.locationid neq ''>
						#getlocation.location_name#
						</cfif>
						
						<cfif getevents.specificlocation neq ''>
						#getevents.specificlocation#
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
						<hr>
					</cfoutput>
				</cfoutput>
			</cfif>
</div></div></div><cfinclude template="/newsevents/public/ssi/footer_61807.cfm">
<cfcatch>An error has occurred in the application. Please <a href="http://www.luc.edu/calendar">click here</a> to access the University Calendar in its entirety.
</cfcatch>
</cftry>