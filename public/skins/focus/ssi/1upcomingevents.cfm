<cfoutput><p><strong>#dateformat(variables.now, "mmm. yy")#:</strong><br></cfoutput>
<a href="http://loyolaramblers.cstv.com/calendar/events/" target="_blank">Complete List of 
Athletic Events</a></p>




<cfset url.year = "#DatePart('yyyy', Now())#">
<cfset url.month = "#DatePart('m', Now())#">
<cfset url.day = "#DatePart('d', Now())#">


<cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
<!-- end header row -->

	
	
		<cfset currentdate = daterangebeg>

	
<!--- Loop through until the number of days in the month is reached.  --->
	

<!--- Loop through each day of the week. --->
		<cfloop from="1" to="9" index="LoopDay">
		<!--- If ThisDay is still 0, check to see if the current day of the week in the loop --->
		<!--- matches the day of the week for the first day of the month. --->
		<!--- If the values match, set ThisDay to 1. --->
		<!--- Otherwise, the value will remain 0 until the correct day of the week is found. --->
		
		<!--- If the ThisDay value is still 0, or it is greater than the number of days in the month, --->
		<!--- display nothing in the column. --->
		<!--- Otherwise, display the day of the month and increment the value. --->

				<cfset url.day = "#DatePart('d', currentdate)#">
				<cfset url.month = "#DatePart('m', currentdate)#">
				<cfset url.year = "#DatePart('yyyy', currentdate)#">
				
<!--- query for events based on current date --->	
<cfquery name="getevent" datasource="#application.datasource_select#" maxrows=200>
SELECT distinct events_tbl.eventID, shortdesc,  startdate,enddate, events_link_override,events_link
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE  ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))

	
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.isactive=1 and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
and events_ref.siteid in (#variables.upcomingevents_id#)
and events_ref.events_ref_level =2)
order by events_tbl.shortdesc</cfquery>

				<!--- displays td with date and event query information --->
				
					
			<cfif getevent.recordcount GT 0><p>		<cfoutput><strong><a href="calendar.cfm?view=d&month=#url.Month#&year=#url.Year#&day=#url.day#&siteid=#variables.upcomingevents_id#">#dateformat(currentdate,"m/d")#</a></cfoutput>:</strong><br/>
					<cfoutput query="getevent">
		* <cfif events_link_override eq 1><a href="#events_link#"><cfelse><a href="/newsevents/public/calendar_detail.cfm?eventid=#eventid#&siteid=#variables.upcomingevents_id#&month=#url.month#&year=#url.year#&day=#url.day#"></cfif><cfif shortdesc EQ 'Key Academic Date'><strong>#shortdesc#</strong><cfelse>#shortdesc#</cfif></a><br />
	</cfoutput></p></cfif>
					
					
		<!--- Increment to the next day	 --->
		<cfset currentdate = DateAdd("d", 1, currentdate)>
		</cfloop>
