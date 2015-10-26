<cfquery name="getfaculty" datasource="#request.datasource_read#" maxrows=1>
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person
WHERE LID = '#url.LID#'</cfquery> 

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

Please enter more information:

<cfoutput query="getfaculty"><form action="faculty_add_action.cfm" method="post" enctype="multipart/form-data"><table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
<tr>
	<td>Name:</td>
	<td>#first_name# #last_name#</td>
</tr>
<tr>
	<td>Detail Information</td>
	<td><textarea cols="45" rows="15" name="faculty_detail"></textarea></td>
</tr>
<tr>
	<td>Photo:</td>
	<td><input type="file" name="image"><br /><input type="submit" value="Add Expert to the System"></td>
</tr>
</table><input type="hidden" name="LID" value="#url.LID#"></form></cfoutput>
<cfinclude template="/newsevents/secure/templates/footer.cfm">