<cfinclude template="../templates/top.cfm">
<cfparam name="variables.sort" default="created">
<cfparam name="site" default="0">	

	<cfif isDefined("url.sort")>		
		<cfset sort=(url.sort)>
	<cfelse>
		<cfset sort='created'>
	</cfif>
	
<cfif isDefined("url.site")>		
		<cfset site=(url.site)>
	<cfelse>
		<cfset site=0>
	</cfif>
	
	<cfif isDefined("url.where")>		
		<cfset where=(url.where)>		
		<cfset crit=(url.crit)>
	<cfelse>
		<cfset where=0>		
		<cfset crit=0>
	</cfif>
	
	<cfquery name="getnews" datasource="#application.datasource_select#">
		select news.newsid, shorttitle,DESC_CLOB,created,byline,pubdate,pulldate, firstname, lastname, news.userid
		from news, users
		where	0=0 AND #variables.where#='#variables.crit#' and news.isactive=1 and news.userid=users.userid
		<CFIF site is 1>and (pubdate <= #now()# and pulldate >= #now()#)
		<CFELSEIF site is 2>and (pubdate >= #now()# or pulldate <= #now()#)
		</cfif>		
		
		and  news.newsid IN (select news_ref.newsid from news_ref where news_ref.siteid in (#session.publish#) or news_ref.userid =#session.userid#)
order by #variables.sort#
	
		
	</cfquery>

	
	<div id="content">
		<div id="currentFeature">
			<h2>News</h2><br/>
			<table width="100%">
<tr>
	<td>Title</td>
	<td>Entered by</td>
	<td>Pubdate</td>
	<td>Pulldate</td>
	<td>Actions</td>
</tr>
<cfoutput query="getnews"><tr>
	<td><a href="##"onClick="window.open('news_view.cfm?newsid=#newsid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
	<td><a href="news_view.cfm?newsid=#newsid#">#firstname# #lastname#</a></td>
	<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
	<td>#dateformat(pulldate,"mm.dd.yyyy")#</td>
	<td><cfif session.administrator is 1 or getnews.userid eq session.userid><a href="news_rework_check.cfm?newsid=#newsid#">rework</a> |</cfif> 
		<cfif session.administrator is 1 or getnews.userid eq session.userid><a href="news_delete.cfm?newsid=#newsid#">delete</a> |</cfif>  
		<a href="news_placement.cfm?newsid=#newsid#">control placement</a></td>
</tr></cfoutput>
</table>

		
		</div>
		<div class="more">
			
<p class="archive">

<cfoutput><script LANGUAGE=javascript><!--
function OnChange(dropdown)
{
	var myindex = dropdown.selectedIndex
    var baseURL= "news_list.cfm?sort=#variables.sort#&site="
        top.location.href = baseURL + dropdown.options[myindex].value;
    
    return true;
}
//-->
</script></cfoutput>

		<form method="get" action="news_list.cfm" id="form1" name="form1">
			<select name="select1" onChange='OnChange(this.form.select1);'>
				<option value="4" <cfif site is 4>selected</cfif>>--filter on---</option>
				<option value="3" <cfif site is 3>selected</cfif>>Show all</option>
				<option value="1" <cfif site is 1>selected</cfif>>Show active</option>
				<option value="2" <cfif site is 2>selected</cfif>>Show inactive</option>
			</select>
		</form></p>&nbsp;
		</div>
	</div>
	
	<cfinclude template="../templates/access_sidebar.cfm">
	
	<cfinclude template="../templates/footer.cfm">
	
	<cfinclude template="../templates/globalnav.cfm">
	
	<cfinclude template="../templates/news_sortnav.cfm">
	
	<cfinclude template="../templates/search.cfm">
	
	<cfinclude template="../templates/news_adminnav.cfm">
</body>
</html>
