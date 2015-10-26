<cfset loopfrom=1>
            <cfset loopto=7>
            <cfparam name="url.month" default="#DatePart('m', now)#">
            <cfparam name="url.year" default="#DatePart('yyyy', now)#">
            <cfparam name="url.week" default="#DatePart('ww', now)#">
            <cfparam name="url.day" default="#DatePart('d', now)#">
            <cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
          
            <cfset daterangebeg=#createodbcdatetime(daterangebeg)#>
           
            <cfset currentdate = daterangebeg>
            <cfset currentdate2 = daterangebeg>
            
            <cfset currentdate3 = CreateDate(year, month, day)>
            <cfset site_id=#ue_id#>
						
							<h2>Student calendar</h2>
							 <ul class="tab-box"> <cfloop index="LoopDay" from="#loopfrom#" to="#loopto#">
                  <cfset url.day = "#DatePart('d', currentdate)#">
                  <cfset url.month = "#DatePart('m', currentdate)#">
                  <cfset url.year = "#DatePart('yyyy', currentdate)#">
                  <cfoutput>
                    <li><a href="##f-#dateformat(currentdate,"d")#"<cfif datecompare(currentdate,daterangebeg,"d") EQ 0> class="active tab"><cfelse>class="tab"></cfif><span>#dateformat(currentdate,"ddd")#</span>
                      #dateformat(currentdate,"d")#</a></li>
                  </cfoutput>
                  <cfset currentdate = DateAdd("d", 1, currentdate)>
                </cfloop>
                           
								
								<li class="next"><a href="#">next</a></li>
							</ul>
				<cfloop index="LoopDay" from="#loopfrom#" to="#loopto#">
                  <cfset url.day = "#DatePart('d', currentdate2)#">
                  <cfset url.month = "#DatePart('m', currentdate2)#">
                  <cfset url.year = "#DatePart('yyyy', currentdate2)#">
                 <cfquery datasource="#application.datasource_select#" name="getevent2">
SELECT distinct events_tbl.eventID, shortdesc,  startdate, events_link_override,events_link,enddate
FROM CUNVMCS.events_tbl
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate2,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate2,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate2,"yyyy-mm-dd")#' and enddate is NULL))	
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0 AND events_tbl.isactive=1
					
and events_ref.siteid in (#site_id#)
	
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate
</cfquery> <cfoutput><ul id="f-#dateformat(currentdate2,"d")#" class="events">
                    
                  </cfoutput><cfloop query="getevent2"><cfoutput><li><a href="http://#cgi.server_name#/newsevents/public/calendar_detail.cfm?eventid=#eventid#&date=#now#&skin=focus">#shortdesc#</a></li></cfoutput></cfloop>
                  <cfset currentdate2 = DateAdd("d", 1, currentdate2)></ul>
                </cfloop>
								
							<cfoutput><img src="ico-calendar.gif" alt="" width="14" height="13" border="0"><a href="http://#cgi.server_name#/newsevents/public/calendar.cfm?month=#datepart('m',now)#&year=#datepart('yyyy',now)#&day=#datepart('d',now)#&skin=focus&siteid=#site_id#" class="calendar">Complete Student Calendar</a></cfoutput>