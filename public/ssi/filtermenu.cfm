<cfoutput>
<nav id="filter">
  <div id="calendar_view">View: <a href="calendar.cfm?view=d&month=#datepart("m",now())#&year=#datepart("yyyy",now())#&day=#datepart("d",now())#&range=d&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#">Today</a> | <a href="calendar.cfm?view=ww&month=#url.Month#&year=#url.Year#&day=#url.day#&range=ww&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#">Week</a> | <a href="calendar.cfm?view=mw&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#">Month</a></div>  
    <form action="calendar.cfm?view=#url.view#&month=#url.Month#&year=#url.Year#&day=#url.day#&range=#url.range#&skin=#url.skin#" method="post" id="calendar_filter">
      Filter:
      <cfinclude template="calendar_navdrop.cfm">
    </form>
    <form action="calendar.cfm?view=ww&month=#url.Month#&year=#url.Year#&day=#url.day#&range=ww&siteid=#url.siteid#&audience=#url.audience#&skin=#url.skin#" method="post" id="calendar_search">
      <input class="searchbox" name="criteria" maxlength="255" value="" type="text">
      <input type="submit" value="Search">
    </form>

</nav>
</cfoutput> 

