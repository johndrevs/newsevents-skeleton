<!---
     This Query selects the information based on What's Entered. 
--->

<!----------------------------------------------------------------------------------------------------> 
<!---  <cfquery name="qry_GetNameLookup" datasource="#request.datasource_read#" MAXROWS="#session.maxnbr#"> --->
<cfset uid='jdrevs'>
<cfset request.datasource_read = "read_LWD" />  
      <cfset request.datasource_update = "update_lwd" /> 
	<cfset request.datasource_schema = "CUNVLWD" />
<cfquery name="qry_GetNameLookup" datasource="#request.datasource_read#">
          SELECT DISTINCT
                PERSON.LID,
                PERSON.LAST_NAME,
		        PERSON.FIRST_NAME, 
				PERSON.MIDDLE_NAME,
                PERSON.PREFERRED_DATA_EXISTS,
                PERSON.TITLE1,  
				PERSON.UNIVERSAL_ID         
		
		 FROM #request.datasource_schema#.alt_location alt,
              #request.datasource_schema#.person person, 
              #request.datasource_schema#.PREFERRED_DATA prefer,
		      #request.datasource_schema#.location locate,              
			  #request.datasource_schema#.department dept,
			  #request.datasource_schema#.building bldg, 
			  #request.datasource_schema#.campus campus
			  		 
         WHERE LAST_NAME IS not NULL 
		
        
	
                     
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
               
			  		 
          WHERE LAST_NAME IS not NULL 
	
  			   
     
        
		
                     
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
			  		 
          WHERE LAST_NAME IS not NULL 
		
  			   
        
                AND PREFER.LID = PERSON.LID 
                AND PERSON.PREFERRED_DATA_EXISTS = '1'                
                AND PERSON.LID = LOCATE.LID  
				AND LOCATE.LOCATION_TYPE = 'P' 
		        AND LOCATE.DEPT_SEQUENCE = DEPT.DEPT_SEQUENCE  
				AND DEPT.BUILDING_CODE = BLDG.BUILDING_CODE 
                AND BLDG.CAMPUS_CODE = CAMPUS.CAMPUS_CODE 


   
         ORDER BY LAST_NAME, FIRST_NAME 

                     <!--- <CFABORT>  ---> 
 </CFQUERY>
<!----------------------------------------------------------------------------------------------------> 
<cfoutput query="qry_GetNameLookup"> #First_Name# #last_name# #currentrow#<br/></cfoutput>