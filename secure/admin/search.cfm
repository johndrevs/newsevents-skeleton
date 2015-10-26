


<cfquery name="getnews" datasource="#application.datasource_select#">
select news.newsid, shorttitle,DESC_CLOB,created,byline,pubdate,pulldate, firstname, lastname,user_admin, news.userid
		from CUNVMCS.news, CUNVMCS.users
		where	0=0 AND (shorttitle like '%#form.query#%' or longtitle like '%#form.query#%' or DESC_CLOB like '%#form.query#%' or byline like '%#form.query#%' or content like '%#form.query#%') and news.isactive=1 and news.userid=users.userid	
		and  news.newsid IN (select news_ref.newsid from CUNVMCS.news_ref where news_ref.siteid in (#session.publish#) or news_ref.userid =#session.userid#)
</cfquery>


<cfquery name="getevents" datasource="#application.datasource_select#">
SELECT startdate, pubdate, shortdesc, eventID,firstname,lastname,user_admin,events_tbl.userid
		FROM CUNVMCS.events_tbl, CUNVMCS.users
		where	0=0 AND events_tbl.isactive=1 AND (shortdesc like '%#form.query#%' or longdesc like '%#form.query#%' or INFO_CLOB like '%#form.query#%' or specificlocation like '%#form.query#%') and events_tbl.userid=users.userid
		and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where events_ref.siteid in (#session.publish#) or events_ref.userid =#session.userid#)
</cfquery>


<div id="content">
	
<h2>Search</h2><br/>
		<div id="feed">
<cfoutput><p>The following news items and events were returned for the search "#form.query#".</p></cfoutput>
		</div>
		
<h2>News</h2><br/>
		<table width="100%">
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Date Published</th>
				<th>Date Pulled</th>
				<th>Actions</th>
			</tr>
			<cfif getnews.recordcount lt 1>
				<tr>
					<td colspan="5">There are currently no records that match your criteria.</td>
				</tr>
			<cfelse>
				<cfoutput query="getnews">
					<form action="../news/news_action.cfm" method="post">
						<tr>
							<td><a href="##" class="date" onClick="window.open('../news/news_view.cfm?newsid=#newsid#', 'mywindow', 'width=640,height=480,scrollbars=yes,resizable=yes')">#shorttitle#</a></td>
							<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a>
							<cfif user_admin is 1>*
							</cfif>
</td>
							<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
							<td>#dateformat(pulldate,"mm.dd.yyyy")#</td>
							<td><input type="submit" name="control" value="control placement" class="button">
							<cfif session.administrator is 1 or getnews.userid eq session.userid><input type="submit" name="delete" value="delete" class="button" onClick="return confirmdelete()">
							</cfif>
							<cfif session.administrator is 1 or getnews.userid eq session.userid><input type="submit" name="rework" value="rework" class="button">
							</cfif>
</td>
						</tr><input type="hidden" name="newsid" value="#newsid#">
					</form>
				</cfoutput>
			</cfif>
		</table>
		
<h2>Events</h2><br/>
		<table width="100%">
			<tr>
				<th>Event</th>
				<th>Author</th>
				<th>Event Date</th>
				<th>Publish Date</th>
				<th>Actions</th>
			</tr>
			<cfif getevents.recordcount lt 1>
				<tr>
					<td colspan="5">There are currently no records that match your criteria.</td>
				</tr>
			<cfelse>
				<cfoutput query="getevents">
					<form action="events_action.cfm" method="post">
						<tr>
							<td><a class="date" href="##" onClick="window.open('../events/events_view.cfm?eventid=#eventid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shortdesc#</a></td>
							<td><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a>
							<cfif user_admin is 1>*
							</cfif>
</td>
							<td>#dateformat(startdate,"mm.dd.yyyy")#</td>
							<td>#dateformat(pubdate,"mm.dd.yyyy")#</td>
							<td><input type="submit" name="control" value="control placement" class="button">
							<cfif session.administrator is 1 or getevents.userid eq session.userid><input type="submit" name="delete" value="delete" class="button" onClick="return confirmdelete()">
							</cfif>
							<cfif session.administrator is 1 or getevents.userid eq session.userid><input type="submit" name="rework" value="rework" class="button">
							</cfif>
</td>
						</tr><input type="hidden" name="eventid" value="#eventid#">
					</form>
				</cfoutput>
			</cfif>
		</table>
	</div>
</div>


<cfinclude template="../templates/access_sidebar.cfm">
<cfinclude template="../templates/footer.cfm">
<cfinclude template="../templates/globalnav.cfm">
</body>
</html>
