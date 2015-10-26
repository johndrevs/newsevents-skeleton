<cfquery name="show_user" datasource="#application.datasource_select#">
select *
from CUNVMCS.users
WHERE user_name='#url.user_name#'
</cfquery>


<form name="dlt_usr" action="dlt_usr.cfm" method="post">
   <cfoutput query="show_user">
   
	#lastname#, #firstname#<br>
	#email#<br>
	#user_name#
	<br><br>
    Delete? <input type="checkbox" name="DeleteID" value="#user_name#"><br><br>

    </cfoutput>    

    <input type="submit" Value="Delete Record">
    </form>