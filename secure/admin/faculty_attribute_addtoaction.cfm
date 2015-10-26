<cfoutput>#form.category_id#</cfoutput>


<cfloop index="x" list="#form.category_id#"><cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.FACULTY_REF(FACULTY_REF_ID, CATEGORY_ID, FACULTY_ID)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#x# , #form.FACULTY_id#)
				</cfquery></cfloop>
				
			<cfoutput><cflocation url="faculty_attribute_detail.cfm?LID=#form.LID#" addtoken="No"></cfoutput> <!---<cfabort> --->