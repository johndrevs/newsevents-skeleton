

<!--- Run query on faculty/staff view using cleaned input.  Query first runs on people who have phone numbers, and then on people who don't.  --->

<html>
<head>
	<title>Results - Individual</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<CFOUTPUT>
<!---  	   <br>In dsp_results_individual, Is the Lid being Passed from attribut ? #attributes.LID#
	    <BR>   OR is the lid from URL ? #URL.universal_id# 
       <BR>  Or is the lid from the Form ? #form.passlid# 
  <cfabort>
 ---> 		
        <cfparam name="attributes.LID" default="">
		<cfparam name="URL.universal_id" default="">
		<cfparam name="qryGetLUWAREinfo.lid" default=""> 
 		<cfparam name="attributes.suppress" default="">  
  
 <!--- 		<cfparam name="lid" default=""> --->

                 
		<CFIF URL.universal_id neq "">
			<cfset form.LID = URL.universal_id>  
			<cfset qryGetTable_Person.LID = URL.universal_id> 
		<cfelseif attributes.LID neq "">
			<cfset form.LID = attributes.LID>
			<cfset qryGetTable_Person.LID = attributes.LID>
		<cfelseif qryGetLUWAREinfo.lid neq "">
			<cfset form.LID = qryGetLUWAREinfo.lid>
			<cfset qryGetTable_Person.LID = qryGetLUWAREinfo.lid>
		</cfif>		

		<cfparam name="qryGetTable_Person.LID" default="99999999998">
		<cfparam name="form.LID" 			   default="99999999998">
		<cfinclude template="ssi/inc_searchPerson_fields.cfm">
		<cfinclude template="ssi/inc_searchLocation_fields.cfm">
		<cfinclude template="ssi/inc_searchDepartment_fields.cfm">
		<cfinclude template="ssi/inc_searchPreferred_Data_fields.cfm">
		
		<cfquery name="qryGetTable_Person" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.PERSON
			where LID = '#trim(form.LID)#'
			<!---  <cfabort>  --->
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
</head>

<body>

<br><br>
<div align="center">


<CFOUTPUT>

<cfif qryGetTable_Preferred_Data.OVERRIDE_FIRST_NAME EQ "1">
#trim(qryGetTable_Preferred_Data.PREFERRED_FIRST_NAME)#<cfelse>#trim(qryGetTable_Person.FIRST_NAME)#</cfif>
<cfif qryGetTable_Person.MIDDLE_NAME neq "">#trim(qryGetTable_Person.MIDDLE_NAME)#. </cfif>
<cfif qryGetTable_Preferred_Data.OVERRIDE_LAST_NAME EQ "1">#trim(qryGetTable_Preferred_Data.MAIDEN_NAME)#<cfelse>#trim(qryGetTable_Person.LAST_NAME)#</cfif><cfif qryGetTable_Person.NAME_SUFFIX neq ""> #trim(qryGetTable_Person.NAME_SUFFIX)#</cfif><cfif qryGetTable_Person.ACADEMIC_LETTERS neq "">,</cfif>
#trim(qryGetTable_Person.ACADEMIC_LETTERS)#
<cfif qryGetTable_Preferred_Data.OTHER_CREDENTIALS neq "">,</cfif> #trim(qryGetTable_Preferred_Data.OTHER_CREDENTIALS)#
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
		</cfif>

</td>
</tr>
<tr>
<td>
	<table bgcolor="##000000">
		<tr>
		<td width="500" colspan="2" align="center"><font color="##FFFFFF"><b>Department and Contact Information</b></font></td>
		</tr>
		<tr>
		<td width="250" align="center"><font color="##FFFFFF"><b>Primary</b></font></td>
		<td width="250" align="center"><font color="##FFFFFF"><b>Secondary</b></font></td>
		</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table width="500">
