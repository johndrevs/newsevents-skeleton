
<cfoutput>
	<table width="100%">
		<tr>
			<td colspan="2" class="ViewLeft">
			<span class="date"><strong>Description:</strong></span>#variables.description#</td>
		</tr>
		<cfif parameterexists(lastname) and lastname is not '' and firstname is not ''>
			<tr>
				<td class="ViewLeft">
				<span class="comments"><strong>Created by:</strong></span></td>
				<td class="ViewLeft"><a href="##" class="author" onClick="window.open('../admin/users_view.cfm?userid=#userid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#firstname# #lastname#</a><cfif user_admin is 1>*</cfif> on #dateformat(variables.created, "mm.dd.yyyy")#</td>
			</tr>
		</cfif>
		<cfif pulldate is not ''>
			<tr>
				<td class="ViewLeft">
				<span class="comments"><strong>Publish Date:</strong></span></td>
				<td class="ViewLeft">#dateformat(variables.pubdate, "mm.dd.yyyy")#</td>
			</tr>
		</cfif>
		<cfif pubdate is not ''>
			<tr>
				<td class="ViewLeft">
				<span class="comments"><strong>Pull Date:</strong></span></td>
				<td class="ViewLeft">#dateformat(variables.pulldate, "mm.dd.yyyy")#</td>
			</tr>
		</cfif>
		<cfif parameterexists (lastmod) and lastmod is not ''>
			<tr>
				<td class="ViewLeft">
				<span class="comments"><strong>Last Modified:</strong></span></td>
				<td class="ViewLeft">#dateformat(variables.lastmod, "mm.dd.yyyy")#</td>
			</tr>
		</cfif>
	</table>
	
	<strong>#variables.longtitle#</strong><br/>
#variables.shorttitle#
<p>
<strong>#variables.byline#</strong><br/>
#variables.bylinetitle#<br/>
<p>
<strong>#variables.dateline#</strong> -- #variables.formatbody#
</cfoutput>
