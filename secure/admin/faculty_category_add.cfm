<cfset randid=timeformat(now(),"hhmmss")&RandRange(10000, 100000)>

<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORIES(CATEGORY_ID, CATEGORY_NAME, SUB)
					VALUES(#variables.randid#, '#form.category_name#', #form.sub#)
				</cfquery>
				
<cfif form.sub EQ 1>

<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORIES_REF(CATEGORIES_REF_ID, CATEGORY_ID, SUBCATEGORY_ID)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#form.category_id# , #variables.randid#)
				</cfquery>
 <cfoutput><cflocation url="faculty_subcategory_manage.cfm?category_id=#form.category_id#" addtoken="No"></cfoutput> 
<cfelse>
				
		 <cflocation url="faculty_category_manage.cfm" addtoken="No"> 
				
</cfif>

