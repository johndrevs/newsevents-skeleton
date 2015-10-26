<cfquery name="get_password" datasource="#application.datasource_select#" dbtype="ODBC">
SELECT CUNVMCS.USERS.email, CUNVMCS.USERS.passcode,CUNVMCS.USERS.USER_NAME
FROM CUNVMCS.USERS
WHERE CUNVMCS.USERS.USER_NAME='#trim(FORM.user_name)#' AND CUNVMCS.USERS.ISACTIVE=1
</cfquery>

<cfif #GET_PASSWORD.RECORDCOUNT# EQ 0>
	<cflocation url="forgot.cfm?message=There is no record of the user account you entered in the system. Please try again." addtoken="No">
<cfelse>
<cfmail to="#get_password.email#" from="#application.adminemail#" subject="News and Events Password">
A request for your password has been sent to the News and Events System.

Your Username is: #get_password.USER_NAME#
Your Passcode is: #get_password.passcode#

If you continue to have problems loggin in, please contact #application.adminemail# for further assistance.
</cfmail>

	<cflocation url="login.cfm?message=Your passcode has been sent to your email address of record. " addtoken="No">
</cfif>