<!--- 		<tr>
		<td width="250"><b>Title:</b>&nbsp;
		<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE1 neq "">
		#qryGetTable_Preferred_Data.PREFERRED_TITLE1#
		<cfelse>
		#qryGetTable_Person.TITLE1#
		</cfif>
		</td><td width="250"><b>Title:</b>&nbsp;
		<cfif qryGetTable_Preferred_Data.OVERRIDE_TITLE2 neq "">
		#qryGetTable_Preferred_Data.PREFERRED_TITLE2#
		<cfelse>
		#qryGetTable_Person.TITLE2#
		</cfif>
		</td>
		</tr> --->
</tr>
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
		</cfquery>
		<tr>
		<td width="250"><b>Department:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetDeptName_P_Alternate.DEPT_NAME#
		<cfelse>
		#qryGetDeptName_P.DEPT_NAME#
		</cfif>
		</td><td width="250"><b>Department:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetDeptName_S_Alternate.DEPT_NAME#
		<cfelse>
		#qryGetDeptName_S.DEPT_NAME#
		</cfif>
		</td>
		</tr>


		<cfquery name="qryGetBuildingName_P" datasource="#request.datasource_read#" debug="yes">
			select BUILDING_NAME
			from #request.datasource_schema#.BUILDING
			where BUILDING_CODE = '#qryGetTable_Location_P.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetBuildingName_P_Alternate" datasource="#request.datasource_read#" debug="yes">
			select BUILDING_NAME
			from #request.datasource_schema#.BUILDING
			where BUILDING_CODE = '#qryGetTable_Location_P_ALTERNATE.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetBuildingName_S" datasource="#request.datasource_read#" debug="yes">
			select BUILDING_NAME
			from #request.datasource_schema#.BUILDING
			where BUILDING_CODE = '#qryGetTable_Location_S.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetDeptBuilding_S_Alternate" datasource="#request.datasource_read#" debug="yes">
			select BUILDING_NAME
			from #request.datasource_schema#.BUILDING
			where BUILDING_CODE = '#qryGetTable_Location_S_ALTERNATE.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>

		<cfquery name="qryGetCampus_P" datasource="#request.datasource_read#" debug="yes">
		select a.CAMPUS_CODE, a.CAMPUS_NAME
			from #request.datasource_schema#.CAMPUS a, #request.datasource_schema#.BUILDING b
			where a.CAMPUS_CODE = b.CAMPUS_CODE
			and b.BUILDING_CODE = '#qryGetTable_Location_P.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetCampus_P_ALTERNATE" datasource="#request.datasource_read#" debug="yes">
		select a.CAMPUS_CODE, a.CAMPUS_NAME
			from #request.datasource_schema#.CAMPUS a, #request.datasource_schema#.BUILDING b
			where a.CAMPUS_CODE = b.CAMPUS_CODE
			and b.BUILDING_CODE = '#qryGetTable_Location_P_Alternate.BUILDING_CODE#'
			 <!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetCampus_S" datasource="#request.datasource_read#" debug="yes">
			select a.CAMPUS_CODE, a.CAMPUS_NAME
			from #request.datasource_schema#.CAMPUS a, #request.datasource_schema#.BUILDING b
			where a.CAMPUS_CODE = b.CAMPUS_CODE
			and b.BUILDING_CODE = '#qryGetTable_Location_S.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<cfquery name="qryGetCampus_S_ALTERNATE" datasource="#request.datasource_read#" debug="yes">
			select a.CAMPUS_CODE, a.CAMPUS_NAME
			from #request.datasource_schema#.CAMPUS a, #request.datasource_schema#.BUILDING b
			where a.CAMPUS_CODE = b.CAMPUS_CODE
			and b.BUILDING_CODE = '#qryGetTable_Location_S_Alternate.BUILDING_CODE#'
			<!--- <CFABORT> --->
		</cfquery>
		<tr>
		<td width="250"><b>Campus:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetCampus_P_ALTERNATE.CAMPUS_NAME#
		<cfelse>
		#qryGetCampus_P.CAMPUS_NAME#
		</cfif>
		</td><td width="250"><b>Campus:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetCampus_S_ALTERNATE.CAMPUS_NAME#
		<cfelse>
		#qryGetCampus_S.CAMPUS_NAME#
		</cfif>
		</td>
		</tr>
