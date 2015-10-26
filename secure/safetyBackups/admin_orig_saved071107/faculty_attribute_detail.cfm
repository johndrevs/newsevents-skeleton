<cfquery name="getfaculty" datasource="#request.datasource_read#" maxrows=1>
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person
WHERE LID = '#url.LID#'</cfquery> 

<cfquery name="getfaculty2" datasource="#application.datasource_select#" maxrows="1">
SELECT FACULTY.FACULTY_ID,faculty_detail
		FROM CUNVMCS.FACULTY
WHERE LID ='#url.lid#'
</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

	<cfoutput query="getfaculty">
<h2>Manage #first_name# #last_name#'s Profile</h2><cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_name,CATEGORIES.category_ID, FACULTY_REF.FACULTY_ID
		FROM CUNVMCS.CATEGORIES, CUNVMCS.FACULTY_REF
		WHERE FACULTY_REF.FACULTY_ID=#getfaculty2.faculty_id# AND FACULTY_REF.CATEGORY_ID=CATEGORIES.CATEGORY_ID AND FACULTY_REF.ACTIVE=1
		ORDER by category_name
</cfquery>

<p><strong>Expert Information</strong>
		<form action="faculty_attribute_reworkaction.cfm" method="post" enctype="multipart/form-data">
			<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
				<tr>
					<td>Detail Information
					<br/>
					<textarea cols="45" rows="15" name="faculty_detail">#getfaculty2.faculty_detail#</textarea></td>
				</tr>
				<tr>
					<td>						
					<cfif fileexists('#application.dir#/public/images/#url.LID#.jpg')><img src="/newsevents/public/images/#url.LID#.jpg" alt="" border="0">
						<br/>
						<br/><a href="faculty_attribute_picdelete.cfm?id=#url.LID#">delete picture</a>
					<cfelse>
To upload a file for display with this expert please identify it by clicking on browse below:
						<br/>
						<input type="file" name="image">
					</cfif>
					<input type="hidden" name="faculty_id" value="#getfaculty2.faculty_id#">
					<input type="hidden" name="LID" value="#url.LID#"></td>
				</tr>
				<tr>
					<td align="right">
					<div align="right">
						<input type="submit" value="Save" class="button">
					</div></td>
				</tr>
			</table>
		</form></p>
		
<p><strong>Expert's Assigned Categories</strong>
		<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Category Name</th>
			<th>Actions</th>
		</tr>
			<cfloop query="getcategory">
				<tr>
					<td>#category_name#<!--- #faculty_id# ---></td>
					<td><a href="faculty_attribute_delete.cfm?faculty_id=#faculty_id#&category_id=#category_id#">remove category</a></td>
				</tr>
			</cfloop>
			<tr>
				<td>&nbsp;</td>
				<td><a href="faculty_attribute_addto.cfm?LID=#url.LID#&faculty_id=#getfaculty2.faculty_id#">add a category</a></td>
			</tr>
	</cfoutput>
</table></p>

<cfinclude template="/newsevents/secure/templates/footer.cfm">
