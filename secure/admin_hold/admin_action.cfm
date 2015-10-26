<cfset url.itemid=#form.itemid#>



<cfif  parameterexists (form.locationdelete)>
<cfinclude template="locations_delete_action.cfm">

<cfelseif  parameterexists (form.sitedelete)>
<cfinclude template="sites_delete_action.cfm">

<cfelseif  parameterexists (form.siteedit)>
<cfinclude template="sites_rework.cfm">

<cfelseif  parameterexists (form.access)>
<cfinclude template="users_authorization.cfm">

<cfelseif  parameterexists (form.delete_user)>
<cfinclude template="users_delete_action.cfm">

<cfelseif  parameterexists (form.delete_message)>
<cfinclude template="messages_delete_action.cfm">

<cfelseif parameterexists (form.rework)>
<cfinclude template="users_rework.cfm">


	<cfelse>
		dda
</cfif>