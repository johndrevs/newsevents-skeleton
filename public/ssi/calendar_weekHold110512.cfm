<!--- determines whether to include weekends. In Phase one we display weekends for every view --->
<cfif url.view is 'ww'>
	<cfset loopfrom=1>
	<cfset loopto=7>
<cfelseif url.view is 'w'>
	<cfset loopfrom=2>
	<cfset loopto=6>
</cfif>


<!-- header row -->
<cfoutput>
		<tr>
			<th colspan="7" align="center">
			<div class="floatleft"> <a href="/newsevents/public/#variables.location#?month=#lastweekmonth#&year=#lastweekyear#&day=#lastweekday#&week=#lastweek#&range=w&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">	&laquo; previous week</a>
			</div>
			<div class="floatright"><a href="/newsevents/public/#variables.location#?month=#NextweekMonth#&year=#NextweekYear#&day=#nextweekday#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#">next week &raquo;</a>
			</div>
			<h2><a href="/newsevents/public/#variables.location#?month=#lastweekmonth#&year=#lastweekyear#&day=#lastweekday#&week=#lastweek#&range=w&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#"><img src="images/larrow.jpg" width="15" height="13" alt="Previous" border="0" align="middle"/></a>Week of #dateformat(daterangebeg, "dddd mmmm d, yyyy")# <a href="/newsevents/public/#variables.location#?month=#NextweekMonth#&year=#NextweekYear#&day=#nextweekday#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#&skin=#url.skin#"><img src="images/rarrow.gif" width="15" height="13" alt="Next" border="0" align="middle"/></a></h2></th>
		</tr>
</cfoutput>
<!-- end header row -->

<cfinclude template="/newsevents/public/ssi/filtermenu.cfm">

	<tr>
		<cfloop from="#loopfrom#" to="#loopto#" index="LoopDay">
			<cfoutput>
				<cfif dayofweek(LoopDay) EQ 1 or dayofweek(LoopDay) EQ 7>
					<td class="wkndhdr">
				<cfelse>
					<td class="wkhdr">
				</cfif>
				#ucase(Left(DayOfWeekAsString(LoopDay), 3))#</td>
			</cfoutput>
		</cfloop>
	</tr>
	<cfif view is 'w'>	
	<cfset currentdate = dateadd('d',1,daterangebeg)>
	<cfelse>
		<cfset currentdate = daterangebeg>
	</cfif>
	<cfset currentweek = 0>
<!--- Loop through until the number of days in the month is reached.  --->
	
<!-- event output row -->
	<tr>
<!--- Loop through each day of the week. --->
		<cfloop from="#loopfrom#" to="#loopto#" index="LoopDay">
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
<cfquery name="getevent" datasource="#application.datasource_select#" maxrows=20>
SELECT distinct events_tbl.eventID, shortdesc,  startdate,enddate, events_link_override,events_link
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))
	
	<cfif url.audience is not 0>and events_audref.audienceid IN (#url.audience#)</cfif>
	
AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.isactive=1 and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
and events_ref.siteid in (#url.siteid#)
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate</cfquery>

				<!--- displays td with date and event query information --->
				<cfif getevent.recordcount GT 0>
					<div id="dhtmlgoodies_slidedown"><td<cfif dayofweek(currentdate) EQ 1 or dayofweek(currentdate) EQ 7> class="wknd"</cfif>>
					<cfoutput><cfif datecompare(currentdate,now(),"d") EQ 0><div id="on"></cfif><h3><a href="calendar.cfm?view=d&month=#url.Month#&year=#url.Year#&day=#url.day#&range=d&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#">#dateformat(currentdate,"d")#</a></h3><cfif datecompare(currentdate,now(),"d") EQ 0></div></cfif></cfoutput><br/>
					<ul id="dhtmlgoodies_control"><cfoutput query="getevent">
		<li <cfif (CurrentRow MOD 2) IS 1>class="gridlist_alt"</cfif>><cfif timeformat(startdate,"h:mm:tt") EQ '1:00:am'><cfelse>#timeformat(startdate,"h:MM TT")#<cfif enddate EQ ''> <cfelse><cfif datecompare(startdate,enddate,"m") EQ 0> - #timeformat(enddate,"h:mm tt")#</cfif></cfif><br/></cfif>
			<cfif events_link_override eq 1><a href="#events_link#"><cfelse><a href="calendar_detail.cfm?eventid=#eventid#&siteid=#url.siteid#&month=#url.month#&year=#url.year#&day=#url.day#&range=#url.range#&audience=#url.audience#&view=#url.view#&skin=#url.skin#" onclick="slidedown_showHide();return false;"></cfif><cfif shortdesc EQ 'Key Academic Date'><strong>#shortdesc#</strong><cfelse>#shortdesc#</cfif></a></li>
	</cfoutput><!---  <div id="dhtmlgoodies_contentBox">
 <div id="dhtmlgoodies_content">
			<!-- slide down content goes here -->
Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues.<br><br>
			<!-- End slide down content -->
  </div> 
  </div>---></ul>
					</td></div>
				<cfelse>
					<td<cfif dayofweek(currentdate) EQ 1 or dayofweek(currentdate) EQ 7> class="wknd"</cfif>>
					<cfoutput><cfif datecompare(currentdate,now(),"d") EQ 0><div id="on"></cfif>
					<h3><a href="calendar.cfm?view=d&month=#url.Month#&year=#url.Year#&day=#url.day#&range=d&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#"><cfif datepart("d",currentdate) EQ 1 or datepart("d",currentdate) EQ 2 or datepart("d",currentdate) EQ 30 or datepart("d",currentdate) EQ 31>#dateformat(currentdate,"mmm")#</cfif> #dateformat(currentdate,"d")#</cfoutput></a></h3><cfif datecompare(currentdate,now(),"d") EQ 0></div></cfif>
					</td>
				</cfif>				
		<!--- Increment to the next day	 --->
		<cfset currentdate = DateAdd("d", 1, currentdate)>
		</cfloop>
</tr>
<!-- end event output row -->