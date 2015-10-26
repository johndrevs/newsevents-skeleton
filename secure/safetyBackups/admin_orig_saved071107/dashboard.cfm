


<cfquery name="getsiteaccess" datasource="#application.datasource_select#">
SELECT      sites.site_name, sites.siteid, SITES.uri
FROM CUNVMCS.SITES
WHERE     sites.isactive=1 and (sites.siteid in (#session.publish#) )
order by site_name
</cfquery>

<cfquery name="getmessages" datasource="#application.datasource_select#" maxrows="5">
SELECT      messages.subject, messages.content, messages.userid, messages.date_sent, messages.messageID, users.lastname, users.firstname,users.userid
FROM         CUNVMCS.messages, CUNVMCS.users 
WHERE       messages.userid = users.userid and messages.isactive=1
order by date_sent desc
</cfquery>

<cfset daterangebeg=#now()#>
<cfset daterangeend=#dateadd('yyyy',0,daterangebeg)#>



<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

	<cfoutput>
<h2>Welcome #session.firstname# #session.lastname#</h2>
	</cfoutput>
	
	<br/>
<h3>News and Events Dashboard</h3>

	<table width="65%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">		
		<cfif getmessages.recordcount lt 1>
			<tr>
				<td colspan="3">There are currently no messages available</td>
			</tr>
		<cfelse>
			<cfoutput query="getmessages">
			<cfif currentrow is 1>
					<tr>
						<td><strong>#getmessages.subject#</strong>&nbsp;&nbsp;
						<br/>#content#
						<br/><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname#  #lastname#</a> (#dateformat(date_sent, "mmm. d")#, #timeformat(date_sent, "h:mm tt")#)</td>
					</tr>
				<cfelse>
					<tr>
						<td>#currentrow#&nbsp;&nbsp;<a href="messages_view.cfm?messageid=#messageid#">#getmessages.subject#</a> &nbsp;&nbsp;<a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname#  #lastname#</a> (#dateformat(date_sent, "mmm. d")#, #timeformat(date_sent, "h:mm tt")#)</td>
					</tr>
				</cfif>
			</cfoutput>
		</cfif>
	</table>
	
	<table width="65%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Site</th>
			<th>Active Events</th>
			<th>Active News Items</th>
		</tr>			
		<cfif getsiteaccess.recordcount lt 1>
			<tr>
				<td colspan="3">There are currently no sites available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getsiteaccess">
			
<cfquery datasource="#application.datasource_select#" name="getevent">
SELECT distinct events_tbl.eventid
from CUNVMCS.events_tbl, CUNVMCS.events_ref
where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=#siteid# and events_ref.events_ref_level =2
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')
</cfquery>

<cfquery datasource="#application.datasource_select#" name="getnews">
SELECT distinct news.newsid, priority
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	
order by priority
</cfquery>
				<tr>
					<td><a href="##" class="author" onClick="window.open('../admin/sites_view.cfm?siteid=#siteid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#site_name#</a></td>
					<td>&nbsp;&nbsp;#getevent.recordcount#</td>
					<td>&nbsp;&nbsp;#getnews.recordcount#</td>
				</tr>
			</cfoutput>
		</cfif>
	</table>
	
	<table width="65%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="27" bgcolor="#990033"><img src="/newsevents/images/whats_new_icon2.gif" width="27" height="30" alt=""></td>
			<td width="100%" bgcolor="#990033" class="accessbar">Access</td>			
		</tr>
		<tr>
			<td colspan="2" bgcolor="#FFFFFF"><img src="/newsevents/images/spacer.gif" width="1" height="2" alt=""></td>
		</tr>
		<tr>
			<td colspan="2">
			<cfoutput>
				<table width="100%" class="tabulargrey">
					<tr>
						<td><strong>You are logged in as:</strong><br/>
<strong>#session.firstname# #session.lastname#</strong>							
						<cfif session.administrator is 1>(administrator)</cfif></td>							
						<cfif listlen(session.publishname) gt 0>
							<td valign="top"><strong>You have <a href="#variables.location#?showdef=yes">publish</a> access to:</strong><br/>
							<cfloop list="#session.publishname#" index="i">
								#i#
								<br/>
							</cfloop></td>
						</cfif>
						
							<td valign="top"><strong>You have <a href="#variables.location#?showdef=yes">post</a> access to:</strong><br/>
							All Active Sites</td>
					
					</tr>
				</table>
			</cfoutput>
		</tr>
					
			<cfif (isDefined("url.showdef") and url.showdef is 'yes')>
			<tr>
			<td colspan="2"><table width="100%" class="tabulargrey">
<tr>
	<td><h3>Definitions</h3>
Important to the understanding of the News and Events system are the definitions of post and publish:
				<dl>
					<dt><strong>Publish</strong></dt>
					<dd>Publish access gives a user the capability to directly publish news or events to a site's news and events page. Access to publish is determined based on the user's priviledges for each individual site.</dd>
					<dd>A news item or events who's publish or pull date surrounds the current date and time and has publish status will be displayed on the site</dd>
					<dt><strong>Post</strong></dt>
					<dd>Post access gives a user the capability to submit a news item or event TO BE published by somebody with publish access for a site.</dd>
					<dd>A news item or events who's publish or pull date surrounds the current date and time and has ONLY been posted to the system will not be displayed on a site.</dd>
				</dl>
				<cfoutput>
<a href="#variables.location#?showdef=no">hide definitions</a>
				</cfoutput>			</td>
</tr>
</table>
</td></tr>
			<cfelseif (isDefined("url.showdef") and url.showdef is 'no')>
			</cfif>
			</td>
		</tr>
	</table>

<cfinclude template="/newsevents/secure/templates/footer.cfm">