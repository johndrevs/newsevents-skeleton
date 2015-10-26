<cfquery name="show_user" datasource="#application.datasource_select#">
select firstname,lastname,email,userid
from CUNVMCS.users
where userid=lruiz1
</cfquery>


<form name="dlt_usr" action="dlt_usr.cfm" method="post">
   <cfoutput query="show_user">
   
	#lastname#, #firstname#<br>
	#email#<br>
	#userid#
	<br><br>
    <input type="checkbox" name="DeleteID" value="#userid#"><br><br>

    </cfoutput>    
    
    </table>
    
    <input type="submit" Value="Delete Record">
    </form>