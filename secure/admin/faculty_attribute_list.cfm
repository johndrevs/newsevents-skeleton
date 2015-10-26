<cfquery name="getfaculty" datasource="#application.datasource_select#">
SELECT FACULTY.LID
		FROM CUNVMCS.FACULTY

</cfquery>	
<cfset facultylist=valuelist(getfaculty.LID)>	
<CFQUERY NAME="read_swbd" datasource="#request.datasource_read#">
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person
WHERE LID IN (#quotedvaluelist(getfaculty.LID)#)

group by LID, LAST_NAME, FIRST_NAME
order by LAST_NAME
</CFQUERY>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">


<h2>Manage Faculty</h2>
<p>Please choose a faculty member to manage.
<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Faculty Name</th>
			<th>Actions</th>
		</tr>
<cfoutput query="read_swbd">
 <tr>
 	<td>#LAST_NAME#, #FIRST_NAME#</td><td><a href="faculty_attribute_detail.cfm?LID=#LID#">manage</a> | <a href="faculty_delete.cfm?LID=#LID#"  onclick="return confirmdelete()">delete</a></td></cfoutput>
</table></p>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
