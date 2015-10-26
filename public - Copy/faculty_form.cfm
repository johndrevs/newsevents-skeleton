<cfif parameterexists(session.LoggedIn) >
 <cfelse>x<cflocation url="faculty_form_query.cfm" addtoken="No">  <cfabort>
  </cfif>
 <cfquery name="getexisting1" datasource="#application.datasource_select#">
SELECT FACULTY_SURV_ID
FROM CUNVMCS.FACULTY_SURV
where LID='#session.loyolaId#'
</cfquery>
<cfquery name="getexisting2" datasource="#application.datasource_select#">
SELECT FACULTY_ID
FROM CUNVMCS.FACULTY
where LID='#session.loyolaId#'
</cfquery>
 <cfif getexisting1.recordcount gt 0>
 <cfelse>
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
			  		 
         WHERE person.LID='#session.loyolaId#'
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
               
			  		 
           WHERE PERSON.LID='#session.loyolaId#'
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
			  		 
         WHERE PERSON.LID='#session.loyolaId#'
		
  			   
        
                AND PREFER.LID = PERSON.LID 
                AND PERSON.PREFERRED_DATA_EXISTS = '1'                
                AND PERSON.LID = LOCATE.LID  
				AND LOCATE.LOCATION_TYPE = 'P' 
		        AND LOCATE.DEPT_SEQUENCE = DEPT.DEPT_SEQUENCE  
				AND DEPT.BUILDING_CODE = BLDG.BUILDING_CODE 
                AND BLDG.CAMPUS_CODE = CAMPUS.CAMPUS_CODE 


   
         ORDER BY LAST_NAME, FIRST_NAME 

             <!--- <CFABORT>  ---> 
			  		 
         </cfquery>
		 </cfif>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Loyola University Chicago: University News</title>
	
<meta name="keywords" content="Loyola University Chicago" />
<meta name="description" content="Loyola University Chicago" />	

<link rel="Stylesheet" href="http://www.luc.edu/styles/news_events.css" type="text/css" />

<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/mouseover.js" type="text/javascript"></script>
<script language="JavaScript" src="http://www.luc.edu/scripts/javascripts/selectjump.js" type="text/javascript"></script>
</head>

<body bgcolor="#DDDDDD" onload="MM_preloadImages('/images/azindex_btn_f2.gif','/images/contact_btn_f2.gif','/images/directories_btn_f2.gif','/images/loyolahome_btn_f2.gif','/images/calendar_btn_f2.gif');">

<!-- main header table -->
<table id="header" summary="header container" width="100%" cellpadding="0" cellspacing="0" border="0">
<!-- header row 1 -->
<tr>
	<td id="column2" colspan="2" align="right" valign="top" width="100%"><cfinclude template="/newsevents/public/ssi/topnav.cfm"></td></tr>
<!-- header column 2 -->
<tr>
	<td id="column1" width="230" valign="top"><a href="http://www.luc.edu"><img src="http://www.luc.edu/display/images/306_logo_school.gif" width="230" height="60" alt="Loyola University Chicago Home" border="0" /></a></td>
	<td id="column2" width="100%" valign="top" align="right"><div style="text-align:left;"><img src="images/hdr_news.gif" width="400" height="60" alt="University News" /></div></td></tr>
</table>
<!-- end header table -->


<!-- content table -->
<table id="content" summary="content container" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top" id="botpad" colspan="2"><div id="lrfloat">
<div id="pageblurb">The Loyola University Faculty Experts Database is brought to you by University Marketing and Communications. <a href="mailto:news@luc.edu">Contact us</a> with any questions.</div><!-- div: quick links --><!--#include virtual="/ssi/quicklinks.shtml" --></div></td></tr>


<!-- filter bar row -->
<tr><td id="filterbar" colspan="2"><a href="http://www.luc.edu/calendar"><img src="images/ucalendar_grey.gif" alt="University Calendar" border="0" height="15" width="138" align="right" /></a><form method="get" action="http://google.luc.edu/search"><input type="hidden" name="site" value="luc"/><input type="hidden" name="client" value="luc"/><input type="hidden" name="proxystylesheet" value="luc"/><input type="hidden" name="output" value="xml_no_dtd"/><div><img src="images/news_search.gif" width="84" height="12" alt="" /></div><div><input type="text" class="searchbox" name="q" maxlength="255" value="" /><input type="image" src="http://www.luc.edu/images/go_btn.gif" alt="Search" align="top" /></div></form>

