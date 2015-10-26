
<div id="sidebar">
<h2><a href="##">Status</a></h2>
	<div class="blog">
<h3><a href="##">User Options and Status</a></h3>
		<cfoutput>
			<table>
				<tr>
					<td valign="top">You are currently logged in as:</td>
					<td valign="top">#session.firstname# #session.lastname#
					<cfif session.administrator is 1>(administrator)
					</cfif>
					</td>
				</tr>
				<cfif listlen(session.publishname) gt 0>
					<tr>
						<td valign="top">You can <a href="#variables.location#?showdef=yes">publish</a> news and events to:</td>
						<td valign="top">
						<cfloop list="#session.publishname#" index="i">
						#i#<br/>
						</cfloop>
						</td>
					</tr>
				</cfif>
				<cfif listlen(session.postname) gt 0>
					<tr>
						<td valign="top">You can <a href="#variables.location#?showdef=yes">post</a> news and events to:</td>
						<td valign="top">
						<cfloop list="#session.postname#" index="i">
						#i#<br/>
						</cfloop>
						</td>
					</tr>
				</cfif>
			</table>
		</cfoutput>
	</div>
	<cfif (parameterexists(url.showdef) and url.showdef is 'no')>
	<cfelseif location contains 'board' or location contains 'view' or location contains 'ews_action' or (parameterexists(url.showdef) and url.showdef is 'yes')>
		<div class="blog" id="whatsnew2928">
<h3>Definitions</h3>
<p>
Important to the understanding of the News and Events system are the definitions of post and publish:
			<dl>
				<dt><strong>Publish</strong></dt>
				<dd>Publish access gives a user the capability to directly publish news or events to a site's news and events page. Access to publish is determined based on the user's priviledges for each individual site.</dd>
				<dd>A news item or events who's publish or pull date surrounds the current date and time and has publish status will be displayed on the site</dd>
				<dt><strong>Post</strong></dt>
				<dd>Post access gives a user the capability to submit a news item or event TO BE published by somebody with publish access for a site.</dd>
				<dd>A news item or events who's publish or pull date surrounds the current date and time and has ONLY been posted to the system will not be displayed on a site.</dd>
			</dl></p>
			<cfoutput>
<a href="#variables.location#?showdef=no">hide definitions</a>
			</cfoutput>
		</div>
	</cfif>
	
<p class="archive"><a href="/newsevents/index.cfm" class="more">News and Events Dashboard</a>  <a href="/newsevents/logout.cfm" class="more">Logout of News and Events </a>
</div>
