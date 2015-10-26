
<cfquery name="messages" datasource="#application.datasource_update#">
update CUNVMCS.messages
set isactive=0
where messageid=#form.itemid#
</cfquery>
<cflocation url="messages_list.cfm" addtoken="No">