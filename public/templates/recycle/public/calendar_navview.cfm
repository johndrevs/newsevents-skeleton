
<cfoutput>
<a href="calendar.cfm<!--- ?view=d&month=#url.Month#&year=#url.Year#&day=#url.day#&range=d&siteid=#url.siteid#&audience=#url.audience# --->"><img src="images/list.gif" alt="" width="22" height="16" border="0"></a>

<a href="calendar.cfm?view=ww&month=#url.Month#&year=#url.Year#&day=#url.day#&range=ww&siteid=#url.siteid#&audience=#url.audience#"><img src="images/week_calendar.gif" alt="" width="22" height="16" border="0"></a>

<a href="calendar.cfm?view=w&month=#url.Month#&year=#url.Year#&day=#url.day#&range=w&siteid=#url.siteid#&audience=#url.audience#"><img src="images/week_calendar_weekends.gif" alt="" width="22" height="16" border="0"></a>

<!--<a href="calendar.cfm?view=m&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#"><img src="images/month_calendar.gif" alt="" width="22" height="16" border="0"></a>-->

<a href="calendar.cfm?view=mw&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#"><img src="images/month_calendar_weekends.gif" alt="" width="22" height="16" border="0"></a>
</cfoutput>