<tr>
		<td width="250"><b>Building:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetBuildingName_P_Alternate.BUILDING_NAME#
		<cfelse>
		#qryGetBuildingName_P.BUILDING_NAME#
		</cfif>
		</td><td width="250"><b>Building:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetDeptBuilding_S_Alternate.BUILDING_NAME#
		<cfelse>
		#qryGetBuildingName_S.BUILDING_NAME#
		</cfif>
		</td>
		</tr>
<tr>
		<td width="250"><b>Room:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetTable_Location_P_ALTERNATE.ROOM_NBR#
		<cfelse>
		<cfif qryGetTable_Location_P.ROOM neq "">#qryGetTable_Location_P.ROOM#<cfelse>#qryGetTable_Location_P.DEPT_ROOM_NBR#</cfif>
		</cfif>
		</td><td width="250"><b>Room:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetTable_Location_S_ALTERNATE.ROOM_NBR#
		<cfelse>
		<cfif qryGetTable_Location_S.ROOM neq "">#qryGetTable_Location_S.ROOM#<cfelse>#qryGetTable_Location_S.DEPT_ROOM_NBR#</cfif>
		</cfif>
		</td>
		</tr>
		<tr>
                    <!---  This is where the Primary Phone is formatted and Displayed! --->
                <!---  If you are an Operator then you have access to the Phone number for a Med person!
                    Otherwise if the person is Not a Med person then you can see their Phone Number --->

		<td width="250"><b>Phone:</b>&nbsp;
       
		</td>
                    <!---  This is where the Secondary Phone is formatted and Displayed! --->
                <!---  If you are an Operator then you have access to the Phone number for a Med person!
                    Otherwise if the person is Not a Med person then you can see their Phone Number --->
       <td width="250"><b>Phone:</b>&nbsp;
       
		</td>
		</tr>

		<cfquery name="getThisDepartment_P" datasource="#request.datasource_read#" debug="yes">
			select FAX_COUNTRY_CODE, FAX_AREA_CODE, FAX_NBR from #request.datasource_schema#.DEPARTMENT
			where DEPT_SEQUENCE in (select DEPT_SEQUENCE from #request.datasource_schema#.LOCATION
							   where LID = '#form.LID#'
							   and LOCATION_TYPE = 'P')
		</cfquery>
<!--- 		Commented out and Replaced by Above Query R.Yoshioka 07/12/2005 
<cfquery name="getThisDepartment_P" datasource="#request.datasource_read#" debug="yes">
			select FAX_COUNTRY_CODE, FAX_AREA_CODE, FAX_NBR from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR in (select DEPT_NBR from #request.datasource_schema#.LOCATION
							   where LID = '#form.LID#'
							   and LOCATION_TYPE = 'P')
		</cfquery>
 --->

		<cfquery name="getThisDepartment_S" datasource="#request.datasource_read#" debug="yes">
			select FAX_COUNTRY_CODE, FAX_AREA_CODE, FAX_NBR from #request.datasource_schema#.DEPARTMENT
			where DEPT_SEQUENCE in (select DEPT_SEQUENCE from #request.datasource_schema#.LOCATION
							   where LID = '#form.LID#'
							   and LOCATION_TYPE = 'S')	
		</cfquery>
