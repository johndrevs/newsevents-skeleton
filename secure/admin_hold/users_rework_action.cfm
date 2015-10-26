<cfif '#form.passcode#' EQ '#form.passcode2#'>
<cfquery name="updateevents" datasource="#application.datasource_update#">
update     CUNVMCS.users
SET       user_name='#form.user_name#', lastname='#form.lastname#', firstname='#form.firstname#', email='#form.email#', user_admin=#form.user_admin#, passcode='#form.passcode#'
where userid=#form.userid#
</cfquery>




<cflocation url="../admin/" addtoken="No">
<cfelse>
The passcodes you entered do not match
</cfif>