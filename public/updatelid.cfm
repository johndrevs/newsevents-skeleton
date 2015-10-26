 <cfquery name="getfaculty" datasource="#application.datasource_select#">
SELECT FACULTY.UNIVERSAL_ID
		FROM CUNVMCS.FACULTY</cfquery>	


<cfoutput query="getfaculty">
 <cfquery name="qryGetLUWAREinfo" datasource="#request.datasource_read#" maxrows=1 debug>
SELECT lid, uvid
			FROM people.v_luhs_uniemp@luware
			where UVID = '#getfaculty.UNIVERSAL_ID#'</cfquery> 
	<cfquery name="updatenews" datasource="#application.datasource_update#">
update     CUNVMCS.FACULTY
SET       LID='#qryGetLUWAREinfo.lid#'
where universal_id='#getfaculty.UNIVERSAL_ID#'
</cfquery>			
			#getfaculty.UNIVERSAL_ID# #qryGetLUWAREinfo.lid#<BR>
</cfoutput>