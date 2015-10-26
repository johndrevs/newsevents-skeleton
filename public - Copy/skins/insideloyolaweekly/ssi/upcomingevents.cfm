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
  <cfsilent>
  <cfquery name="getevent" datasource="#application.datasource_select#" maxrows=200>
SELECT distinct events_tbl.eventID, shortdesc,  startdate,enddate, events_link_override,events_link
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE  ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.isactive=1 and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
and events_ref.siteid in (#variables.site_id#)
and events_ref.events_ref_level =2)
order by events_tbl.shortdesc
</cfquery>
  </cfsilent>
  <!--- displays td with date and event query information --->
  <cfif getevent.recordcount GT 0>
    <dl>
      <cfoutput query="getevent">
        <dt style="margin:0;font-size: 11px;"><a href="#application.url#/public/calendar.cfm?view=d&amp;month=#url.Month#&amp;year=#url.Year#&amp;day=#url.day#&amp;siteid=#variables.site_id#" style="color: ##000000;text-decoration:none;font-weight:bold;">
          <cfif timeformat(getevent.startdate,"h:mm:tt") EQ '1:00:am'>
#dateformat(getevent.startdate,"mm/dd")#
            <cfif enddate is not '' and datecompare(getevent.startdate,getevent.enddate,"d") NEQ 0>
              to #dateformat(getevent.enddate,"mm/dd")#
            </cfif>
            <cfelseif getevent.enddate IS ''>
#dateformat(getevent.startdate,"mm/dd")# | #timeformat(getevent.startdate,"h:mm TT")#
            <cfelseif datecompare(getevent.startdate,getevent.enddate,"d") NEQ 0>
#dateformat(getevent.startdate,"mm/dd")# | #timeformat(getevent.startdate,"h:mm TT")#             <br/>
            to <br/>
#dateformat(getevent.enddate,"mm/dd")# | #timeformat(getevent.enddate,"h:mm TT")#
            <cfelseif datecompare(getevent.startdate,getevent.enddate,"m") EQ 0  and parameterexists(form.enddateno) neq 1>
#dateformat(getevent.startdate,"mm/dd")# | #timeformat(getevent.startdate,"h:mm TT")# - #timeformat(getevent.enddate,"h:mm tt")#
            <cfelse>
          </cfif>
          </a></dt>
        <dd style="font-size: 11px;margin:0 0 10px 0">
          <cfif events_link_override eq 1>
            <a href="#events_link#" style="color: ##a30046;text-decoration:none;font-weight:bold;">
            <cfelse>
            <a href="#application.url#/public/calendar_detail.cfm?eventid=#eventid#&amp;siteid=#variables.site_id#&amp;month=#url.month#&amp;year=#url.year#&amp;day=#url.day#" style="color: ##a30046;text-decoration:none;font-weight:bold;">
          </cfif>
          <cfif shortdesc EQ 'Key Academic Date'>
#shortdesc#
            <cfelse>
#shortdesc#
          </cfif>
          </a></dd>
      </cfoutput>
    </dl>
    <cfelse>
  </cfif>
  <!--- Increment to the next day --->
  <cfset currentdate = DateAdd("d", 1, currentdate)>
</cfloop>
