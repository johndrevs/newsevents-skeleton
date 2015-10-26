<cfinclude template="/newsevents/templates/securityheader.cfm">

<CFQUERY NAME="getsiteinfo" DATASOURCE="#application.datasource_select#">
SELECT      site_name, uri, description, maxrows
FROM         CUNVMCS.sites 
where siteid=#url.siteid#
</CFQUERY>
<cfset daterangebeg=#now()#>
<cfset daterangeend=#dateadd('yyyy',100,daterangebeg)#>
	
	<cfquery name="getevents" datasource="#application.datasource_select#" maxrows="#getsiteinfo.maxrows#">
select events_tbl.eventid,shortdesc
from CUNVMCS.events_tbl, CUNVMCS.events_ref
		where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=#siteid# and events_ref.events_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')</cfquery>

	<cfquery name="geteventsmax" datasource="#application.datasource_select#">
select events_tbl.eventid
from CUNVMCS.events_tbl, CUNVMCS.events_ref
		where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=#siteid# and events_ref.events_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')</cfquery>

<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">
<cfoutput>
			<h2>View Events by Site</h2>
				<p>The following events will be displayed on the #getsiteinfo.site_name# site. Events are displayed in sequential order based on the start date.</p>

<strong>#getsiteinfo.site_name#</strong></cfoutput><br/>
	<table width="200" cellspacing="1" cellpadding="0" bgcolor="#C0C0C0">
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF">
				<cfif getevents.recordcount lt 1>
					<tr>
						<td>There are no events currently active for this site</td>
					</tr>
				<cfelse>
				<cfoutput query="getevents">
					<tr>
						<td><a href="##" onClick="window.open('events_view.cfm?eventid=#eventid#','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">#shortdesc#</a>
						</td>
					</tr></cfoutput>
				</cfif>
				</table>
			</td>
		</tr>
	</table>
<cfoutput>There are currently #geteventsmax.recordcount# events active for this site.<br/>
The syndication for this site publishes the #getsiteinfo.maxrows# top events.
<cfif (geteventsmax.recordcount-getsiteinfo.maxrows) lte 0>There are still #evaluate((geteventsmax.recordcount-getsiteinfo.maxrows)*-1)# places to be filled.<cfelse> There are #evaluate(geteventsmax.recordcount-getsiteinfo.maxrows)# news items on deck.</cfif></cfoutput>
		
<cfinclude template="/newsevents/templates_new/footer.cfm">