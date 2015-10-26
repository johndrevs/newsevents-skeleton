<cfquery name="updatesite" datasource="#application.datasource_update#">
UPDATE     CUNVMCS.FACULTY_REF
SET      ACTIVE=0
where CATEGORY_ID=#url.CATEGORY_ID# AND FACULTY_ID=#url.FACULTY_ID#
</cfquery>

<cfoutput><cflocation url="#http_referer#" addtoken="Yes"></cfoutput>