<!---   Commented out and Replaced by Above Query R.Yoshioka 07/12/2005 
 		<cfquery name="getThisDepartment_S" datasource="#request.datasource_read#" debug="yes">
			select FAX_COUNTRY_CODE, FAX_AREA_CODE, FAX_NBR from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR in (select DEPT_NBR from #request.datasource_schema#.LOCATION
							   where LID = '#form.LID#'
							   and LOCATION_TYPE = 'S')
		</cfquery>
 --->

		<tr>
		<td width="250"><b>Fax:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT_FAX eq "1">
		#qryGetTable_Location_P_ALTERNATE.FAX_COUNTRY_CODE# -  #qryGetTable_Location_P_ALTERNATE.FAX_AREA_CODE# -  #qryGetTable_Location_P_ALTERNATE.FAX_PHONE_NBR#
		<cfelse>
		<cfif getThisDepartment_P.FAX_AREA_CODE neq "">
		#getThisDepartment_P.FAX_COUNTRY_CODE# -  #getThisDepartment_P.FAX_AREA_CODE# -  #getThisDepartment_P.FAX_NBR#
		</cfif>
		</cfif>
		</td><td width="250"><b>Fax:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT_FAX eq "1">
		#qryGetTable_Location_S_ALTERNATE.FAX_COUNTRY_CODE# - #qryGetTable_Location_S_ALTERNATE.FAX_AREA_CODE# - #qryGetTable_Location_S_ALTERNATE.FAX_PHONE_NBR#
		<cfelse>
		<cfif getThisDepartment_S.FAX_AREA_CODE neq "">
		#getThisDepartment_S.FAX_COUNTRY_CODE# -  #getThisDepartment_S.FAX_AREA_CODE# -  #getThisDepartment_S.FAX_NBR#
		</cfif>
		</cfif>
		</td>
		</tr>

		<tr>
		<td width="250"><b>Web:</b>&nbsp;
		<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetTable_Location_P_ALTERNATE.WEB_SITE#
		<cfelse>
		#qryGetTable_Location_P.WEB_SITE#
		</cfif>
		</td><td width="250"><b>Web:</b>&nbsp;
		<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
		#qryGetTable_Location_S_ALTERNATE.WEB_SITE#
		<cfelse>
		#qryGetTable_Location_S.WEB_SITE#
		</cfif>
		</td>
		</tr>

<!--- 		<tr>
		<td width="250"><b>Email:</b>&nbsp;#qryGetTable_Person.EMAIL_ADDR#<!--- @luc.edu --->
		</td>
		<td width="250"><b>Email:</b>&nbsp;#qryGetTable_Person.EMAIL_ADDR#<!--- @luc.edu --->
		</td>
		</tr> --->



	</table>
		<tr>
		<td>
			<table border="1" width="500">
				<tr>
				<td width="250" align="left" valign="top">
					<b>Additional Contact Info:</b>
					<cfif qryGetTable_Location_P_ALTERNATE.OVERRIDE_DEPT eq "1">
					#qryGetTable_Location_P_ALTERNATE.REMARKS#
					<cfelse>
					#qryGetTable_Location_P.REMARKS#
					</cfif>
				</td>
				<td width="250" align="left" valign="top">
					<b>Additional Contact Info:</b>
					<cfif qryGetTable_Location_S_ALTERNATE.OVERRIDE_DEPT eq "1">
					#qryGetTable_Location_S_ALTERNATE.REMARKS#
					<cfelse>
					#qryGetTable_Location_S.REMARKS#
					</cfif>
				</td>
				</tr>
			</table>
		</td>
		</tr>
	</table>
</td>
</tr>
</table>
<br><br>



</body>
</html>

