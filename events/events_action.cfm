<cfset url.eventid=#form.eventid#>



<cfif parameterexists (form.rework)>
<cfinclude template="events_rework_check.cfm">

<cfelseif  parameterexists (form.delete)>
<cfinclude template="events_delete_action.cfm">

<cfelseif  parameterexists (form.control)>
<cfinclude template="events_placement.cfm">

<cfelseif  parameterexists (form.publish)>
<cfinclude template="events_publish.cfm">

<cfelseif  parameterexists (form.publishsite)>
<cfinclude template="events_publish.cfm">

	<cfelse>
		dda
</cfif>