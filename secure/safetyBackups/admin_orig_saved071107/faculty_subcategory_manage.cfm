<cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT category_id,category_name
		FROM CUNVMCS.CATEGORIES
		WHERE CATEGORIES.CATEGORY_ID=#url.category_id#
</cfquery>
<cfquery name="getsubcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_id,CATEGORIES.category_name, CATEGORIES_REF_ID
		FROM CUNVMCS.CATEGORIES, CUNVMCS.CATEGORIES_REF
		WHERE CATEGORIES.SUB=1 AND CATEGORIES.ACTIVE=1 AND CATEGORIES_REF.CATEGORY_ID=#getcategory.category_id# AND CATEGORIES_REF.SUBCATEGORY_ID=CATEGORIES.CATEGORY_ID AND CATEGORIES_REF.ACTIVE=1
order by category_name
</cfquery>
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Manage Sub Categories</h2>

	<cfoutput query="getcategory">
		<p><strong>Subcategories for #category_name#</strong></p>
	</cfoutput>
	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Major Category</th>
			<th>Actions</th>
		</tr>
		<cfoutput query="getsubcategory">
			<tr>
				<td>#category_name#</td>
				<td><a href="faculty_subcategory_delete.cfm?categories_ref_id=#categories_ref_id#">remove subcategory from main category</a> | <a href="faculty_category_delete.cfm?category_id=#category_id#">delete subcategory</a></td></th>
		</cfoutput>
		<cfoutput>
			<tr>
				<td colspan="2"><a href="faculty_category_addexisting.cfm?category_id=#url.category_id#">Add an Existing Subcategory</a></td>
			</tr>
		</cfoutput>
		<tr>
			<td colspan="2">Add a  New Subcategory</td>
		</tr>
		<cfoutput>
			<tr>
				<td colspan="2">
				<form action="faculty_category_add.cfm" method="post">
					<input type="text" name="category_name">
					<input type="hidden" name="category_id" value="#url.category_id#">
					<input type="hidden" name="sub" value="1">
					<input type="submit" value="add">
				</form></td>
			</tr>
		</cfoutput>
	</table>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
