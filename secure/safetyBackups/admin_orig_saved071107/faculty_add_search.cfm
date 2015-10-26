<cfquery name="read_swbd" datasource="#request.datasource_read#">
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person

WHERE LOWER(LAST_NAME) LIKE LOWER('%#form.criteria#%')
	<cfif form.filter EQ 1>		and (TITLE1='Professor' OR TITLE1='Associate Professor' OR TITLE1='Assistant Professor' OR TITLE1='Instructor')
	<cfelse>
and 0=0 order by last_name
	</cfif>
<!--- <cfabort> --->
</cfquery>
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Add a Faculty Expert</h2>
<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">	


		<!--- <tr><th colspan="2"></th></tr> --->
			<cfoutput query="read_swbd">
<cfquery name="getsurvey" datasource="#application.datasource_select#">
SELECT FACULTY_SURV_ID
FROM CUNVMCS.FACULTY_SURV
WHERE LID='#read_SWBD.LID#'
</cfquery>
				<tr>
					<td>#first_name# #LAST_NAME#</td>
					<td><a href="faculty_add_form.cfm?LID=#LID#">add to system</a>						
					<cfif getsurvey.recordcount gt 0> |  <a href="faculty_survey.cfm?LID=#LID#">view survey details</a>
					</cfif></td></tr>
			</cfoutput>


</table>
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">
