<cfquery name="getfaculty" datasource="#application.datasource_select#">
SELECT FACULTY.FACULTY_DETAIL, FACULTY_ID
		FROM CUNVMCS.FACULTY
		WHERE FACULTY.LID='#url.universal_id#'
</cfquery>
<cfquery name="getcategories" datasource="#application.datasource_select#">
SELECT CATEGORY_NAME
		FROM CUNVMCS.FACULTY_REF, CUNVMCS.CATEGORIES
		WHERE FACULTY_REF.CATEGORY_ID=CATEGORIES.CATEGORY_ID AND FACULTY_REF.FACULTY_ID=#getfaculty.FACULTY_ID# AND FACULTY_REF.ACTIVE=1 AND CATEGORIES.ACTIVE=1
</cfquery>
	<CFOUTPUT>
<!---  	   <br>In dsp_results_individual, Is the Lid being Passed from attribut ? #attributes.LID#
	    <BR>   OR is the lid from URL ? #URL.LID# 
       <BR>  Or is the lid from the Form ? #form.passlid# 
  <cfabort>
 ---> 		
        <cfparam name="attributes.LID" default="">
		<cfparam name="URL.LID" default="">
		<cfparam name="qryGetLUWAREinfo.lid" default=""> 
 		<cfparam name="attributes.suppress" default="">  
  
 <!--- 		<cfparam name="lid" default=""> --->

                 
		<CFIF URL.LID neq "">
			<cfset form.LID = URL.LID>  
			<cfset qryGetTable_Person.LID = URL.LID> 
		<cfelseif attributes.LID neq "">
			<cfset form.LID = attributes.LID>
			<cfset qryGetTable_Person.LID = attributes.LID>
		
		</cfif>		

		<cfparam name="qryGetTable_Person.LID" default="99999999998">
		<cfparam name="form.LID" 			   default="99999999998">
		<cfinclude template="ssi/inc_searchPerson_fields.cfm">
		<cfinclude template="ssi/inc_searchLocation_fields.cfm">
		<cfinclude template="ssi/inc_searchDepartment_fields.cfm">
		<cfinclude template="ssi/inc_searchPreferred_Data_fields.cfm">
		<cfinclude template="ssi/inc_searchLocation_fields.cfm">
		<cfquery name="qryGetTable_Person" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.PERSON
			where LID = '#trim(form.LID)#'
			<!--- <cfabort> --->
		</cfquery>
		<!--- GET PRIMARY LOCATION INFORMATION --->
		<cfquery name="qryGetTable_Location_P" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.LOCATION a,  #request.datasource_schema#.DEPARTMENT b
			where a.LID = '#trim(form.LID)#'
			and a.DEPT_SEQUENCE = b.DEPT_SEQUENCE
			and a.LOCATION_TYPE = 'P'
		</cfquery>
		<!--- GET SECONDARY LOCATION INFORMATION --->
		<cfquery name="qryGetTable_Location_S" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.LOCATION a,  #request.datasource_schema#.DEPARTMENT b
			where a.LID = '#trim(form.LID)#'
			and a.DEPT_SEQUENCE = b.DEPT_SEQUENCE
			and a.LOCATION_TYPE = 'S'
		</cfquery>
		<!--- GET PRIMARY LOCATION INFORMATION ***ALTERNATE*** --->
		<cfquery name="qryGetTable_Location_P_ALTERNATE" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.ALT_LOCATION
			where LID = '#trim(form.LID)#'
			and LOCATION_TYPE = 'P'
			<!--- <cfabort> --->
		</cfquery>
		<!--- GET SECONDARY LOCATION INFORMATION ***ALTERNATE*** --->
		<cfquery name="qryGetTable_Location_S_ALTERNATE" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.ALT_LOCATION
			where LID = '#trim(form.LID)#'
			and LOCATION_TYPE = 'S'
				<!--- <cfabort> --->
		</cfquery>
		<cfquery name="qryGetTable_Preferred_Data" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.PREFERRED_DATA
			where LID = '#trim(form.LID)#'
			<!--- <cfabort> --->
		</cfquery>
	</CFOUTPUT>











		


		
		
		


		
		


<cfinclude template="/newsevents/public/ssi/header_061813.cfm">

