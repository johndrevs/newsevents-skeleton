<cfquery name="updatesite" datasource="#application.datasource_update#">
UPDATE     CUNVMCS.CATEGORIES
SET      category_name='#form.category_name#'
where CATEGORY_ID=#form.CATEGORY_ID#
</cfquery>

<cfoutput><cflocation url="faculty_category_manage.cfm" addtoken="No"></cfoutput>