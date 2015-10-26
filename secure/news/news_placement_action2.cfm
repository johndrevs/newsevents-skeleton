<cfif isdefined("form.post") or isdefined("form.publish")>
		
		assosciates publish			
		
		<cfif isdefined("form.post")>
			<cfloop list="#form.post#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.news_ref(newsID, siteID, actionDate,news_ref_level,userid)
					VALUES(#form.newsid#, #n#, SYSDATE,1,#session.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
		<cfif isdefined("form.publish")>
			<cfloop list="#form.publish#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpublish">
					INSERT INTO CUNVMCS.news_ref(newsID, siteID, actionDate,news_ref_level,userid)
					VALUES(#form.newsid#, #n#, SYSDATE,2,#session.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
	<cfelse>
You must choose at least one site to post or publish to.
	</cfif>
inserts into new

done  <p>
<cfoutput><cflocation url="news_placement.cfm?newsid=#newsid#" addtoken="No"></cfoutput>