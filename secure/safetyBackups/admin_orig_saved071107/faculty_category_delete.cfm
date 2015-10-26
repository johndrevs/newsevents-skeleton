<cfquery name="updatesite" datasource="#application.datasource_update#">
UPDATE     CUNVMCS.CATEGORIES
SET      ACTIVE=0
where CATEGORY_ID=#url.CATEGORY_ID#
</cfquery>

<cfoutput><cflocation url="#http_referer#" addtoken="Yes"></cfoutput>
