<cfquery name="updatesite" datasource="#application.datasource_update#">
UPDATE     CUNVMCS.CATEGORIES_REF
SET      ACTIVE=0
where CATEGORIES_REF_ID=#url.CATEGORIES_REF_ID#
</cfquery>

<cfoutput><cflocation url="#http_referer#" addtoken="Yes"></cfoutput>
