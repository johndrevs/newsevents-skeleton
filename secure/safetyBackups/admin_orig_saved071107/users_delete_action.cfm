
<cfquery name="users" datasource="#application.datasource_update#">
update CUNVMCS.users
set isactive=0
where userid=#form.itemid#
</cfquery>

<cfinclude template="users_list.cfm">