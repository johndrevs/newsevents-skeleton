<cfquery name="read_swbd" datasource="read_swboard" maxrows=1>
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_LONG_NAME,JOB_CLASS_DESCRIPTION, UNIVERSAL_ID,COMPANY_CODE
FROM CUNVSWB.FIND_LOYOLANS_FACSTAFF FLFS
<!---WHERE PHONE_NO IS not NULL--->
WHERE UNIVERSAL_ID = '#url.universal_id#' and COMPANY_CODE <> 151 and (JOB_CLASS_DESCRIPTION='Professor' OR JOB_CLASS_DESCRIPTION='Associate Professor' OR JOB_CLASS_DESCRIPTION='Assistant Professor' OR JOB_CLASS_DESCRIPTION='Instructor')</cfquery>


<cfquery name="getsurvey" datasource="#application.datasource_select#">
SELECT *
FROM CUNVMCS.FACULTY_SURV
WHERE UNIVERSAL_ID='#url.universal_id#'
</cfquery>
	<cfoutput>
		<table>
			<tr>
				<td>Responses for #read_swbd.FIRST_NAME# #read_swbd.LAST_NAME#</td>
			</tr>
			<tr>
				<td>Area of Expertise:</td>
			</tr>
			<tr>
				<td>
				#getsurvey.EXPERTISE#</td>
			</tr>
			<!--- <tr>
				<td>Current Professional Society membership and offices held (list 3 only)</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Professional Awards (list 3 only)</td>
			</tr> --->
			<tr>
				<td></td>
			</tr>
			<tr>
				<th>Media Experience:</th>
			</tr>
			<tr>
				<td>a.	Have you been interviewed by media to discuss issues related to your
                  area of expertise or to represent  Loyola or other affiliation?</td>
			</tr>
			<tr>
				<td>Check all that apply:
				<cfif getsurvey.ME_AB EQ 1>x</cfif>Broadcast
				<cfif getsurvey.ME_AP EQ 1>x</cfif>Print
				<cfif getsurvey.ME_R EQ 1>x</cfif>Radio
				<cfif getsurvey.ME_O EQ 1>x</cfif>Online</td>
			</tr>
			<tr>
				<td>b. If no, are you interested in being a media spokesperson?</td>
			</tr>
			<tr>
				<td><cfif getsurvey.INTEREST EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<th>Public Affairs Experience:</th>
			</tr>
			<tr>
				<td>a. Are there any areas of your research or expertise which you feel relate 
      to some public policy issue, foreign or domestic?</td>
			</tr>
			<tr>
				<td><cfif getsurvey.PA_A EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td>b. If yes, briefly describe the public policy issue (in 100 words or less).</td>
			</tr>
			<tr>
				<td>#getsurvey.PA_B#</td>
			</tr>
			<tr>
				<td>c. Have you ever provided consultation to any government committee or panel,
                 or work(ed) with any unit of government in any way?</td>
			</tr>
			<tr>
				<td><cfif getsurvey.PA_C EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td>d. If yes, briefly describe the public policy issue (100 words or less).</td>
			</tr>
			<tr>
				<td>#getsurvey.PA_D#</td>
			</tr>
			<tr>
				<td>e.	Have you ever provided expert testimony for a government committee or panel?</td>
			</tr>
			<tr>
				<td><cfif getsurvey.PA_E EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td>f. If  yes, briefly descrive the policy issue (100 words or less).</td>
			</tr>
			<tr>
				<td>#getsurvey.PA_F#</td>
			</tr>
		</table></cfoutput>