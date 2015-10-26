
<cfoutput>
<ul id="sortNav">
	<li id="dateLink" <cfif sort is 'pubdate'> class="active"</cfif>><a href="#variables.location#?sort=pubdate&site=#variables.site#">Articles by date published</a></li>
	<li id="typeLink" <cfif sort is 'pulldate'> class="active"</cfif>><a href="#variables.location#?sort=pulldate&site=#variables.site#">Articles by date pulled</a></li>
	<li id="authorLink" <cfif sort is 'lastname,firstname'> class="active"</cfif>><a href="#variables.location#?sort=lastname,firstname&site=#variables.site#">Articles by author</a></li>
	<li id="titleLink" <cfif sort is 'shorttitle'> class="active"</cfif>><a href="#variables.location#?sort=shorttitle&site=#variables.site#">Articles by title</a></li>	
</ul>
</cfoutput>