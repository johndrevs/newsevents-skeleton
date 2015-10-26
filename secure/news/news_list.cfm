<cfif parameterexists(form.criteria)>
	<cfset url.criteria=form.criteria>
<cfelseif  parameterexists(url.criteria) EQ 0>
	<cfset url.criteria='none'>
</cfif>


<!--sort nav variables	(variables passed through sortnav in templates folder)-->	
	<cfparam name="variables.sortby" default="created">	
	<cfif isDefined("url.sortby")>		
		<cfset sortby=(url.sortby)>
	<cfelse>
		<cfset sortby='pubdate'>
	</cfif>
	
	<cfparam name="site" default="0">	
	<cfif isDefined("url.site")>		
		<cfset site=(url.site)>
	<cfelse>
		<cfset site=0>
	</cfif>
	
	<cfif isDefined("url.select1") and select1 EQ 1>		
		<cfset where='to_char(pubdate, *yyyy-mm-dd*) >= to_char(SYSDATE, *yyyy-mm-dd*)'>		
		 <cfset where=replace(where,"*","#Chr(39)#","all")> 
		
		 <cfset select1=1>
	<cfelseif isDefined("url.select1") and select1 EQ 2>		
		<cfset where='to_char(pubdate, *yyyy-mm-dd*) <= to_char(SYSDATE, *yyyy-mm-dd*)'>		
		 <cfset where=replace(where,"*","#Chr(39)#","all")> 
		
		 <cfset select1=2>
	<cfelseif isDefined("url.select1") and select1 EQ 3>		
		<cfset where='0=0'>		
		<cfset select1=3>
	<cfelse>
		<cfset where='to_char(pubdate, *yyyy-mm-dd*) >= to_char(SYSDATE, *yyyy-mm-dd*)'>		
		 <cfset where=replace(where,"*","#Chr(39)#","all")> 		
		 <cfset select1=1>
	</cfif>	
<!--end sort nav variables	-->
	<cfquery name="getnews" datasource="#application.datasource_select#">
		select news.newsid, shorttitle,DESC_CLOB,created,byline,pubdate,pulldate, firstname, lastname,user_admin, news.userid
				from CUNVMCS.news, CUNVMCS.users
				where	0=0 AND #preservesinglequotes(variables.where)# and news.isactive=1 and news.userid=users.userid			
		<cfif site is 1>and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')		
		<cfelseif site is 2>and to_char(pubdate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd')
		</cfif>
		<cfif url.criteria neq 'none'>and (LOWER(news.shorttitle) like LOWER('%#url.criteria#%') OR LOWER(news.longtitle) like LOWER('%#url.criteria#%') OR LOWER(users.firstname) like LOWER('%#url.criteria#%') OR LOWER(users.lastname) like LOWER('%#url.criteria#%') <cfif isdate(url.criteria)><cfset url.criteria=createodbcdate(url.criteria2)>or to_char(pubdate, 'yyyy-mm-dd') = to_char(#url.criteria2#, 'yyyy-mm-dd')</cfif>)</cfif>
		and  news.newsid IN (select news_ref.newsid from CUNVMCS.news_ref where news_ref.siteid in (#session.publish#) or news_ref.userid =#session.userid#)
				order by #variables.sortby#
	</cfquery>
	
<!--pagination variables-->		
	<cfif isDefined("url.startindex")>		
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
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>News</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<cfoutput><tr>
			<th <cfif variables.sortby eq 'shorttitle'>class ="selected"</cfif>><a href="#variables.location#?startindex=#variables.beginning#&select1=#variables.select1#&site=#variables.site#&sortby=shorttitle&criteria=#criteria#">Title</a></th>
			<th <cfif variables.sortby eq 'lastname'>class ="selected"</cfif>><a href="#variables.location#?startindex=#variables.beginning#&select1=#variables.select1#&site=#variables.site#&sortby=lastname&criteria=#criteria#">Author</a></th>
			<th <cfif variables.sortby eq 'pubdate desc'>class ="selected"</cfif>><a href="#variables.location#?startindex=#variables.beginning#&select1=#variables.select1#&site=#variables.site#&sortby=pubdate desc&criteria=#criteria#">Date Published</a></th>
			<th <cfif variables.sortby eq 'pulldate desc'>class ="selected"</cfif>><a href="#variables.location#?startindex=#variables.beginning#&select1=#variables.select1#&site=#variables.site#&sortby=pulldate desc&criteria=#criteria#">Date Pulled</a> </th>
			<th>Actions</th>
		</tr>			</cfoutput>
		<cfif getnews.recordcount lt 1>
			<tr>
				<td colspan="5">There are currently no records available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getnews" startrow="#variables.startindex#" maxrows="#variables.paginatelevel#">
				<form action="news_action.cfm?select1=3" method="post">
					<tr>
						<td><a href="##" class="date" onClick="window.open('news_view.cfm?newsid=#newsid#', 'mywindow', 'width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
						<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#lastname#, #firstname#</a>							
						<cfif getnews.user_admin is 1>*</cfif></td>
						<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
						<td>#dateformat(pulldate,"mm.dd.yyyy")#</td>
						<td nowrap>
						<input type="submit" name="control" value="control placement" class="button">							
						<cfif session.administrator is 1 or getnews.userid eq session.userid>
							<input type="submit" name="delete" value="delete" class="button" onClick="return confirmdelete()">
						</cfif>
					
							<input type="submit" name="rework" value="rework" class="button">
						</td>
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
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.beginning#&select1=#variables.select1#&site=#variables.site#&sortby=#variables.sortby#&criteria=#criteria#">first records</a>
				</cfif>
				<cfif variables.last gt 0><a href="#variables.location#?startindex=#variables.last#&select1=#variables.select1#&site=#variables.site#&sortby=#variables.sortby#&criteria=#criteria#">previous #variables.paginatelevel# records</a>
				</cfif>
				<cfif getnews.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.next#&select1=#variables.select1#&site=#variables.site#&sortby=#variables.sortby#&criteria=#criteria#">next #variables.paginatelevel# records</a>
				</cfif>
				
				<!---					
				<cfif getnews.recordcount gt variables.nextpub><a href="#variables.location#?startindex=#variables.end#&site=#variables.site#&sort=#variables.sort#">last records</a>
				</cfif>
				--->
				</td>
			</tr>
		</cfoutput>
		<!--end pagination table row-->
	</table>
<cfinclude template="/newsevents/secure/templates/filter.cfm">
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">