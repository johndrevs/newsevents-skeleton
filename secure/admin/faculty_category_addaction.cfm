<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORIES_REF(CATEGORIES_REF_ID, CATEGORY_ID, SUBCATEGORY_ID)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#url.category_id# , #url.subcategory_id#)
				</cfquery>
				
<cfoutput><cflocation url="faculty_subcategory_manage.cfm?category_id=#url.category_id#" addtoken="No"></cfoutput>
				
