<ul id="globalNav">
	<li id="articlesLink" <cfif variables.location contains 'news_'>class="active"</cfif>><a href="/newsevents/news">News</a></li>
	<li id="eventsLink"<cfif variables.location contains 'events_'>class="active"</cfif>><a href="/newsevents/events">Events</a></li>
	<li id="adminLink"<cfif variables.location contains 'ites' or variables.location contains 'sers'  or variables.location contains 'dmin' or variables.location contains 'essages' or variables.location contains 'ocations'>class="active"</cfif>><a href="/newsevents/admin">Administration</a></li>
</ul>