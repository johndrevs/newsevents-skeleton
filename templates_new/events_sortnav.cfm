
<cfoutput>
<ul class="nav">
	<li <cfif sortby is 'shortdesc'> class="active"</cfif>><a href="#variables.location#?sort=shortdesc&site=#variables.site#">Events by name</a></li>	
	<li <cfif sortby is 'created'> class="active"</cfif>><a href="#variables.location#?sort=startdate&site=#variables.site#">Events by  event date</a></li>
	<li <cfif sortby is 'pubdate'> class="active"</cfif>><a href="#variables.location#?sort=pubdate&site=#variables.site#">Events by publish date</a></li>		
</ul>
</cfoutput>

