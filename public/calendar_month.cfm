<!--sort nav variables	(variables passed through sortnav in templates folder)-->
<cfparam name="site" default="0">
<cfif parameterexists(url.site)>
	<cfset site=(url.site)>
<cfelse>
	<cfset site=0>
</cfif>

<cfif url.view is 'mw' or url.view is 'ww'>
	<cfset loopfrom=1>
	<cfset loopto=7>
<cfelseif url.view is 'm' or url.view is 'w'>
	<cfset loopfrom=2>
	<cfset loopto=6>
</cfif>


<cfoutput>
	
		<cfif (month IS "#DatePart('m', Now())#") AND (year IS "#DatePart('yyyy', Now())#")>&nbsp;&nbsp;#MonthAsString(month)#&nbsp;#year#&nbsp;&nbsp;<a href="#variables.location#?month=#NextMonth#&year=#NextYear#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#">next</a>
		<cfelse>
<a href="#variables.location#?month=#LastMonth#&year=#LastYear#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#">prev</a>&nbsp;&nbsp;#MonthAsString(month)#&nbsp;#year#&nbsp;&nbsp;<a href="#variables.location#?month=#NextMonth#&year=#NextYear#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&view=#url.view#">next</a>
		</cfif>

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
	<cfset ThisDay = 0>		
		<cfset currentweek = 0>
<!--- Loop through until the number of days in the month is reached.  --->
<cfloop condition="ThisDay LTE Days">
	<tr bgcolor="FFFFFF">
	<!--- Loop through each day of the week. --->
		<cfloop from="#loopfrom#" to="#loopto#" index="LoopDay">
		<!--- If ThisDay is still 0, check to see if the current day of the week in the loop --->
		<!--- matches the day of the week for the first day of the month. --->
		<!--- If the values match, set ThisDay to 1. --->
		<!--- Otherwise, the value will remain 0 until the correct day of the week is found. --->
			<cfif ThisDay IS 0>
				<cfif DayOfWeek(ThisMonthYear) IS LoopDay>
					<cfset ThisDay = 1>
				</cfif>
			</cfif>
		<!--- If the ThisDay value is still 0, or it is greater than the number of days in the month, --->
		<!--- display nothing in the column. --->
		<!--- Otherwise, display the day of the month and increment the value. --->
			<cfif (ThisDay IS NOT 0) AND (ThisDay LTE Days)>
				<cfset currentdate = CreateDate(year, month, ThisDay)>
				
				
<cfquery datasource="#application.datasource_select#" name="getevent">
SELECT distinct events_tbl.eventID, shortdesc,  startdate
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(currentdate,"yyyy-mm-dd")#' and enddate is NULL))
	
	<cfif url.audience is not 0>and events_audref.audienceid=#url.audience#</cfif>
	
AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
	<cfif url.siteid is not 0>and events_ref.siteid in (#url.siteid#)</cfif>
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate
</cfquery>
				
				<cfif getevent.recordcount GT 0>
					<td height="70" align="right" valign="top" bgcolor="#FFFDE8" class="text70">
					<cfoutput>#ThisDay#</cfoutput><br/>
					<cfoutput query="getevent"><a href="events_detail.cfm?eventid=#eventid#&siteid=#url.siteid#">#shortdesc#</a><br/></cfoutput>
					</td>
				<cfelse>
					<td align="right" valign="top" height="70" class="text70">
					<cfoutput>#ThisDay#</cfoutput>
					</td>
				</cfif>				
				<cfset ThisDay = ThisDay + 1>
			<cfelse>
				<td bgcolor="#C0C0C0" class="text70">&nbsp;</td>
			</cfif>
		</cfloop>
	</tr>
<cfif url.view is 'w' or url.view is 'ww'>
<cfset ThisDay=1000>
</cfif>
</cfloop>
</table>
			

