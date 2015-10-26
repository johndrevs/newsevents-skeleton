<cfquery name="getfaculty" datasource="#application.datasource_select#" maxrows="999">
SELECT *
		FROM CUNVMCS.FACULTY, CUNVMCS.FACULTY_REF
		WHERE 0=0 <cfif parameterexists(url.category_id)>AND FACULTY_REF.CATEGORY_ID=#url.category_id#</cfif> AND FACULTY_REF.FACULTY_ID=FACULTY.FACULTY_ID AND FACULTY_REF.ACTIVE=1
		order by faculty.lid
</cfquery>	
<cfdump var="#getfaculty#"><cfabort>
<cfoutput query="getfaculty">#lid# #getfaculty.recordcount#<br></cfoutput>