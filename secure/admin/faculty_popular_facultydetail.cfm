
<cfquery name="gettop5fac" datasource="#application.datasource_select#">
SELECT     COUNT(LID) AS totallogins, LID
FROM         CUNVMCS.FACULTY_LOG
GROUP BY LID
order by totallogins desc</cfquery>	 
<cfquery name="gettop5facdet" datasource="#application.datasource_select#">
SELECT    datetime
FROM         CUNVMCS.FACULTY_LOG
where lid=#url.universal_id# and  (to_char(datetime, 'yyyy-mm-dd') >= to_char(#variables.daterangeend#, 'yyyy-mm-dd'))
order by datetime desc</cfquery>

<cfif gettop5fac.recordcount gt 0>
<cfset facultylist=#quotedvaluelist(gettop5fac.LID)#>	
<cfelse>
<cfset facultylist="'x','y'">	
</cfif>





<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Recently Viewed Experts</h2>
<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
<cfoutput query="gettop5fac"><CFQUERY NAME="read_swbd" datasource="#request.datasource_read#" maxrows="1">
SELECT DISTINCT
             
				PERSON.LID,
                PERSON.LAST_NAME,
		        PERSON.FIRST_NAME, 
				PERSON.MIDDLE_NAME,
				PERSON.ACADEMIC_LETTERS,
                PERSON.PREFERRED_DATA_EXISTS,
                PERSON.TITLE1           
		
		 FROM 
              #request.datasource_schema#.person person 
             
			  		 
         WHERE PERSON.LID='#gettop5fac.LID#'
</CFQUERY><cfif read_swbd.last_name is not ''><tr><th>#read_swbd.LAST_NAME#, #read_swbd.FIRST_NAME#</th></tr></cfif></cfoutput>
			
	
	<cfoutput query="gettop5facdet"><tr><td>#dateformat(datetime, "mmm dd.yyy")# #timeformat(datetime, "hh:mm:ss")#</td></tr></cfoutput>



</table>
	
		
	




</table>



<cfinclude template="/newsevents/secure/templates/footer.cfm">
