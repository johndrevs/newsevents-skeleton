<cfquery name="getfaculty" datasource="#application.datasource_select#">
SELECT LID
FROM CUNVMCS.FACULTY
</cfquery>
<cfset availablelid=quotedvaluelist(getfaculty.lid)>
<cfquery name="getsurvey" datasource="#application.datasource_select#">
SELECT LID
FROM CUNVMCS.FACULTY_SURV
WHERE 0=0 <cfif form.filter EQ 0> and LID NOT IN (#preservesinglequotes(variables.availablelid)#)
<cfelse> 
	</cfif>
<!--- <cfabort><cfoutput>#getsurvey.recordcount#x#preservesinglequotes(variables.availablelid)#</cfoutput>--->
</cfquery>
<cfset availablelid=quotedvaluelist(getsurvey.lid)>

<cfquery name="read_swbd" datasource="#request.datasource_read#">
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person

WHERE LOWER(LAST_NAME) LIKE LOWER('%#form.criteria#%') and person.LID in (#preservesinglequotes(variables.availablelid)#)
	 order by last_name
	
<!---  <cfabort>--->
</cfquery>
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>View Survey Responses</h2>
<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">	


		<!--- <tr><th colspan="2"></th></tr> --->
			<cfoutput query="read_swbd">

				<tr>
					<td>#first_name# #LAST_NAME#</td>
					<td><a href="faculty_survey.cfm?LID=#LID#">view survey details</a></td></tr>
			</cfoutput>


</table>
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">
