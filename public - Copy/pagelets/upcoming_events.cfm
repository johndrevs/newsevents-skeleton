<!--- This pagelet relies upon the University News - Headlines site to have a site id of 41 --->
<cfset siteid=338>

<cfset month=datepart("m",now())>
<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#variables.siteid#
</cfquery>
<cfquery name="getevents" datasource="#application.datasource_select#" maxrows="#getnewssource.maxrows#">
select distinct events_tbl.eventid, shortdesc,pubdate,pulldate,startdate,enddate, EVENTS_LINK_OVERRIDE,events_link
from CUNVMCS.events_tbl, CUNVMCS.events_ref
		where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=#variables.siteid# and events_ref.events_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')
	
	order by startdate</cfquery>

<div class="comments">
<h4>Upcoming Events:</h4>
<ul>
<cfoutput query="getevents">
					<li>
			<cfif events_link_override eq 1><a href="#events_link#"><cfelse><a href="calendar_detail.cfm?eventid=#eventid#&siteid=#variables.siteid#&month=#variables.month#"></cfif><cfif shortdesc EQ 'Key Academic Date'><strong>#shortdesc#</strong><cfelse>#shortdesc#</cfif></a>-#dateformat(startdate,"mmm. d")#</li></cfoutput>

</ul>
<div align="right">...<a href="http://www.luc.edu/calendar/">More Events</a></div>
</div>