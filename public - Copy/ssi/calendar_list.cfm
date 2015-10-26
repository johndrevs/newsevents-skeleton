<!--- sets date for query --->
<cfset currentdate = CreateDate(year, month, day)>
<cfquery datasource="#application.datasource_select#" name="getevent2">
SELECT distinct events_tbl.eventID, shortdesc,  startdate, events_link_override,events_link,enddate
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))	
AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
and events_ref.siteid in (#url.siteid#)
	<cfif url.audience is not 0>and events_audref.audienceid IN (#url.audience#)</cfif>
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate
</cfquery>

<cfinclude template="/newsevents/public/ssi/filtermenu.cfm">

<cfoutput>
  <nav id="view">
    <h3 id="name">#dateformat(daterangebeg, "dddd, mmmm d, yyyy")#</h3>
    <ul id="navi">
      <li><a href="/newsevents/public/#variables.location#?month=#lastdaymonth#&year=#lastdayyear#&day=#lastdayday#&week=#lastweek#&range=d&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">Prev</a></li>
      <li><a href="/newsevents/public/#variables.location#?month=#nextdaymonth#&year=#nextdayyear#&day=#nextdayday#&week=#lastweek#&range=d&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">Next</a></li>
    </ul>
  </nav>
</cfoutput> 


<ul class="dayview">
  <cfif getevent2.recordcount lt 1>
    <cfoutput>
      <li>There are no events scheduled for #dateformat(daterangebeg, "dddd, mmmm d, yyyy")#</li>
    </cfoutput>
    <cfelse>
    <cfoutput query="getevent2">
      <li>
        <cfif timeformat(startdate,"h:mm:tt") EQ '1:00:am'>
          <cfelse>
          #timeformat(startdate,"h:MM TT")#
          <cfif enddate EQ ''>
            <cfelse>
            <cfif datecompare(startdate,enddate,"m") EQ 0>
              - #timeformat(enddate,"h:mm tt")#
            </cfif>
          </cfif>
          <br/>
        </cfif>
        <cfif events_link_override eq 1>
          <a href="#events_link#">
          <cfelse>
          <a href="calendar_detail.cfm?eventid=#eventid#&siteid=#url.siteid#&month=#url.month#&year=#url.year#&day=#url.day#&range=#url.range#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">
        </cfif>
        <cfif shortdesc EQ 'Key Academic Date'>
          <strong>#shortdesc#</strong>
          <cfelse>
          #shortdesc#
        </cfif>
        </a></li>
    </cfoutput>
  </cfif>
</ul>