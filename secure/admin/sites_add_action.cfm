
<cfquery name="insert_sites" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.sites(isactive,site_name,uri,maxrows,creator,description,ispublic,calendar,news)
				VALUES(1,'#form.site_name#','#form.url#',#form.maxrows#,#session.userid#,'#form.description#',#form.ispublic#,#form.calendar#,#form.news#)
		</cfquery>
		
		<cflocation url="sites_list.cfm" addtoken="No">