<cfif  parameterexists (form.publishsite)>
<cfset url.level=2>
<cfelseif  parameterexists (form.reject)>
<cfset url.level=0>
<cfelseif  parameterexists (form.unpublish)>
<cfset url.level=1>
<cfelseif  parameterexists (form.unpost)>
<cfset url.level=4>
</cfif>


<cfquery name="levelchange" datasource="#application.datasource_update#">
UPDATE CUNVMCS.events_ref
set events_ref_level=#url.level#, actiondate=SYSDATE
where event_refid=#form.event_refid#
</cfquery>


<Cfset notify=#form.notify#>
<cfinclude template="../templates/notify.cfm">


<cflocation url="events_placement.cfm?eventid=#form.eventid#" addtoken="No">