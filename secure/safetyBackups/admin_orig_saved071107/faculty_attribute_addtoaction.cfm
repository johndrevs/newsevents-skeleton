<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.FACULTY_REF(FACULTY_REF_ID, CATEGORY_ID, FACULTY_ID)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#url.category_id# , #url.FACULTY_id#)
				</cfquery>
				
			<cfoutput><cflocation url="faculty_attribute_detail.cfm?LID=#url.LID#" addtoken="No"></cfoutput>