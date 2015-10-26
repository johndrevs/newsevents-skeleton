<!--- setting up image upload --->		
	<cfif #application.newsimage# is 1>		
		<cfset randnum='#RandRange(100000, 1000000)#'>			
		<cfif form.image is not''>
	
			<cffile action="UPLOAD" filefield="image" destination="#application.dir#/public/images/" nameconflict="MAKEUNIQUE" attributes="Normal">
			<cffile action="RENAME" source="#application.dir#/public/images/#serverfile#" destination="#application.dir#/public/images/#form.universal_id#.jpg"> 
		<cfelse>
			<cfset randnum='none'>
		</cfif>
	</cfif>
<!--- end image upload --->	
	
	
	<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.FACULTY(FACULTY_ID, UNIVERSAL_ID, FACULTY_DETAIL,LID)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,'x', '#form.faculty_detail#','#form.lid#')
				</cfquery><cflocation url="faculty_attribute_list.cfm" addtoken="No">