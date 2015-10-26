<cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_name
		FROM CUNVMCS.CATEGORIES
		WHERE CATEGORY_ID=#url.category_id#
</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Faculty Categories</h2>

	<cfoutput><form action="faculty_category_editaction.cfm" method="post">
				
					<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
						<tr><td>Category Name:</td><td><input type="text" name="category_name" value="#getcategory.category_name#"></td></tr>
					</table>
				<input type="hidden" name="category_id" value="#url.category_id#">
				<input type="submit" value="save" class="button">
			</form></cfoutput>
<cfinclude template="/newsevents/secure/templates/footer.cfm">