</td></tr>
<!-- end filter bar row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- true content row -->
<tr valign="top">
<!-- column 1 -->
<td width="75%"><div class="text70">
<div class="column">
	<cfif getexisting1.recordcount gt 0>
	Our records indicate you have already taken the Loyola expert's survey. If you would like to update your Loyola Expert's profile, please contact Media Relations at <a href="mailto:media@luc.edu">media@luc.edu</a>.
	<cfelseif getexisting2.recordcount gt 0>
	Our records indicate that we already have a profile on record for you in the Loyola Expert's Database. If you would like to update your Loyola Expert's profile, please contact Media Relations at <a href="mailto:media@luc.edu">media@luc.edu</a>.
	<cfelseif qry_GetNameLookup.recordcount gt 0><cfoutput><form action="faculty_form_action.cfm" method="post">
		<table border="0" cellspacing="0" cellpadding="5" class="tabular">
			<tr>
				<th>Welcome #qry_GetNameLookup.FIRST_NAME# #qry_GetNameLookup.LAST_NAME#</th>
			</tr>
			<tr>
				<td><strong>Area of Expertise:</strong></td>
			</tr>
			<tr>
				<td>
				<textarea cols="45" rows="5" name="expertise"></textarea></td>
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
				<td><strong>a.	Have you been interviewed by media related to your area of expertise or to represent Loyola or other affiliation?</strong></td>
			</tr>
			<tr>
				<td>Check all that apply:
				<input type="checkbox" value="1" name="ME_AB">Broadcast
				<input type="checkbox" value="1" name="ME_AP">Print
				<input type="checkbox" value="1" name="ME_R">Radio
				<input type="checkbox" value="1" name="ME_O">Online</td>
			</tr>
			<tr>
				<td><strong>b.	If no, are you interested in responding to media inquiries regarding your expertise?</strong></td>
			</tr>
			<tr>
				<td>yes
				<input type="radio" name="INTEREST" value="1">no
				<input type="radio" name="INTEREST" value="0"></td>
			</tr>
			<tr>
				<td><strong>c. Do you understand and speak a foreign language well enough to serve as a resource for foreign language media outlets?</strong></td>
			</tr>
			<tr>
				<td>yes
				<input type="radio" name="PA_C" value="1">no
				<input type="radio" name="PA_C" value="0"></td>
			</tr>
			<tr>
				<td><strong>d. If yes, which language?</strong></td>
			</tr>
			<tr>
				<td>
				<textarea cols="45" rows="5" name="PA_D"></textarea></td>
			</tr>
			<tr>
				<th>Public Affairs Experience:</th>
			</tr>
			<tr>
				<td><strong>a.	Are there any areas of your research or expertise that relates to current public policy issues, either foreign or domestic?</strong></td>
			</tr>
			<tr>
				<td>yes
				<input type="radio" name="PA_A" value="1">no
				<input type="radio" name="PA_A" value="0"></td>
			</tr>
			<tr>
				<td><strong>b. If yes, briefly describe the public policy issue (100 words or less).</strong></td>
			</tr>
			<tr>
				<td>
				<textarea cols="45" rows="5" name="PA_B"></textarea></td>
			</tr>
			
			<tr>
				<td><strong>c.	Have you ever provided expert testimony for a government committee or panel?</strong></td>
			</tr>
			<tr>
				<td>yes
				<input type="radio" name="PA_E" value="1">no
				<input type="radio" name="PA_E" value="0"></td>
			</tr>
			<tr>
				<td><strong>d. If  yes, briefly descrive the policy issue (100 words or less).</strong></td>
			</tr>
			<tr>
				<td>
				<textarea cols="45" rows="5" name="PA_F"></textarea></td>
			</tr>
			<tr>
				<td><strong>What is the best way to follow up with you &mdash; e-mail or phone?</strong></td>
			</tr>
			<tr>
				<td>email <input type="radio" name="contact" value="email"> phone <input type="radio" name="contact" value="phone"></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="submit your information" class="button" /></td>
			</tr>
		</table><input type="hidden" name="lid" value="#session.loyolaId#">
	</form></cfoutput>
	<cfelse>The system cannot login you in. Please check your password and try again.
		
</cfif>
</div></div></td>
</tr>
<!-- end true content row -->

<!-- spacer --><tr><td colspan="2"><img src="http://www.luc.edu/images/space.gif" width="1" height="15" alt=" " border="0" /></td></tr>

<!-- row for promise -->
<tr><td colspan="2" id="bottomstripe"><img src="http://www.luc.edu/images/space.gif" width="352" height="18" alt="space" border="0" /></td></tr>


</table>
<!-- end main content table -->

<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/news_footer.cfm">


</body>
</html>
