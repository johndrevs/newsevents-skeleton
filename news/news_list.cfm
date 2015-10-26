
<cfinclude template="/newsevents/templates/securityheader.cfm">

<!--sort nav variables	(variables passed through sortnav in templates folder)-->
	<cfparam name="variables.sortby" default="created">		
	<cfif parameterexists(url.sortby)>		
		<cfset sortby=(url.sortby)>
	<cfelse>
		<cfset sortby='lastname,firstname'>
	</cfif>
	<cfparam name="site" default="0">		
	<cfif parameterexists(url.site)>		
		<cfset site=(url.site)>
	<cfelse>
	<cfset site=0>
	</cfif>
			<cfif parameterexists(url.where)>		
		<cfset where=(url.where)>		
		<cfset crit=(url.crit)>
	<cfelse>
				<cfset where=0>		
		<cfset crit=0>
	</cfif>
<!--end sort nav variables	-->
	<cfquery name="getnews" datasource="#application.datasource_select#">
		select news.newsid, shorttitle,DESC_CLOB,created,byline,pubdate,pulldate, firstname, lastname,user_admin, news.userid
				from CUNVMCS.news, CUNVMCS.users
				where	0=0 AND #variables.where#='#variables.crit#' and news.isactive=1 and news.userid=users.userid			
		<cfif site is 1>and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')		
		<cfelseif site is 2>and to_char(pubdate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd')
		</cfif>
		and  news.newsid IN (select news_ref.newsid from CUNVMCS.news_ref where news_ref.siteid in (#session.publish#) or news_ref.userid =#session.userid#)
				order by #variables.sortby#
	</cfquery>
	
<!--pagination variables-->		
	<cfif parameterexists(url.startindex)>		
		<cfset startindex=#url.startindex#>
	<cfelse>
		<cfset startindex=1>
	</cfif>
	<cfset last=#variables.startindex#-#variables.paginatelevel#>	
	<cfset next=#variables.startindex#+#variables.paginatelevel#>	
	<cfset nextpub=#variables.startindex#+#variables.paginatelevel#-1>	
	<cfset beginning=1>	
	<cfset end=#getnews.recordcount#-#variables.paginatelevel#>
<!--end pagination variables-->	

<cfset page='news'>	
<cfset sort='yes'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>News</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Title</th>
			<th>Author</th>
			<th>Date Published</th>
			<th>Date Pulled</th>
			<th>Actions</th>
		</tr>			
		<cfif getnews.recordcount lt 1>
			<tr>
				<td colspan="5">There are currently no records available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getnews" startrow="#variables.startindex#" maxrows="#variables.paginatelevel#">
				<form action="news_action.cfm" method="post">
					<tr>
						<td><a href="##" class="date" onClick="window.open('news_view.cfm?newsid=#newsid#', 'mywindow', 'width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
						<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a>							
						<cfif getnews.user_admin is 1>*</cfif></td>
						<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
						<td>#dateformat(pulldate,"mm.dd.yyyy")#</td>
						<td nowrap>
						<input type="submit" name="control" value="control placement" class="button">							
						<cfif session.administrator is 1 or getnews.userid eq session.userid>
							<input type="submit" name="delete" value="delete" class="button" onClick="return confirmdelete()">
						</cfif>
						<cfif session.administrator is 1 or getnews.userid eq session.userid>
							<input type="submit" name="rework" value="rework" class="button">
						</cfif></td>
					</tr>
					<input type="hidden" name="newsid" value="#newsid#">
				</form>
			</cfoutput>
		</cfif>
		
<!--Pagination table row-->
		<cfoutput>
			<tr>
				<td colspan="4">records #variables.startindex#-					
				<cfif getnews.recordcount GT variables.nextpub>
				#variables.nextpub#	of #getnews.recordcount#
				<cfelse>
				#getnews.recordcount#
				</cfif></td>
				<td colspan="2" class="right">					
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&site=#variables.site#&sort=#variables.sort#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&site=#variables.site#&sort=#variables.sort#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getnews.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&site=#variables.site#&sort=#variables.sort#">next #variables.paginatelevel# records</a>
				</cfif>
				
				<!---					
				<cfif getnews.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&site=#variables.site#&sort=#variables.sort#">last records</a>
				</cfif>
				--->
				next=#variables.next# nextpub=#variables.nextpub# rc=#getnews.recordcount# last=#variables.last#</td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
<cfoutput>
<script LANGUAGE=javascript><!--
function OnChange(dropdown)
{
	var myindex = dropdown.selectedIndex
    var baseURL= "news_list.cfm?sortby=#variables.sort#&site="
        top.location.href = baseURL + dropdown.options[myindex].value;
    
    return true;
}
//-->
</script>
</cfoutput>

	<form method="get" action="news_list.cfm" id="form1" name="form1">
		<select name="select1" onChange='OnChange(this.form.select1);'>
			<option value="4" <cfif site is 4>selected</cfif>>--filter on---</option>
			<option value="3" <cfif site is 3>selected</cfif>>Show all</option>
			<option value="1" <cfif site is 1>selected</cfif>>Show active</option>
			<option value="2" <cfif site is 2>selected</cfif>>Show inactive</option>
		</select>
	</form>
	
<cfinclude template="/newsevents/templates_new/footer.cfm">