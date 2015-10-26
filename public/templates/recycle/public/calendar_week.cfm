<!--sort nav variables	(variables passed through sortnav in templates folder)-->
<cfparam name="site" default="0">
<cfif isDefined("url.site")>
	<cfset site=(url.site)>
<cfelse>
	<cfset site=0>
</cfif>

<cfif url.view is 'ww'>
	<cfset loopfrom=1>
	<cfset loopto=7>
<cfelseif url.view is 'w'>
	<cfset loopfrom=2>
	<cfset loopto=6>
</cfif>


<cfoutput>


<a href="#variables.location#?month=#lastweekmonth#&year=#lastweekyear#&day=#lastweekday#&week=#lastweek#&range=w&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#">previous week</a>&nbsp;&nbsp;Week of #dateformat(daterangebeg, "mmmm d, yyyy")#&nbsp;&nbsp;<a href="#variables.location#?month=#nextweekmonth#&year=#nextweekyear#&day=#nextweekday#&week=#nextweek#&range=w&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#">next week</a>

	
</cfoutput>				
			

			
			
<table width="100%" border="0" cellspacing="1" cellpadding="0">
<!--- Display the day of week headers.  I've truncated the values to display only the first three letters  --->
<!--- of each day of the week.  --->
	<tr bgcolor="FFFFFF">
		<cfloop from="#loopfrom#" to="#loopto#" index="LoopDay">
			<cfoutput>
				<td width="14%" align="center" height="1" class="text70">#Left(DayOfWeekAsString(LoopDay), 3)#</td>
			</cfoutput>
		</cfloop>
	</tr>
<!--- Set the ThisDay variable to 0.  This value will remain 0 until the day of the week on which the --->
<!--- first day of the month falls on is reached. --->
	<cfif view is 'w'>
		<cfset currentdate = dateadd('d',1,daterangebeg)>	
	<cfelse>
	<cfset currentdate = daterangebeg>
	</cfif>

		<cfset currentweek = 0>
<!--- Loop through until the number of days in the month is reached.  --->

	<tr bgcolor="FFFFFF">
	<!--- Loop through each day of the week. --->
		<cfloop from="#loopfrom#" to="#loopto#" index="LoopDay">
		<!--- If ThisDay is still 0, check to see if the current day of the week in the loop --->
		<!--- matches the day of the week for the first day of the month. --->
		<!--- If the values match, set ThisDay to 1. --->
		<!--- Otherwise, the value will remain 0 until the correct day of the week is found. --->
		
		<!--- If the ThisDay value is still 0, or it is greater than the number of days in the month, --->
		<!--- display nothing in the column. --->
		<!--- Otherwise, display the day of the month and increment the value. --->

				
				
				
<cfquery datasource="#application.datasource_select#" name="getevent">
SELECT distinct events_tbl.eventID, shortdesc,  startdate, events_link_override,events_link
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))
	
	<cfif url.audience is not 0>and events_audref.audienceid=#url.audience#</cfif>
	
AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
	<cfif url.siteid is not 0>and events_ref.siteid in (#url.siteid#)</cfif>
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate
</cfquery>
				
				<cfif getevent.recordcount GT 0>
					<td height="70" align="right" valign="top" bgcolor="#FFFDE8">
					<cfoutput>#dateformat(currentdate,"d")#</cfoutput><br/>
					<cfoutput query="getevent"><cfif events_link_override eq 1><a href="#events_link#"><cfelse><a href="events_detail.cfm?eventid=#eventid#&siteid=#url.siteid#"></cfif>#shortdesc#</a><br/></cfoutput>
					</td>
				<cfelse>
					<td align="right" valign="top" height="70">
					<cfoutput>
					<cfif datepart("d",currentdate) EQ 1 or datepart("d",currentdate) EQ 2 or datepart("d",currentdate) EQ 30 or datepart("d",currentdate) EQ 31>#dateformat(currentdate,"mmm")#</cfif> #dateformat(currentdate,"d")#</cfoutput>
					</td>
				</cfif>				
				
		<cfset currentdate = DateAdd("d", 1, currentdate)>
		</cfloop>
	</tr>

<cfset ThisDay=1000>


</table>
			

