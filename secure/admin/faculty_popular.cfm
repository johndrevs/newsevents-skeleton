
<cfquery name="gettop5fac" datasource="#application.datasource_select#">
SELECT     COUNT(LID) AS totallogins, LID
FROM         CUNVMCS.FACULTY_LOG
GROUP BY LID
order by totallogins desc</cfquery>	 

<cfif gettop5fac.recordcount gt 0>
<cfset facultylist=#quotedvaluelist(gettop5fac.LID)#>	
<cfelse>
<cfset facultylist="'x','y'">	
</cfif>

<cfquery name="gettop5cat" datasource="#application.datasource_select#">
SELECT     COUNT(CATEGORY_LOG.CATEGORY_ID) AS totallogins, CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
FROM         CUNVMCS.CATEGORY_LOG, CUNVMCS.CATEGORIES
WHERE CATEGORIES.CATEGORY_ID=CATEGORY_LOG.CATEGORY_ID and CATEGORIES.ACTIVE=1 and sub=1
GROUP BY CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
order by totallogins desc</cfquery>	



<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Recently Viewed Experts</h2>

	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Name</th>
			<th>Count</th>
		</tr>
		
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
</CFQUERY><cfif read_swbd.last_name is not ''><tr><td><a href="faculty_popular_facultydetail.cfm?universal_id=#LID#&count=#totallogins#">#read_swbd.LAST_NAME#, #read_swbd.FIRST_NAME#</a></td><td>#totallogins#</td></tr></cfif></cfoutput>
<h2>Hot Topics</h2>

	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">
		<tr>
			<th>Topic</th>
			<th>Count</th>
		</tr>
	
	<cfoutput query="gettop5cat"><tr><td><a href="faculty_popular_categorydetail.cfm?category_id=#category_id#&count=#totallogins#">#category_name#</a></td><td>#totallogins#</td></tr></cfoutput>



</table>




</div>
</div>	

</div>	

