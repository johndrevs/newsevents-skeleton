<cfquery name="qry_GetNameLookup" datasource="#request.datasource_read#" maxrows=1>
SELECT DISTINCT
             
				PERSON.LID,
                PERSON.LAST_NAME,
		        PERSON.FIRST_NAME, 
				PERSON.MIDDLE_NAME,
                PERSON.PREFERRED_DATA_EXISTS,
                PERSON.TITLE1           
		
		 FROM #request.datasource_schema#.alt_location alt,
              #request.datasource_schema#.person person, 
              #request.datasource_schema#.PREFERRED_DATA prefer,
		      #request.datasource_schema#.location locate,              
			  #request.datasource_schema#.department dept,
			  #request.datasource_schema#.building bldg, 
			  #request.datasource_schema#.campus campus
			  		 
         WHERE PERSON.LID='#url.LID#'
		 <!--- Set to select by First Name or Preferred First Name depending if they are entered ! --->
  	         
  			   
        
                     
                     AND ALT.LOCATION_TYPE = 'P'
                     AND ALT.OVERRIDE_DEPT = '1'
                     AND ALT.BUILDING_CODE = BLDG.BUILDING_CODE 
                     AND ALT.DEPT_NBR = DEPT.DEPT_NBR
                     AND DEPT.PRIMARY = '1'
                     and ALT.LID = LOCATE.LID
          			 and LOCATE.LID = PERSON.LID              
                     and BLDG.CAMPUS_CODE = CAMPUS.CAMPUS_CODE 
                     AND PERSON.PREFERRED_DATA_EXISTS = '1'
                     and PERSON.LID = PREFER.LID 

   UNION

         SELECT DISTINCT
		        PERSON.LID,
                PERSON.LAST_NAME,
		        PERSON.FIRST_NAME, 
				PERSON.MIDDLE_NAME,
                PERSON.PREFERRED_DATA_EXISTS, 
                PERSON.TITLE1 
		
		 FROM #request.datasource_schema#.person person, 
		      #request.datasource_schema#.location locate,
			  #request.datasource_schema#.department dept,
			  #request.datasource_schema#.building bldg, 
			  #request.datasource_schema#.campus campus 
               
			  		 
           WHERE PERSON.LID='#url.LID#'
		 <!--- Set to select by First Name or Preferred First Name depending if they are entered ! --->
  	           
  			   
        
                     
	                 and PERSON.LID = LOCATE.LID  
					 and LOCATE.LOCATION_TYPE = 'P'               
		             and LOCATE.DEPT_SEQUENCE = DEPT.DEPT_SEQUENCE  
					 and DEPT.BUILDING_CODE = BLDG.BUILDING_CODE 
                     and BLDG.CAMPUS_CODE = CAMPUS.CAMPUS_CODE 
   UNION
      SELECT DISTINCT
		     PERSON.LID,
             PERSON.LAST_NAME,
		     PERSON.FIRST_NAME, 
			 PERSON.MIDDLE_NAME,
             PERSON.PREFERRED_DATA_EXISTS,
             PREFER.PREFERRED_TITLE1
  		
		 FROM 
                #request.datasource_schema#.person person, 
                #request.datasource_schema#.PREFERRED_DATA prefer, 
		        #request.datasource_schema#.location locate,
			    #request.datasource_schema#.department dept,
			    #request.datasource_schema#.building bldg, 
			    #request.datasource_schema#.campus campus  
			  		 
         WHERE PERSON.LID='#url.LID#'
		
  			   
        
                AND PREFER.LID = PERSON.LID 
                AND PERSON.PREFERRED_DATA_EXISTS = '1'                
                AND PERSON.LID = LOCATE.LID  
				AND LOCATE.LOCATION_TYPE = 'P' 
		        AND LOCATE.DEPT_SEQUENCE = DEPT.DEPT_SEQUENCE  
				AND DEPT.BUILDING_CODE = BLDG.BUILDING_CODE 
                AND BLDG.CAMPUS_CODE = CAMPUS.CAMPUS_CODE 


   
         ORDER BY LAST_NAME, FIRST_NAME 

             <!---  <CFABORT> --->
			  		 
         </cfquery>


<cfquery name="getsurvey" datasource="#application.datasource_select#">
SELECT *
FROM CUNVMCS.FACULTY_SURV
WHERE LID='#url.LID#'
</cfquery>
<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Add a Faculty Expert</h2>
	<cfoutput>
	<table border="0" cellspacing="0" cellpadding="5" class="tabulargrey">
			<tr>
				<th>Responses for #qry_GetNameLookup.FIRST_NAME# #qry_GetNameLookup.LAST_NAME#</th>
			</tr>
			<tr>
				<td><strong>Area of Expertise:</strong></td>
			</tr>
			<tr>
				<td><cfif getsurvey.expertise is ''>Left Blank<cfelse>#getsurvey.EXPERTISE#</cfif></td>
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
				<td><strong>a.	Have you been interviewed by media to discuss issues related to your
                  area of expertise or to represent  Loyola or other affiliation?</strong></td>
			</tr>
			<tr>
				<td>&nbsp;
				<cfif getsurvey.ME_AB EQ 1>Broadcast</cfif>
				<cfif getsurvey.ME_AP EQ 1>Print</cfif>
				<cfif getsurvey.ME_R EQ 1>Radio</cfif>
				<cfif getsurvey.ME_O EQ 1>Online</cfif>
				<CFIF getsurvey.ME_AB NEQ 1 AND getsurvey.ME_AP NEQ 1 AND getsurvey.ME_R NEQ 1 AND getsurvey.ME_O NEQ 1> NONE SELECTED</CFIF></td>
			</tr>
			<tr>
				<td><strong>b. If no, are you interested in being a media spokesperson?</strong></td>
			</tr>
			
			<tr>
				<td>&nbsp;<cfif getsurvey.INTEREST EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td><strong>c. Do you understand and speak a foreign language well enough to serve as a resource for foreign language media outlets?</strong></td>
			</tr>
			<tr>
				<td>&nbsp;<cfif getsurvey.PA_C EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td><strong>d. If yes, which language?</strong></td>
			</tr>
			<tr>
				<td>&nbsp;#getsurvey.PA_D#</td>
			</tr>
			<tr>
				<th>Public Affairs Experience:</th>
			</tr>
			<tr>
				<td><strong>a. Are there any areas of your research or expertise which you feel relate 
      to some public policy issue, foreign or domestic?</strong></td>
			</tr>
			<tr>
				<td>&nbsp;<cfif getsurvey.PA_A EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td><strong>b. If yes, briefly describe the public policy issue (in 100 words or less).</strong></td>
			</tr>
			<tr>
				<td>&nbsp;#getsurvey.PA_B#</td>
			</tr>
			
			<tr>
				<td><strong>e.	Have you ever provided expert testimony for a government committee or panel?</strong></td>
			</tr>
			<tr>
				<td>&nbsp;<cfif getsurvey.PA_E EQ 1>YES <CFELSE> NO</cfif></td>
			</tr>
			<tr>
				<td><strong>f. If  yes, briefly describe the policy issue (100 words or less).</strong></td>
			</tr>
			<tr>
				<td>&nbsp;#getsurvey.PA_F#</td>
			</tr>
		</table></cfoutput>
			
<cfinclude template="/newsevents/secure/templates/footer.cfm">