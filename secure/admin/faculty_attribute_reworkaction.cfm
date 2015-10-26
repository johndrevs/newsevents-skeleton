		
	<cfif #application.newsimage# is 1>	
	<cfset randnum='#RandRange(100000, 1000000)#'>			
		<cfif form.image is not''>
			<cffile action="UPLOAD" filefield="image" destination="#application.dir#/public/images/" nameconflict="MAKEUNIQUE" attributes="Normal">
			<cffile action="RENAME" source="#application.dir#/public/images/#serverfile#" destination="#application.dir#/public/images/#form.LID#.jpg">
		<cfelse>
				<cfset randnum='none'>
		</cfif>
	</cfif>
	
	
<cfquery name="updatenews" datasource="#application.datasource_update#">
update     CUNVMCS.FACULTY
SET       FACULTY_DETAIL='#form.faculty_detail#'
where faculty_id=#form.faculty_id#
</cfquery>

<cfoutput><cflocation url="faculty_attribute_detail.cfm?LID=#form.LID#" addtoken="No"></cfoutput>