</cfoutput>
<!--- <cfif read_swbd.PREFERRED_DATA_EXISTS EQ '1'>
                     <cfset variables.LID = #LID#> 
 
                     <cfquery name="qry_fndOverrideRec" datasource="#request.datasource_read#">
                        SELECT DISTINCT
                          lid,   
                          preferred_first_name,
                          maiden_name,
                          preferred_title1,
                          preferred_title2,
		                  PREFER.OVERRIDE_FIRST_NAME,
                          PREFER.OVERRIDE_LAST_NAME,
                          PREFER.OVERRIDE_TITLE1,
                          PREFER.OVERRIDE_TITLE2
   		
		                FROM CUNVLWD.preferred_data prefer  
                        WHERE PREFER.LID = '#variables.LID#'		       
                        <!--- WHERE PREFER.LID = '#qry_GetNameLookup.LID#'  --->
                                   <!--- <cfabort> --->
                      </CFQUERY>

                     <CFIF qry_fndOverrideRec.RECORDCOUNT GT 0>
                           <CFIF qry_fndOverrideRec.OVERRIDE_TITLE1 is "1">                         
                              <CFIF qry_fndOverrideRec.PREFERRED_TITLE1 eq #variables.position#>
                                 <cfset SELECT_PERSON = 1>
                                 <cfset variables.title = qry_fndOverrideRec.PREFERRED_TITLE1>   
                                 <cfif qry_fndOverrideRec.OVERRIDE_LAST_NAME eq '1'>
                                     <cfset variables.lname = qry_fndOverrideRec.maiden_name>
                                 <cfelse>
                                     <cfset variables.lname = qry_GetNameLookup.last_name>                    
                                 </cfif>  

                                 <cfif qry_fndOverrideRec.OVERRIDE_FIRST_NAME eq '1'>
                                     <cfset variables.fname = qry_fndOverrideRec.preferred_first_name>
                                 <cfelse>
                                     <cfset variables.fname = qry_GetNameLookup.first_name>                    
                                 </cfif> 
                              </CFIF>
                           <CFELSE>
                              <cfset SELECT_PERSON = 1>
                              <cfset variables.title = qry_GetNameLookup.TITLE1> 
                              <cfif qry_fndOverrideRec.OVERRIDE_LAST_NAME eq '1'>
                                  <cfset variables.lname = qry_fndOverrideRec.maiden_name>
                              <cfelse>
                                  <cfset variables.lname = qry_GetNameLookup.last_name>                    
                              </cfif>  

                              <cfif qry_fndOverrideRec.OVERRIDE_FIRST_NAME eq '1'>
                                  <cfset variables.fname = qry_fndOverrideRec.preferred_first_name>
                              <cfelse>
                                  <cfset variables.fname = qry_GetNameLookup.first_name>                    
                              </cfif> 
                           </CFIF> 
                      <CFELSE>
                           <!--- <cfset session.LID = #lid#> --->
                           <cfset SELECT_PERSON = 1>
                           <cfset variables.title = qry_GetNameLookup.TITLE1> 
                           <cfset variables.lname = qry_GetNameLookup.last_name>                    
                           <cfset variables.fname = qry_GetNameLookup.first_name>                    
                      </CFIF>
</cfif>

<cfquery name="qryGetTable_Location_P" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NBR from #request.datasource_schema#.LOCATION a,  #request.datasource_schema#.DEPARTMENT b
			where a.LID = '#url.universal_id#'
			and a.DEPT_SEQUENCE = b.DEPT_SEQUENCE
			and a.LOCATION_TYPE = 'P'
		</cfquery>
		<!--- GET SECONDARY LOCATION INFORMATION --->
	
		
<cfquery name="qryGetDeptName_P" datasource="#request.datasource_read#" debug="yes">
			select DEPT_NAME
			from #request.datasource_schema#.DEPARTMENT
			where DEPT_NBR = '#qryGetTable_Location_P.DEPT_NBR#'
			<!--- <CFABORT> --->
		</cfquery>
		

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

<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Loyola University Chicago: University News</title>

<meta name="keywords" content="Loyola University Chicago"/>
<meta name="description" content="Loyola University Chicago"/>

<link rel="Stylesheet" href="http://www.luc.edu/styles/news_events.css" type="text/css"/>

<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/mouseover.js" type="text/javascript"></script>
<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/selectjump.js" type="text/javascript"></script>
</head>

