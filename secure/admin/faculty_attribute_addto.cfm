<cfquery name="read_swbd" datasource="#request.datasource_read#" maxrows=1>
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person

			  		 
WHERE PERSON.LID = '#url.LID#'</cfquery> 

<cfquery name="getavailable" datasource="#application.datasource_select#">
SELECT CATEGORY_NAME, CATEGORY_ID
 FROM 
CUNVMCS.CATEGORIES
WHERE CATEGORY_ID NOT IN (SELECT CATEGORY_ID FROM CUNVMCS.FACULTY_REF WHERE FACULTY_ID=#URL.FACULTY_ID# AND ACTIVE=1) AND ACTIVE=1 AND SUB=1
ORDER BY CATEGORY_NAME
</cfquery>	

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Manage Expert Categories</h2>
<cfoutput query="read_swbd">
<p>Please choose a category to attribute to #FIRST_NAME# #LAST_NAME#	</cfoutput>
<form action="faculty_attribute_addtoaction.cfm" method="post"><table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Major Category</th>
			<th>Actions</th>
		</tr>

	
	

	<cfoutput query="getavailable"><tr><td>#category_name#<!--- #category_id# ---></td><td>add to expert <input type="checkbox" name="category_id" value="#category_id#">| <a href="faculty_category_delete.cfm?category_id=#category_id#">delete subcategory</a></td></th></cfoutput>

</table><cfoutput><input type="hidden" name="lid" value="#url.lid#"><input type="hidden" name="faculty_id" value="#url.faculty_id#"><input type="submit" value="save" class="button"></cfoutput></form></p>
<cfinclude template="/newsevents/secure/templates/footer.cfm">