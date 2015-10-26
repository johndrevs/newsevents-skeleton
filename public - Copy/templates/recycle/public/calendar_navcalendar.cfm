
	<table width="10%" border="1">
		<tr>
			<cfoutput><td class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" colspan="2" valign="middle" align="left"><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="#variables.location#?month=#DatePart('m', Now())#&year=#DatePart('yyyy', Now())#&day=#DatePart('d', Now())#&range=d&siteid=#url.siteid#&audience=#url.audience#">Today</a></td></cfoutput>
			<td class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" colspan="6" valign="middle" align="right">
			<cfoutput>
			
				<cfif (month IS "#DatePart('m', Now())#") AND (year IS "#DatePart('yyyy', Now())#")><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="#variables.location#?month=#DatePart('m', Now())#&year=#DatePart('yyyy', Now())#&day=1&range=m&siteid=#url.siteid#&audience=#url.audience#">#MonthAsString(month)#</a> #year#<a href="#variables.location#?month=#NextMonth#&year=#NextYear#&day=1&range=m&siteid=#url.siteid#&audience=#audience#"><img width="11" height="11" src="images/next.jpg" border="0"></a>
				<cfelse>
<a href="#variables.location#?month=#LastMonth#&year=#LastYear#&day=1&range=m"><img width="11" height="11" src="images/previous.jpg" border="0"></a><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="#variables.location#?month=#DatePart('m', Now())#&year=#DatePart('yyyy', Now())#&day=1&range=m&siteid=#url.siteid#&audience=#url.audience#">#MonthAsString(month)#</a> #year#<a href="#variables.location#?month=#NextMonth#&year=#NextYear#&day=1&range=m&siteid=#url.siteid#&audience=#url.audience#"><img width="11" height="11" src="images/next.jpg" border="0"></a>
				</cfif>
			</cfoutput>
			</td>
		</tr>
		<tr>
			<td width="12%">&nbsp;</td>
			<cfloop from="1" to="7" index="LoopDay">
				<cfoutput>
					<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">#Left(DayOfWeekAsString(LoopDay), 1)#</td>
				</cfoutput>
			</cfloop>
		</tr>	
		<!--- Set the ThisDay variable to 0.  This value will remain 0 until the day of the week on which the --->
		<!--- first day of the month falls on is reached. --->		
		<cfset ThisDay = 0>
		<cfloop condition="ThisDay LTE Days">
			<tr>
				<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right">&nbsp;</td>

	<!--- Loop through each day of the week. --->
				<cfloop from="1" to="7" index="LoopDay">
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
							SELECT startdate, enddate, shortdesc, events_tbl.eventID, startdate
							FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
							WHERE to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(currentdate,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(currentdate,"yyyy-mm-dd")#'	<cfif url.audience is not 0>and events_audref.audienceid=#url.audience#</cfif> AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0 <cfif url.siteid is not 0>and events_ref.siteid in (#url.siteid#)</cfif> and events_ref.events_ref_level =2)
							order by events_tbl.startdate
						</cfquery>
						<cfif getevent.recordcount GT 0>
							<cfoutput><td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayOver" href="#variables.location#?month=#url.month#&year=#url.year#&day=#thisday#&siteid=#url.siteid#&audience=#audience#"><strong>#ThisDay#</strong></a></td></cfoutput>
						<cfelse>
							<cfoutput><td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayOver" href="#variables.location#?month=#url.month#&year=#url.year#&day=#thisday#&siteid=#url.siteid#&audience=#audience#">#ThisDay#</a></td></cfoutput>
						</cfif>
						<cfset ThisDay = ThisDay + 1>
					<cfelse>
						<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"></td>
					</cfif>
				</cfloop>
			</tr>
		</cfloop>
	</table>	
	<!-- End of month navigation -->