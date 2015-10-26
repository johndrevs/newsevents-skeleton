


<cfquery name="getsiteaccess" datasource="#application.datasource_select#">
SELECT      distinct sites.siteid,sites.site_name
FROM         CUNVMCS.sites 
where siteid in (#session.publish#)and isactive=1
</cfquery>

<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Control News Items by Site</h2>
<p>You have access to control the presentation order of news items on the following sites. Choose the site you would like to control from the list below.</p>
	
	<table width="55%" border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Site</th>
			<th>Actions</th>
		</tr>			
		<cfif getsiteaccess.recordcount lt 1>
			<tr>
				<td colspan="2">There are currently no sites available for your control</td>
			</tr>
		<cfelse>
			<cfoutput query="getsiteaccess">
				<form action="news_site_view.cfm" method="post">
					<tr>
						<td>#site_name#</td>
						<td><input type="submit" name="view" value="view site" class="button"></td>
					</tr>
					<input type="hidden" name="siteid" value="#siteid#">
				</form>
			</cfoutput>
		</cfif>
	</table>
	
<cfinclude template="../templates/footer.cfm">