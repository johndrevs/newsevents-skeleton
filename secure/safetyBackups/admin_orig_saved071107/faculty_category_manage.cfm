		
	<cfif parameterexists(url.category)>
	<cfelse>
		<cfset url.category=0>
	</cfif>
	
<cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT category_id,category_name
		FROM CUNVMCS.CATEGORIES
		WHERE CATEGORIES.SUB=#url.category# and ACTIVE=1
		order by category_name
</cfquery>

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Faculty Main Categories</h2>

	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Major Category</th>
			<th>Actions</th>
		</tr>
		<cfoutput query="getcategory">
			<tr>
				<td>#category_name#</td>
				<td><a href="faculty_category_delete.cfm?category_id=#category_id#">delete category</a> | <a href="faculty_subcategory_manage.cfm?category_id=#category_id#">manage subcategories</a></td>
			</tr>
		</cfoutput>
		<tr>
			<td>Add a Category</td>
			<td><form action="faculty_category_add.cfm" method="post">
				<input type="text" name="category_name">
				<input type="hidden" name="sub" value="0">
				<input type="submit" value="Add" class="button">
			</form></td>
		</tr>
	</table>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
