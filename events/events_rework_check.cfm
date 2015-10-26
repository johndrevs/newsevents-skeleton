
<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="getpublish" datasource="#application.datasource_select#">
SELECT      events_ref_level,site_name,userid
FROM         CUNVMCS.events_ref,CUNVMCS.sites 
where eventid=#url.eventid# and events_ref_level=2 and events_ref.siteid=sites.siteid
</cfquery>


<cfset publishby=valuelist(getpublish.userid)>

<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>Rework Event</h2>		
	<cfif getpublish.recordcount gt 0>
		<p>This event is published to the following sites:<br />

			<cfoutput query="getpublish">
				#site_name#
				<br/>
			</cfoutput>
		</p>
		<cfoutput>
			<cfif session.administrator is 1>In order to rework the event you will need to release it from all sites by clicking on the button below.

					<form action="events_release.cfm" method="post">
						<input type="hidden" name="eventid" value="#eventid#">
						<input type="submit" name="rework" value="release from all sites" class="button">
					</form>	
					<p>Please be advised that by releasing from all sites you are removing it from publication. Once the item has been reworked, you will need to place it again.</p>
						
			<cfelse>
<p>In order to rework this event it must be released by the system administrator. To contact the system administrator, please <a href="mailto:#APP_ADMINEMAIL#">click here</a>.</p>
			</cfif>
		</cfoutput>
	<cfelse>
		<cflocation url="events_rework.cfm?eventid=#url.eventid#" addtoken="No">
	</cfif>

	
<cfinclude template="/newsevents/templates_new/footer.cfm">
