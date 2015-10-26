
			
	<cfif isDefined("url.newsid")>		
		<cfset newsid=(url.newsid)>
	<cfelse>
		<cfset newsid=0>
	</cfif>
<h2>News Delete</h2>

<h3>Are you sure that you want to delete this article?</h3>
	<cfoutput>
<a href="news_list.cfm">no, keep this article</a> | <a href="news_delete_action.cfm?newsid=#newsid#">yes, delete this article</a>
	</cfoutput>
	
<a href="/dates/" class="more">More Articles By Date</a></p>
