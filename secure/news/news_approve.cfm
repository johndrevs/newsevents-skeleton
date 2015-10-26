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
		<cfset sortby='lastname,firstname'>
	</cfif>
	
	<cfparam name="site" default="0">		
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
	<cfif isDefined("url.select1") and select1 EQ 1>		
		<cfset where='to_char(pubdate, *yyyy-mm-dd*) >= to_char(SYSDATE, *yyyy-mm-dd*)'>		
		 <cfset where=replace(where,"*","#Chr(39)#","all")> 
		
		 <cfset select1=1>
	<cfelseif isDefined("url.select1") and select1 EQ 2>		
		<cfset where='to_char(pubdate, *yyyy-mm-dd*) <= to_char(SYSDATE, *yyyy-mm-dd*)'>		
		 <cfset where=replace(where,"*","#Chr(39)#","all")> 
		
		 <cfset select1=2>
	<cfelse>
		<cfset where='0=0'>		
		<cfset select1=0>
	</cfif>	
<!--end sort nav variables	-->
	
	<cfquery name="getnews" datasource="#application.datasource_select#">
		SELECT      users.lastname, users.firstname, users.user_admin, sites.site_name, news.pubdate, news.pulldate, news.newsid, news.shorttitle, news.userid, news_refid
		FROM         CUNVMCS.news, CUNVMCS.news_ref, CUNVMCS.sites, CUNVMCS.users 
		WHERE       news.newsid = news_ref.newsid AND news_ref.siteid = sites.siteid AND news_ref.userid = users.userid and news_ref.news_ref_level=1 and sites.isactive=1 and news.isactive=1			
		<cfif site is 1>and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')		
		<cfelseif site is 2>and to_char(pubdate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd')
		</cfif>
		<cfif session.administrator eq 0>and  news_ref.siteid IN (#session.publish#)
		</cfif>
		order by #variables.sort#
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
	
<h2>Approve News Items</h2>
	<table width="95%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Title</th>
			<th>Author</th>
			<th>Date Published</th>
			<th>Date Pulled</th>
			<th>Site</th>
			<th>Actions</th>
		</tr>			
		<cfif getnews.recordcount is 0>
			<tr>
				<td colspan="6">There are no news items waiting to be published to your sites with this criteria</td>
			</tr>
		<cfelse>
			<cfoutput query="getnews" startrow="#variables.startindex#" maxrows="#variables.paginatelevel#">
				<form action="news_action.cfm" method="post">
					<tr>
						<td class="ViewLeft"><a class="date" href="##" onClick="window.open('news_view.cfm?newsid=#newsid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
						<td class="ViewLeft"><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a>							
						<cfif user_admin is 1>							*
						</cfif>
</td>
						<td class="ViewLeft">#dateformat(pubdate,"mm.dd.yyyy")#</td>
						<td class="ViewLeft">#dateformat(pulldate,"mm.dd.yyyy")#</td>
						<td class="ViewLeft">#site_name#</td>
						<td class="ViewLeft">
						<input type="submit" name="publish" value="publish to this site" class="button"></td>
					</tr>
					<input type="hidden" name="newsid" value="#newsid#">
					<input type="hidden" name="site_name" value="#site_name#">
					<input type="hidden" name="shorttitle" value="#shorttitle#">
					<input type="hidden" name="news_refid" value="#news_refid#">
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

<!--- begin filter dropdown --->
<cfinclude template="/newsevents/secure/templates/filter.cfm">
<!--- end filter dropdown --->

<cfinclude template="../templates/footer.cfm">