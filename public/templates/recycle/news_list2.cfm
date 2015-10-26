		
	<cfif isDefined("url.sort")>		
		<cfset sort=(url.sort)>
	<cfelse>
		<cfset sort='created'>
	</cfif>
	
	<cfif isDefined("url.where")>		
		<cfset where=(url.where)>		
		<cfset crit=(url.crit)>
	<cfelse>
		<cfset where=0>		
		<cfset crit=0>
	</cfif>
	
	<cfquery name="getnews" datasource="#application.datasource_select#">
		select news.newsid, longtitle,DESC_CLOB,created,byline,AUTH_TBL.level,news_ref.userid
		from news,news_ref,AUTH_TBL
		where news_ref.siteid=AUTH_TBL.siteid AND news.newsid=news_ref.newsid AND #variables.where#='#variables.crit#'
		and news.pulldate >now()
		order by #variables.sort#
	</cfquery>
	
	<cfinclude template="../templates/top.cfm">
	<div id="content">
		<div id="currentFeature">
			<h2>News</h2><br/>
			<span class="author">
			<cfoutput>
				where #variables.where#='#variables.crit#'
			</cfoutput>
			</span>
			
			<cfoutput query="getnews">
				<div id="feed">
<h3><a href="news_view.cfm?newsid=#newsid#">#longtitle#</a></h3>
<p class="pullquote">
#DESC_CLOB#(#level#, #getnews.userid#, #session.userid#)</p>
					<span class="date">Created on #dateformat(created, "mm.dd.yyyy")#</span>
					<span class="author">Byline <a href="news_list.cfm?where=byline&crit=#byline#">#byline#</a></span>
					<span class="comments"><a href="">Full Properties</a></span>						
					<cfif getnews.userid EQ session.userid or getnews.level EQ 2>
						<span id="actions"><a href="">edit this article</a> | <a href="news_delete.cfm?id=#newsid#">delete this article</a></span>
					</cfif>
				</div>
			</cfoutput>
		</div>
		<div class="more">
			
<p class="archive">

<script LANGUAGE=javascript><!--
function OnChange(dropdown)
{
	var myindex = dropdown.selectedIndex
    var baseURL= "news_list.cfm?site="
        top.location.href = baseURL + dropdown.options[myindex].value;
    
    return true;
}
//-->
</script>

		<form method="get" action="news_list.cfm" id="form1" name="form1">
			<select name="select1" onChange='OnChange(this.form.select1);'>
				<option value="#">Show all</option>
				<option value="1">Show published</option>
				<option value="2">Show posted</option>
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
