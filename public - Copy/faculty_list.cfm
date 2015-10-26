<cfquery name="getfaculty" datasource="#application.datasource_select#" maxrows="999">
SELECT distinct FACULTY.LID
		FROM CUNVMCS.FACULTY, CUNVMCS.FACULTY_REF
		WHERE 0=0 <cfif parameterexists(url.category_id)>AND FACULTY_REF.CATEGORY_ID=#url.category_id#</cfif> AND FACULTY_REF.FACULTY_ID=FACULTY.FACULTY_ID AND FACULTY_REF.ACTIVE=1
</cfquery>	

<cfif getfaculty.recordcount gt 0>
<cfset facultylist=#quotedvaluelist(getfaculty.LID)#>	
<cfelse>
<cfset facultylist="'x','y'">	
</cfif>
<!--- <cfoutput>#facultylist#</cfoutput> --->
<!--- <cfif parameterexists(url.category_id)>
<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORY_LOG(CATEGORY_LOG_ID, CATEGORY_ID, DATETIME)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#url.category_id# , SYSDATE)
				</cfquery>
</cfif> --->

<cfquery name="qry_GetNameLookup" datasource="#request.datasource_read#">
SELECT DISTINCT
             
				PERSON.LID,
				PERSON.FIRST_NAME,
				PERSON.LAST_NAME
                 
		
		 FROM 
              #request.datasource_schema#.person person

			  		 
WHERE PERSON.LID IN (#preservesinglequotes(facultylist)#) <cfif parameterexists(url.firstchar)> AND PERSON.LAST_NAME LIKE'#url.firstchar#%'</cfif>
<cfif parameterexists(form.criteria)> AND (upper(PERSON.LAST_NAME) LIKE upper('%#form.criteria#%') Or upper(PERSON.FIRST_NAME) LIKE upper('%#form.criteria#%'))</cfif>

		order by LAST_NAME 

             <!---  <CFABORT> --->
			  		 
         </cfquery> 


<cfinclude template="/newsevents/public/ssi/header_061813.cfm">


<article class="content wide">

<h2>Experts Directory Listed by Name</h2>
				<cfinclude template="ssi/experts_menu.cfm">

<p><CFLOOP INDEX="alpha" FROM ="65" TO="90">
   <CFOUTPUT>
<A HREF="faculty_list.cfm?firstchar=#chr(alpha)#">#chr(alpha)#</A> |
  </CFOUTPUT>
</CFLOOP></p>

<cfif parameterexists(url.category_id)>
<cfquery name="getcategory" datasource="#application.datasource_select#" maxrows=1>
SELECT CATEGORIES.CATEGORY_NAME
		FROM CUNVMCS.CATEGORIES
		WHERE CATEGORY_ID=#url.category_ID#</cfquery>
<h3><cfoutput>#getcategory.category_name#</cfoutput></h3>
<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORY_LOG(CATEGORY_LOG_ID, CATEGORY_ID, DATETIME)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#url.category_id# , SYSDATE)
				</cfquery>	

</cfif>

<p><form action="faculty_list.cfm" method="post"><input type="text" name="criteria"> <input type="submit" value="search" class="button" /></form>&nbsp; <a href="faculty_list.cfm"> View All</a></p>

<p>Please choose an expert from the list below.</p>
<ul>
<cfif #qry_GetNameLookup.recordcount# lt 1>
<li> There are no faculty members in this category <cfoutput>#getfaculty.recordcount#</cfoutput></li>
<cfelse>
<cfoutput query="qry_GetNameLookup"><cfquery name="qryGetTable_Preferred_Data" datasource="#request.datasource_read#" debug="yes">
			select * from #request.datasource_schema#.PREFERRED_DATA
			where LID = '#trim(LID)#'
			
		</cfquery>	<li><a href="faculty_detail.cfm?universal_id=#LID#"><cfif qryGetTable_Preferred_Data.OVERRIDE_LAST_NAME EQ "1">#trim(qryGetTable_Preferred_Data.MAIDEN_NAME)#<cfelse>#trim(qry_GetNameLookup.LAST_NAME)#</cfif>, <cfif qryGetTable_Preferred_Data.OVERRIDE_FIRST_NAME EQ "1">
#trim(qryGetTable_Preferred_Data.PREFERRED_FIRST_NAME)#<cfelse>#trim(qry_GetNameLookup.FIRST_NAME)#</cfif>
</a></li></cfoutput>
</cfif>
</ul>







<!--- <cfinclude template="/newsevents/public/ssi/news_nav.cfm">end main nav --->
<!---
<cfinclude template="/newsevents/public/ssi/news_nav.cfm">
--->
</div>
</div>
</div>
<cfinclude template="/newsevents/public/ssi/footer_061813.cfm">
