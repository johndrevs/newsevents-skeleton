<cfquery name="users" datasource="#application.datasource_update#">
update CUNVMCS.users
set isactive=1
where userid=#url.userid#
</cfquery>

<cfinclude template="users_list.cfm">