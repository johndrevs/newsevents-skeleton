<cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT subcategory_id
FROM CUNVMCS.CATEGORIES_REF
where category_ID=#url.category_id# AND ACTIVE=1
</cfquery>
			<cfif getcategory.recordcount gt 0>	
	<cfset categorylist=#quotedvaluelist(getcategory.subcategory_ID)#>
	<cfelse>
		<cfset categorylist="'0','0'">
	</cfif>
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Add Existing Subcategories</h2>
	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Subcategory</th>
			<th>Actions</th>
		</tr>	<!---
		<li><a href="faculty_category.cfm?category_id=#category_id#">#category_name#</a></li>--->			
		<cfif parameterexists(url.category_id) and category_id EQ #url.category_id#><cfquery name="getsubcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_id,CATEGORIES.category_name
		FROM CUNVMCS.CATEGORIES
		WHERE CATEGORY_ID NOT IN(#preservesinglequotes(categorylist)#) AND ACTIVE=1 AND SUB=1
ORDER by CATEGORY_NAME
</cfquery>
			<cfoutput query="getsubcategory">
				<tr>
					<td>#category_name#</td>
					<td><a href="faculty_category_addaction.cfm?category_id=#url.category_id#&subcategory_id=#getsubcategory.category_id#">Add to Category</a> | <a href="faculty_category_delete.cfm?category_id=#getsubcategory.category_id#">Delete Subcategory</a></td>
				</tr>
			</cfoutput>
		</cfif>
	</table>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
