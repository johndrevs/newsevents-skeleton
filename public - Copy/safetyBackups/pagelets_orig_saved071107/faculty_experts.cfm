
<cfquery name="gettop5fac" datasource="#application.datasource_select#" maxrows=5>
SELECT     COUNT(LID) AS totallogins, LID
FROM         CUNVMCS.FACULTY_LOG
GROUP BY LID
order by totallogins desc</cfquery>	 

<cfif gettop5fac.recordcount gt 0>
<cfset facultylist=#quotedvaluelist(gettop5fac.LID)#>	
<cfelse>
<cfset facultylist="'x','y'">	
</cfif>

<cfquery name="gettop5cat" datasource="#application.datasource_select#" maxrows=5>
SELECT     COUNT(CATEGORY_LOG.CATEGORY_ID) AS totallogins, CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
FROM         CUNVMCS.CATEGORY_LOG, CUNVMCS.CATEGORIES
WHERE CATEGORIES.CATEGORY_ID=CATEGORY_LOG.CATEGORY_ID and CATEGORIES.ACTIVE=1 and sub=1
GROUP BY CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
order by totallogins desc</cfquery>	



<div class="pagelet_left">
<div class="pagelet_title">Loyola Experts</div>
<div class="pagelet_content">
<div class="vspace10b">
<dl>
	<dt><a href="faculty_list.cfm">Search for Experts by Name</a></dt>
	<dt><a href="faculty_category.cfm">Search for Experts by Category</a></dt>
</dl>
<table width="100%">
<tr>
	<td valign="top"><dl>
	<dt>Recently Viewed Experts</dt>
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
</CFQUERY><cfif read_swbd.last_name is not ''><dd><a href="faculty_detail.cfm?universal_id=#LID#&count=#totallogins#">#read_swbd.LAST_NAME#, #read_swbd.FIRST_NAME#</a></dd></cfif></cfoutput>
</dl> </td> 
	<td><dl>

	<dt>Hot Topics</dt>
	<cfoutput query="gettop5cat"><dd><a href="faculty_list.cfm?category_id=#category_id#&count=#totallogins#">#category_name#</a></dd></cfoutput>

</dl> </td>
</tr>
<tr>
<td colspan="2">
<dt>Featured Experts</dt>
<dd>&raquo; <a href="http://info.luc.edu/newsevents/public/news_release.cfm?newsID=1680">Business Ethics Experts</a></dd>
<dd>&raquo; <a href="http://info.luc.edu/newsevents/public/news_release.cfm?newsID=7040">Demographics Expert</a></dd>
<dd>&raquo; <a href="http://info.luc.edu/newsevents/public/news_release.cfm?newsID=1550">Gas Prices/Industry Experts</a></dd>
<dd>&raquo; <a href="http://info.luc.edu/newsevents/public/news_release.cfm?newsID=1563">Political Experts</a></dd>
</td>
</tr>
</table>




</div>
</div>	

</div>	

