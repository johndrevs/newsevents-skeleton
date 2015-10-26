<CFIF IsDefined("form.dlt_usr")>
<cfquery name="users" datasource="#application.datasource_update#">
    DELETE FROM CUNVMCS.users
	WHERE user_name = '#form.DeleteID#'  
   </CFQUERY>
</CFIF>

<cfinclude template="users_list.cfm">