<article class="content wide">

				<h2>Experts Directory</h2>
			
				<cfinclude template="ssi/experts_menu.cfm">
					
						
						<cfoutput query="qryGetTable_Person">
							<!-- End one professor -->
							<!-- Photo goes in here -->
							<center>									
								<cfif fileexists('#application.dir#/public/images/#universal_id#.jpg')><img src="/newsevents/public/images/#url.universal_id#.jpg" alt="" border="0">
								<cfelse>
								</cfif>
</center>
								<!-- info goes in here -->
				
				<!-- name -->
				<p><strong><cfif qryGetTable_Preferred_Data.OVERRIDE_FIRST_NAME EQ "1">
#trim(qryGetTable_Preferred_Data.PREFERRED_FIRST_NAME)#<cfelse>#trim(qryGetTable_Person.FIRST_NAME)#</cfif>
<cfif qryGetTable_Person.MIDDLE_NAME neq "">#trim(qryGetTable_Person.MIDDLE_NAME)#. </cfif>
<cfif qryGetTable_Preferred_Data.OVERRIDE_LAST_NAME EQ "1">#trim(qryGetTable_Preferred_Data.MAIDEN_NAME)#<cfelse>#trim(qryGetTable_Person.LAST_NAME)#</cfif><cfif qryGetTable_Person.NAME_SUFFIX neq ""> #trim(qryGetTable_Person.NAME_SUFFIX)#</cfif><cfif qryGetTable_Person.ACADEMIC_LETTERS neq "">,</cfif>
#trim(qryGetTable_Person.ACADEMIC_LETTERS)#
<cfif qryGetTable_Preferred_Data.OTHER_CREDENTIALS neq "">,</cfif> #trim(qryGetTable_Preferred_Data.OTHER_CREDENTIALS)#</strong>


<br>
<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE1 eq "1">
		#trim(qryGetTable_Preferred_Data.PREFERRED_TITLE1)#<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE2 eq "1">,</cfif>
		<cfelse>
			<cfif qryGetTable_Person.TITLE1 neq "">
				#trim(qryGetTable_Person.TITLE1)#<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE2 eq "1">,</cfif>
			</cfif>
		</cfif>

		<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE2 eq "1">
			#trim(qryGetTable_Preferred_Data.PREFERRED_TITLE2)#
		<cfelse>
			<cfif #qryGetTable_Person.TITLE2# neq "">
			#trim(qryGetTable_Person.TITLE2)#
			</cfif>
		</cfif><br/>

		<cfquery name="qryGetDeptName_P" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NAME
			from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR = '#qryGetTable_Location_P.DEPT_NBR#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetDeptName_P_Alternate" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NAME
			from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR = '#qryGetTable_Location_P_ALTERNATE.DEPT_NBR#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetDeptName_S" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NAME
			from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR = '#qryGetTable_Location_S.DEPT_NBR#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetDeptName_S_Alternate" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NAME
			from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR = '#qryGetTable_Location_S_ALTERNATE.DEPT_NBR#'
			<!--- <CFABORT> --->
		</cfquery><b>Department:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetDeptName_P_Alternate.DEPT_NAME#
		<cfelse>
		#qryGetDeptName_P.DEPT_NAME#
		</cfif><!--- <br>
		
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetDeptName_S_Alternate.DEPT_NAME#
		<cfelse>
		#qryGetDeptName_S.DEPT_NAME#
		</cfif> --->
	<br>
#getfaculty.faculty_detail#</p>
<p><strong>This expert is listed in the following categories:</strong>
<ul>
<cfloop query="getcategories"><li>#category_name#</li></cfloop>
</ul></p>
<p>To reach this expert please contact Loyola University Chicago Media Relations at 312-915-6164.</p>
<p><strong>NOTE:</strong> To edit experts' info please contact media relations at <a href="mailto:news@luc.edu">news@luc.edu</a>.</p></td>
								<!-- End one professor -->
						</cfoutput>
					<cfquery datasource="#application.datasource_update#" name="insertpost">
INSERT INTO CUNVMCS.FACULTY_LOG(FACULTY_LOG_ID, LID, DATETIME)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,'#url.universal_id#' , SYSDATE)
</cfquery> 
				</div>
</div>
</div>
<cfinclude template="/newsevents/public/ssi/footer_061813.cfm">