<body bgcolor="#DDDDDD" onLoad="MM_preloadImages('/images/azindex_btn_f2.gif','/images/contact_btn_f2.gif','/images/directories_btn_f2.gif','/images/loyolahome_btn_f2.gif','/images/calendar_btn_f2.gif');">

<!-- main header table -->
	<table id="header" summary="header container" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>	<!-- header column 1 -->
			<td id="column1" width="230" valign="top"><a href="http://www.luc.edu"><img src="http://www.luc.edu/images/logo_school.gif" width="230" height="79" alt="Loyola University Chicago Home" border="0"/></a></td><!-- header column 2 --><td id="column2" width="100%" valign="top" align="right">
		<cfinclude template="/newsevents/public/ssi/topnav.cfm"><div style="text-align:left;"><img src="images/hdr_news.gif" width="400" height="60" alt="University News"/></div></td>
		</tr>
	</table>	
<!-- end header table -->

<!-- content table -->
	<table id="content" summary="content container" width="100%" cellpadding="0" cellspacing="0" border="0">	<!-- spacer -->
		<tr>
			<td colspan="2"><img src="/images/space.gif" width="1" height="15" alt=" " border="0"/></td>
		</tr>
<!-- true content row -->
		<tr valign="top">	<!-- column 1 -->
			<td width="75%">
			<div class="text70">
				<div class="column">
				<h2>Experts Directory</h2>
				
				<cfinclude template="ssi/experts_menu.cfm">
					<table>
						<cfoutput query="read_swbd">
							<!-- End one professor -->
							<tr>
								<td valign="TOP" width="55"><!-- Photo goes in here -->
							<center>									
								<cfif fileexists('#application.dir#/public/images/#universal_id#.jpg')><img src="/newsevents/public/images/#url.universal_id#.jpg" alt="" border="0">
								<cfelse>
								</cfif>
</center></td>
								<td valign="TOP"><!-- info goes in here -->
				
				<!-- name -->
				<p><b>#FIRST_NAME# #LAST_NAME# #ACADEMIC_LETTERS#</b><br>
<cfif read_swbd.PREFERRED_DATA_EXISTS EQ '1'>x<cfelse>#title1#x</cfif><br>

		#qryGetDeptName_P.DEPT_NAME#
	<br>
#getfaculty.faculty_detail#</p>
<p><strong>This expert is listed in the following categories:</strong>
<ul>
<cfloop query="getcategories"><li>#category_name#</li></cfloop>
</ul></p>
<p>To reach this expert please contact Loyola University Chicago Media Relations at 312-915-6164.</p></td>
							</tr>	<!-- End one professor -->
						</cfoutput>
					</table> <cfquery datasource="#application.datasource_update#" name="insertpost">
INSERT INTO CUNVMCS.FACULTY_LOG(FACULTY_LOG_ID, LID, DATETIME)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,'#url.universal_id#' , SYSDATE)
</cfquery> 
				</div>
			</div></td><!-- column 2 -->
			<td width="25%" class="dashrule">
			<div class="column_right">
				<div class="text70">	<!-- main nav -->
				<cfinclude template="/newsevents/public/ssi/news_nav.cfm">
						<!-- end main nav -->
	
	<!-- upcoming events pagelet -->
				
<!-- end upcoming events pagelet -->




				</div>
			</div></td>
		</tr>	<!-- end true content row -->
	
	<!-- spacer -->
		<tr>
			<td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0"/></td>
		</tr>	<!-- row for promise -->
		<tr>
			<td colspan="2" id="bottomstripe"><a href="/loyolapromise/"><img src="http://www.luc.edu/images/promise_tag.gif" width="352" height="18" alt="The Loyola Promise" border="0"/></a></td>
		</tr>
	</table>	<!-- end main content table -->
	
	<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/news_footer.cfm">
</body>
</html>
 --->