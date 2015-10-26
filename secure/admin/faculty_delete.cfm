<cfquery name="getfaculty" datasource="#application.datasource_select#">
SELECT FACULTY.FACULTY_ID
		FROM CUNVMCS.FACULTY
WHERE LID='#url.LID#'
</cfquery>	

<cfquery name="deletefrommain" datasource="#application.datasource_update#">
delete 
		FROM CUNVMCS.FACULTY_REF
WHERE FACULTY_ID=#getfaculty.faculty_id#
</cfquery>	

<cfquery name="deletefrommain" datasource="#application.datasource_update#">
delete 
		FROM CUNVMCS.FACULTY
WHERE FACULTY_ID=#getfaculty.faculty_id#
</cfquery>	